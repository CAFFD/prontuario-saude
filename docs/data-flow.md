### Objetivo:
Descrever a jornada completa de um arquivo, desde o computador do médico até seu destino final, e seu subsequente apagamento.

### Diagrama de Sequência

``` mermaid
graph TD
    subgraph "Usuários"
        A["👨‍⚕️ Médico <br> (Uploader)"]
        B["👤 User <br> (Downloader)"]
    end

    subgraph "Portal Seguro de Documentos"
        C["{API Backend <br> (Node.js/Fastify)}"]
        D["(🗄️ Banco de Dados <br> (Metadados, Usuários))"]
        E["(📄 Armazenamento de Arquivos <br> 'Pasta Mágica')"]
    end

    A -- 1. Faz Upload do Arquivo --> C
    B -- 2. Acessa, Loga e Baixa Arquivos --> C
    
    E -- Gerencia --> D
    C -- Gerencia --> E
```

### Componentes:
- Médico (Uploader): O usuário que envia os documentos assinados para a plataforma.
- User (Downloader): O usuário que acessa o portal com login para visualizar e baixar os documentos.
- API Backend: O "cérebro" do sistema. Ele recebe todas as requisições, aplica as regras de negócio e gerencia os dados e os arquivos.
- Banco de Dados: Onde as informações sobre os arquivos (metadados como nome, data, quem enviou) e os dados dos usuários (login, senha criptografada) são armazenados.
- Armazenamento de Arquivos: Onde os arquivos PDF em si ficam guardados de forma segura (a "Pasta Mágica").

### Fluxos (As Setas):
- Seta 1 (Upload): Representa o médico enviando um novo arquivo para o sistema através da API.
- Seta 2 (Acesso e Download): Representa a recepcionista interagindo com a API para fazer login, solicitar a lista de documentos e baixar os arquivos desejados.
- Setas "Gerencia": Mostram que a API Backend é a única responsável por controlar o que é salvo e lido tanto no Banco de Dados quanto no Armazenamento de Arquivos.
