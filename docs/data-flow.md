### Objetivo:
Descrever a jornada completa de um arquivo, desde o computador do médico até seu destino final, e seu subsequente apagamento.

### Diagrama de Sequência

``` mermaid
graph TD
    subgraph "Usuários"
        A["👨‍⚕️ Médico <br> (Uploader)"]
        B["👤 User <br> (Downloader)"]
    end

    subgraph "Portal Seguro (VM Única)"
        C["{API Backend <br> (Node.js/Fastify)}"]
        D["(🗄️ Banco de Dados <br> Guarda Metadados E os Arquivos PDF)"]
    end

    A -- 1. Faz Upload do Arquivo --> C
    B -- 2. Acessa, Loga e Baixa Arquivos --> C
    
    C -- Salva e Consulta Tudo no --> D
```

### Componentes
- **Médico** (Uploader): O usuário que envia os documentos assinados para a plataforma.
- **User** (Downloader): O usuário que acessa o portal com login para visualizar e baixar os documentos.
- **API Backend**: Continua sendo o cérebro, processando todas as requisições.
- **Banco de Dados**: Agora tem a dupla responsabilidade de guardar tanto os metadados (informações sobre os arquivos) quanto os próprios arquivos PDF (usando um campo tipo BLOB).

### **Fluxos**
- **Seta 1** (Upload): Representa o médico enviando um novo arquivo para o sistema através da API.
- **Seta 2** (Acesso e Download): Representa a recepcionista interagindo com a API para fazer login, solicitar a lista de documentos e baixar os arquivos desejados.
- **Seta 3**: API agora centraliza todas as suas operações de armazenamento em um único lugar: o Banco de Dados.
