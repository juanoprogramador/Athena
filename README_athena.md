# Athena

Athena é um aplicativo Android local para monitoramento de rotina acadêmica, estudo próprio, sono, humor e localização. O foco do projeto é unificar dados pessoais de forma organizada, com baixo atrito de uso e com uma base preparada para crescimento contínuo.

A proposta é registrar eventos atômicos da rotina, preservar o histórico e permitir exportação completa dos dados para análise externa.

## Filosofia

Os dados dos estudantes são dos estudantes.

Isso significa que o usuário deve ter liberdade para exportar, copiar, analisar e reutilizar seus próprios registros sem bloqueios artificiais. O aplicativo existe para organizar e preservar informações, não para aprisioná-las.

Athena também adota uma filosofia de modulação. A estrutura precisa ser aberta para novas funções, novos tipos de registros e, no futuro, possíveis extensões da comunidade.

## O que o Athena registra

- estudo próprio com timer e registros manuais
- árvore livre de projetos, pastas e subpastas
- tarefas e subtarefas com conclusão
- sono
- humor diário
- localização com entrada e saída de locais
- prazos e agenda
- exportação dos dados em planilhas e backup completo

## Características principais

- funcionamento local no Android
- sem necessidade de servidor
- uso offline
- estrutura hierárquica livre
- conclusão e restauração de projetos e pastas
- histórico preservado
- banco preparado para migrações
- exportação livre dos dados
- arquitetura pensada para crescer sem perda de registros

## Estrutura conceitual

O aplicativo não impõe uma classificação rígida para estudos. O usuário cria sua própria árvore de organização.

Exemplos possíveis:

- Vestibular
  - Matemática
    - Matemática 1
      - Geometria Analítica
- Graduação
  - Semestre 1
    - Cálculo I
- Projetos pessoais
  - Programação
    - Flutter

Cada nó pode ter filhos, status, prazo e registros associados.

## Requisitos de uso

- Android
- dados locais
- organização livre
- baixa fricção para registrar eventos
- exportação em formato útil para outras ferramentas

## Estrutura futura

Athena foi pensado para receber:

- novos módulos
- novos tipos de eventos
- novos gráficos
- extensões futuras
- integração opcional com ferramentas externas

A prioridade é preservar a compatibilidade com os dados já existentes ao longo do tempo.

## Licença e uso dos dados

O aplicativo deve ser construído para que o usuário permaneça dono de suas informações. A exportação e o backup devem ser simples, transparentes e completos.

## Status do projeto

Projeto em concepção. A base arquitetural está sendo definida para a primeira implementação com foco em:

- estudos
- sono
- localização
- humor
- exportação
- organização hierárquica
