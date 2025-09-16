# Title: Guia de Instalação e Execução
Este guia descreve os passos para configurar a impressora virtual em uma máquina Windows.



### Pré-requisitos:
- Acesso de administrador na máquina para instalar programas e impressoras.
- Instalador do **Ghostscript**: [Baixar aqui](https://www.ghostscript.com/releases/gsdnld.html)
- Instalador do **RedMon**: (Geralmente `redmon17.zip` ou similar, encontrado em sites de download de software).


----
### Passo 1: Instalar os Programas de Base
1. Execute o instalador do **Ghostscript**. Anote o caminho da instalação (ex: `C:\Program Files\gs\gs10.03.1`).
2. Execute o instalador do RedMon. Siga os passos padrão.

### Passo 2: Salvar o Script PowerShell
1. Crie uma pasta estável para o script. Exemplo: `C:\VirtualPrinter\scripts`.
2. Salve o código do `processador.ps1` fornecido anteriormente dentro desta pasta.
3. Edite o script e verifique se a variável `$ghostscriptExe` aponta para o caminho correto da sua instalação do Ghostscript.

### Passo 3: Criar a Impressora Virtual
1. No menu Iniciar, procure por "Impressoras e Scanners" e abra.
2. Clique em "Adicionar um dispositivo" > "A impressora que eu quero não está na lista".
3. Selecione "Adicionar uma impressora local ou de rede usando configurações manuais".
4. Selecione "Criar uma nova porta" e, no tipo, escolha "**Redirected Port**". Avance.
5. Na janela de drivers, escolha um driver PostScript genérico (ex: "**Microsoft PS Class Driver**" ou "HP Color LaserJet 2800 Series PS").
6. Dê um nome para a impressora: `Assinar com GOV.BR`.
7. Conclua o assistente sem compartilhar a impressora.

### Passo 4: Configurar a Porta RedMon
1. Volte para "**Impressoras e Scanners**", encontre a impressora "**Assinar com GOV.BR**", clique em "**Gerenciar**" > "**Propriedades da Impressora**".
2. Vá para a aba "**Portas**". A porta `RPT1`: (ou similar) estará selecionada. Clique em "Configurar Porta...".
3. Preencha os campos da seguinte forma:
   1. **Redirect this port to the program**: `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`
   2. **Arguments for this program**: `-ExecutionPolicy Bypass -File "C:\VirtualPrinter\scripts\processador.ps1"` (Ajuste o caminho se você salvou o script em outro lugar)
   3.** Output**: Program handles output
   4. **Run as User**: Marcado
   5. **Run**: Normal
4. Clique em OK para salvar e fechar as janelas.

### Passo 5: Rodar o Código (Testar a Solução)
1. Abra o Bloco de Notas ou qualquer editor de texto.
2. Digite "Teste de impressão".
3. Vá em `Arquivo > Imprimir`.
4. Selecione a impressora "**Assinar com GOV.BR**" e clique em "**Imprimir**".
5. **Resultado esperado**:
   1. O navegador deve abrir automaticamente no site do Assinador ITI.
   2. Um arquivo chamado `documento_para_assinar.pdf` deve aparecer na sua Área de Trabalho.
   3. Um arquivo de log deve ser criado em `C:\Temp\LogsImpressora`.
