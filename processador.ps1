# Caminho para o executável do Ghostscript (verifique a versão correta)
$ghostscriptExe = "C:\Program Files\gs\gs10.06.0\bin\gswin64c.exe"

# Pasta dedicada para salvar os PDFs que serão assinados
$nomePastaDedicada = "Documentos Para Assinar"
$pastaBase = [System.Environment]::GetFolderPath('MyDocuments') # Direciona para a pasta "Meus Documentos"
$pastaTemporaria = Join-Path -Path $pastaBase -ChildPath $nomePastaDedicada

# URL do assinador oficial do governo
$urlAssinadorGov = "https://assinador.iti.br/"

# Log para depuração
$logFolder = "C:\VirtualPrinter\logs" # Ajustado para a pasta do projeto
if (-not (Test-Path $logFolder)) { New-Item -ItemType Directory -Force -Path $logFolder }
$logFile = Join-Path -Path $logFolder -ChildPath "log_assinatura.txt"

Function Write-Log {
    param ([string]$Message)
    $logMessage = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $Message"
    Add-Content -Path $logFile -Value $logMessage
}

# --- PROCESSO PRINCIPAL ---
try {
    Write-Log "Iniciando processo de assinatura guiada."
    
    # Garante que a pasta de destino exista. Se não existir, cria automaticamente.
    if (-not (Test-Path $pastaTemporaria)) {
        New-Item -ItemType Directory -Path $pastaTemporaria | Out-Null
        Write-Log "Pasta de destino '$pastaTemporaria' criada."
    }

    # Nome do arquivo temporário que será criado na pasta dedicada
    $nomeArquivoTemp = "documento_para_assinar.pdf"
    $caminhoCompletoPDF = Join-Path -Path $pastaTemporaria -ChildPath $nomeArquivoTemp

    # O RedMon envia o conteúdo da impressão via "standard input".
    $inputStream = [System.Console]::OpenStandardInput()

    # Configura e executa o Ghostscript para converter a impressão para PDF
    $processInfo = New-Object System.Diagnostics.ProcessStartInfo
    $processInfo.FileName = $ghostscriptExe
    $processInfo.RedirectStandardInput = $true
    $processInfo.UseShellExecute = $false
    $processInfo.CreateNoWindow = $true
    $processInfo.Arguments = "-sDEVICE=pdfwrite -o `"$caminhoCompletoPDF`" -f -"

    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $processInfo
    $process.Start() | Out-Null
    $inputStream.CopyTo($process.StandardInput.BaseStream)
    $process.StandardInput.Close()
    $process.WaitForExit()

    if ($process.ExitCode -ne 0) {
        throw "Ghostscript falhou ao criar o PDF."
    }

    Write-Log "PDF temporário criado em: $caminhoCompletoPDF"

    # 1. Abre o navegador no site do assinador
    Write-Log "Abrindo o navegador em $urlAssinadorGov"
    Start-Process $urlAssinadorGov

    # 2. Abre a pasta onde o arquivo foi salvo para o usuário arrastar/selecionar
    Invoke-Item $pastaTemporaria

    Write-Log "Processo de guia finalizado. Aguardando ação do usuário."
}
catch {
    Write-Log "ERRO: $($_.Exception.Message)"
    [System.Windows.Forms.MessageBox]::Show("Ocorreu um erro ao preparar o documento para assinatura. Verifique o log.", "Erro - Impressora GOV.BR", "OK", "Error")
}