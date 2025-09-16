# Title: Arquitetura da Solução


### *Objetivo*:
A solução é baseada na interceptação de um processo padrão do sistema operacional (impressão) e na orquestração de ferramentas de linha de comando para atingir o resultado desejado.


----
### *Componentes da Arquitetura*
- **Sistema Operacional (Windows)**: Fornece o subsistema de impressão, a interface de diálogo e o ambiente onde todos os outros componentes rodam.
- **Driver de Impressora PostScript**: Atua como um "tradutor" universal. Qualquer aplicação que imprime gera um arquivo no formato PostScript, que é padronizado e independente do software de origem.
- **RedMon (Redirect Port Monitor)**: É o gatilho da nossa automação. Ele se registra no Windows como uma porta de impressora válida, mas em vez de se comunicar com um hardware, ele executa um programa ou script, servindo como a "cola" entre o SO e nossa lógica customizada.
- **Ghostscript**: É o motor de conversão. Uma ferramenta robusta e confiável que interpreta o arquivo PostScript e o converte para o formato PDF com alta fidelidade.
- **Script PowerShell (processador.ps1)**: É o cérebro (orquestrador) da solução. Ele contém a lógica de negócio: receber a impressão, definir nomes de arquivos, chamar o Ghostscript, tratar erros, e guiar o usuário abrindo o navegador.
- **Navegador Web**: Atua como a interface de assinatura. A solução delega a tarefa crítica e de segurança da assinatura digital para a ferramenta oficial e externa do governo, garantindo a validade jurídica do processo.

----
### Diagrama de Fluxo de Dados e Controle
``` mermaid

graph TD
    subgraph "Máquina do Usuário"
        A(Aplicação Windows) --|1. Imprimir|--> B{Subsistema de Impressão do Windows};
        B --|2. Seleciona 'Assinar com GOV.BR'|--> C(Driver PostScript);
        C --|3. Gera fluxo de dados PostScript|--> D(Porta RedMon);
        D --|4. Aciona e envia dados para|--> E[Script 'processador.ps1'];
        E --|5. Repassa dados para|--> F(Ghostscript);
        F --|6. Gera arquivo|--> G[/PDF na Área de Trabalho/];
        E --|7. Após sucesso, executa comando para abrir|--> H(Navegador Web Padrão);
    end
    H --|8. Usuário interage com|--> I((Site Assinador ITI - gov.br));

```
