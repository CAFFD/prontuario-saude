# ADR-001: Escolha do PowerShell como Linguagem de Scripting

### **Status**: Decidido

----

### **Contexto**: 
Era necessária uma linguagem para orquestrar as ações (receber a impressão, chamar o Ghostscript, abrir o navegador) de forma confiável no ambiente Windows.

### **Decisão**:
Optou-se por usar o PowerShell.

### **Justificativa**:
- **Nativo do Windows**: Está presente em todas as versões modernas do Windows, eliminando a necessidade de instalar interpretadores ou runtimes adicionais (como Python ou Node.js) na máquina de cada usuário, o que simplifica drasticamente a distribuição.
  
- **Integração com o Sistema**: Possui acesso completo e simplificado a funcionalidades do Windows, como manipulação de arquivos, variáveis de ambiente ($env:USERNAME), e o comando Start-Process para abrir URLs e programas.

- **Confiabilidade e Suporte Corporativo**: É a ferramenta de automação padrão da Microsoft, amplamente aceita e gerenciável em ambientes corporativos.
