# Impressora Virtual para Alfresco (Virtual Printer Gateway)

![Status do Projeto](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)

Um sistema de impressora virtual para Windows que captura trabalhos de impressão, os converte para PDF e os arquiva de forma inteligente no sistema de gestão de conteúdo Alfresco, enriquecendo-os com metadados.

---

## Tabela de Conteúdos

1.  [Sobre o Projeto](#sobre-o-projeto)
2.  [Tecnologias Utilizadas](#tecnologias-utilizadas)
3.  [Pré-requisitos](#pré-requisitos)

---

## Sobre o Projeto

Este projeto foi criado para resolver o desafio de digitalizar e arquivar documentos de sistemas legados ou de qualquer aplicação Windows que não possui uma integração direta com sistemas de gestão documental. Ao criar uma "impressora virtual", permitimos que qualquer usuário envie um documento diretamente para o repositório central (Alfresco) de forma organizada e padronizada, solicitando metadados essenciais no processo.

---

## Tecnologias Utilizadas

* **Linguagem Principal:** [Python 3](https://www.python.org/)
* **Captura de Impressão:** [RedMon (Redirect Port Monitor)](https://www.ghostscript.com/download/gpl-release.html)
* **Conversão para PDF:** [Ghostscript](https://www.ghostscript.com/)
* **Repositório de Documentos:** [Alfresco Community Edition](https://www.alfresco.com/products/community-edition)

---

## Pré-requisitos

Antes de começar, garanta que você tenha os seguintes softwares instalados e configurados:

* Uma instância do **Alfresco Community** rodando e acessível pela rede.
* **Python 3.8+** instalado e adicionado ao PATH do sistema.
* **Ghostscript** instalado.
* **RedMon** instalado.
