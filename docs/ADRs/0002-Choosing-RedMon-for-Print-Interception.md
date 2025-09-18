# ADR-002: Escolha do RedMon para Interceptação de Impressão

### Status: Decidido


----
### **Contexto**:
Precisávamos de um mecanismo para interceptar um trabalho de impressão do Windows e redirecioná-lo para nosso script.

### **Decisão**: 
Optou-se por usar o RedMon (Redirect Port Monitor).

### **Justificativa**:
- **Solução Padrão de Mercado**: É a ferramenta mais conhecida, estável e utilizada para esta finalidade específica há décadas. É uma solução comprovada.

- **Simplicidade e Leveza**: É um programa pequeno, de fácil instalação e configuração, com baixo consumo de recursos.

- **Custo**: É gratuito (licença GPL), o que elimina custos de licenciamento.

- **Alternativa**: A alternativa seria desenvolver um monitor de porta customizado usando APIs complexas do Windows, o que aumentaria o tempo e a complexidade do projeto em ordens de magnitude.
