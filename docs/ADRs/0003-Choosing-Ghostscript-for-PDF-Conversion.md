# ADR-003: Escolha do Ghostscript para Conversão PDF

### **Status**: Decidido


----
### **Contexto**: 
Era necessário converter o formato de impressão padrão (PostScript) para um formato de documento universal e estável (PDF).

### **Decisão**:
Optou-se por usar o Ghostscript.

### **Justificativa**:

- **Padrão Ouro Open-Source**: É o interpretador PostScript e PDF de código aberto mais poderoso e compatível do mercado.

- **Alta Fidelidade**: Garante que a aparência do documento original seja preservada com precisão no PDF final.

- **Interface de Linha de Comando**: Possui uma interface de comando robusta, ideal para automação via script, permitindo controle fino sobre a qualidade e as propriedades do PDF de saída.

- **Custo**: É gratuito (licença GPL), evitando custos com bibliotecas comerciais de manipulação de PDF.
