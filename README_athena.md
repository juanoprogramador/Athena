# Athena

Athena é um aplicativo Android focado em monitoramento acadêmico, organização pessoal e análise de dados de estudo.

O objetivo do projeto é permitir que estudantes centralizem informações importantes da rotina em uma única plataforma, registrando eventos como estudo, sono, humor, localização e progresso de projetos.

O projeto foi concebido com uma filosofia simples:

> Os dados dos estudantes pertencem aos estudantes.

Todas as informações registradas devem permanecer acessíveis, exportáveis e reutilizáveis pelo usuário em ferramentas externas, modelos de IA, planilhas ou sistemas próprios.

---

# Filosofia do Projeto

Athena foi projetado seguindo alguns princípios fundamentais:

- O usuário é dono dos seus dados.
- Nenhum dado importante deve ser perdido em atualizações.
- Tudo deve funcionar offline.
- O aplicativo não depende de servidores.
- A estrutura deve ser flexível o suficiente para acompanhar anos de uso.
- O sistema deve ser preparado para futuras extensões e plugins.
- O banco de dados é o ativo mais importante do projeto.

---

# Funcionalidades Planejadas

## Estudos

- Estrutura hierárquica ilimitada
- Pastas e subpastas
- Projetos
- Sessões de estudo
- Timer integrado
- Registro manual de sessões
- Tarefas e subtarefas
- Conclusão e restauração de projetos
- Estatísticas e gráficos

Exemplo:

```text
Vestibular
├── Matemática
│   ├── Matemática 1
│   ├── Matemática 2
│   └── Matemática 3
│
├── Física
└── Química
```

---

## Sono

Registro simplificado:

- Vou dormir
- Acordei
- Perdi o sono

O sistema calcula automaticamente:

- duração
- média semanal
- média mensal

---

## Humor

Registro rápido do estado emocional.

Exemplos:

- Excelente
- Bom
- Neutro
- Ruim
- Péssimo

Com suporte para múltiplas tags:

- Motivado
- Cansado
- Ansioso
- Estressado
- Sonolento

E observações livres.

---

## Localização

Monitoramento automático por geofence.

Exemplos:

- Casa
- Cursinho
- Biblioteca

Eventos registrados:

```text
07:02 saiu de Casa

07:51 chegou ao Cursinho

12:31 saiu do Cursinho

13:10 chegou em Casa
```

---

## Agenda

Gerenciamento de prazos.

Suporte para:

- data definida
- sem prazo ("Algum dia")

Visualizações:

- Hoje
- Esta semana
- Futuro
- Atrasados

---

## Exportação

O usuário poderá exportar seus dados em:

- Excel (.xlsx)
- CSV
- Backup completo do banco SQLite

---

# Arquitetura

## Stack

- Flutter
- Riverpod
- GoRouter
- Drift
- SQLite
- Geolocator
- fl_chart

---

## Organização

```text
lib/

├── core/
│
├── data/
│   ├── database/
│   ├── repositories/
│   └── models/
│
├── features/
│   ├── study/
│   ├── sleep/
│   ├── mood/
│   ├── location/
│   ├── statistics/
│   ├── export/
│   └── agenda/
│
├── routes/
│
├── shared/
│
├── widgets/
│
└── main.dart
```

---

# Modelo Principal

O núcleo do Athena é uma árvore hierárquica.

Todos os elementos de estudo são representados por um `Node`.

Exemplos:

- pasta
- matéria
- disciplina
- semestre
- projeto

Todos são armazenados da mesma forma.

Isso permite:

- profundidade ilimitada
- reorganização simples
- estatísticas por qualquer nível da árvore

---

# Estado dos Itens

Nenhum item é removido fisicamente.

Estados possíveis:

```text
active
completed
archived
```

Itens concluídos desaparecem da área principal, mas continuam acessíveis e podem ser restaurados.

---

# Banco de Dados

O projeto utiliza:

- SQLite
- Drift

Todo o banco será versionado por migrações.

Objetivo:

- permitir evolução contínua
- preservar compatibilidade
- evitar perda de dados

---

# Começando

## Flutter

Verifique a instalação:

```bash
flutter doctor
```

Instale dependências:

```bash
flutter pub get
```

Execute o projeto:

```bash
flutter run
```

---

## GitHub Codespaces

Athena foi pensado para funcionar também em GitHub Codespaces.

Para desenvolvimento Web:

```bash
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080
```

Após a execução, abra a porta publicada pelo Codespaces.

---

# Estrutura Inicial Criada

- `lib/main.dart`
- `lib/app.dart`
- `lib/core/app_theme.dart`
- `lib/routes/app_router.dart`
- `lib/features/study/study_screen.dart`
- `lib/data/models/node.dart`
- `lib/data/repositories/node_repository.dart`
- `lib/data/database/app_database.dart`

Esta base já inclui:

- configuração do `ProviderScope` com Riverpod
- navegação inicial com GoRouter
- modelo `Node` para a árvore de estudos
- repositório em memória para validar o fluxo
- estrutura inicial para Drift
- organização preparada para crescimento modular

---

# Roadmap

## Fase 1

- Infraestrutura Flutter
- Riverpod
- Drift
- Migrações

## Fase 2

- Estrutura hierárquica de estudos
- CRUD de Nodes
- Conclusão e restauração

## Fase 3

- Timer de estudo
- Sessões de estudo

## Fase 4

- Sono

## Fase 5

- Humor

## Fase 6

- Localização

## Fase 7

- Agenda

## Fase 8

- Estatísticas

## Fase 9

- Exportação

---

# Visão de Longo Prazo

Athena não pretende ser apenas um timer de estudos.

O objetivo é se tornar uma plataforma pessoal de observação e análise da rotina acadêmica, construída sobre dados locais, portáveis e controlados pelo próprio usuário.