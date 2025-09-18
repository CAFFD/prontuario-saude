### Objetivo:
Descrever a jornada completa de um arquivo, desde o computador do médico até seu destino final, e seu subsequente apagamento.

### Diagrama de Sequência

``` mermaid
graph TD
    subgraph "Cliente"
        A["👨‍⚕️ Médico via Navegador <br>(Frontend React)"]
    end

    subgraph "Nuvem / Servidor"
        B["{API Backend <br>(Node.js/Fastify)}"]
        C["[(📄 Armazenamento Temporário <br> 'Pasta Mágica')]"]
        D["📧 Destinatário Final <br> (E-mail, Outro Sistema, etc.)"]
        E["(🧹 Processo Agendado <br> 'Limpeza Automática')"]
    end

    A -- 1. Upload do Arquivo Assinado --> B
    B -- 2. Salva na 'Pasta Mágica' --> C
    C -- 3. Envia para o Destinatário Final --> D
    E -- 4. Apaga arquivos antigos de --> C
```

- Passo 1: O Médico faz o upload para a API Backend.
- Passo 2: A API Backend armazena o arquivo na Pasta Mágica.
- Passo 3: O arquivo que está na Pasta Mágica é a fonte de dados que é enviada para o Destinatário Final.
(Nota para os desenvolvedores: A API Backend é o "ator" que executa esta ação de envio).
- Passo 4: O Processo de Limpeza atua sobre a Pasta Mágica para remover os arquivos.
