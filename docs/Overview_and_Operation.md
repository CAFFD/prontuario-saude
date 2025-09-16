# Title: Impressora Virtual para Assinatura Guiada com `gov.br`

### *Objetivo*:
Simplificar o processo de preparação de um documento para assinatura digital na plataforma gov.br. 
A solução visa reduzir os passos manuais do usuário, automatizando a conversão do documento para PDF 
e o direcionamento para a ferramenta de assinatura oficial.


----
### Como Funciona (Fluxo do Usuário)
Do ponto de vista do usuário, o processo é extremamente simples:
- O usuário abre um documento em qualquer aplicação Windows (Word, Excel, sistema interno, etc.).
- Ele aciona a função de impressão (Ctrl+P).
- Na lista de impressoras disponíveis, ele seleciona a impressora virtual, nomeada de forma intuitiva como "Imprimir com GOV.BR".
- Ao clicar em "Imprimir", a mágica acontece:
- O documento é convertido para um arquivo PDF e salvo na Área de Trabalho do usuário ou em alguma paste específica (ex: /impressões).
- O navegador de internet padrão é aberto automaticamente na página do Assinador ITI (assinador.iti.br).
- O usuário então prossegue no site do governo: escolhe o PDF que está em sua Área de Trabalho (ou em /impressões), faz o login com sua conta gov.br, assina digitalmente e, ao final, baixa o documento assinado.


----
### Como Funciona (Fluxo Técnico do Script)
Nos bastidores, o script processador.ps1 executa as seguintes ações:
- Recepção: O script é acionado pela porta RedMon e recebe o trabalho de impressão em formato PostScript (PS) através da entrada padrão (standard input).
- Preparação: Ele define um nome e um local de fácil acesso para o arquivo de saída (ex: documento_para_assinar.pdf na Área de Trabalho).
- Conversão: O script invoca o Ghostscript em segundo plano, passando o fluxo de impressão recebido. O Ghostscript realiza a conversão de PostScript para PDF e salva o arquivo no local definido.
- Verificação: O script aguarda o término do processo do Ghostscript e verifica se a conversão foi bem-sucedida.
- Ação Guiada: Após a criação do PDF, o script executa o comando Start-Process no PowerShell para abrir a URL do Assinador ITI no navegador padrão do usuário.
- Registro (Logging): Todas as etapas importantes (início, criação do PDF, erro, sucesso) são registradas em um arquivo de log (log_assinatura.txt) para facilitar a depuração de problemas.
