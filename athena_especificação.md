Athena — Especificação Técnica v1.0

1. Objetivos Arquiteturais

Objetivos obrigatórios

- Android nativo através de Flutter.
- Funcionamento offline.
- Sem dependência de servidor.
- Banco local.
- Migrações versionadas.
- Exportação completa dos dados.
- Estrutura preparada para crescimento.
- Nenhuma perda de dados em atualizações.

Objetivos de longo prazo

- Sistema de extensões.
- Possível sincronização opcional.
- Possível versão desktop.
- Possível comunidade de plugins.

---

2. Stack Tecnológica

Aplicação

Flutter

Gerenciamento de Estado

Riverpod

Navegação

GoRouter

Banco

SQLite

ORM

Drift

Localização

Geolocator

Geofence

Geofencing API

Exportação

Excel Package

Gráficos

fl_chart

Notificações

Flutter Local Notifications

---

3. Arquitetura Geral

UI
│
├── Screens
├── Components
└── ViewModels
      │
      ▼
Application Layer
      │
├── Services
├── Repositories
└── Use Cases
      │
      ▼
Persistence Layer
      │
├── Drift
├── SQLite
└── Migrations

Nenhuma tela deve acessar o banco diretamente.

Tudo passa por Services e Repositories.

---

4. Modelo Principal

O núcleo do sistema é uma árvore.

Tudo deriva dela.

Node
│
├── Vestibular
│
├── Matemática
│
├── Matemática 1
│
└── Geometria Analítica

Não existe diferença estrutural entre:

- pasta
- matéria
- projeto
- semestre
- disciplina

Todos são Nodes.

---

5. Entidades

Node

Representa qualquer item da árvore.

id INTEGER PRIMARY KEY

parent_id INTEGER NULL

name TEXT

description TEXT NULL

status TEXT

due_date DATETIME NULL

created_at DATETIME

updated_at DATETIME

completed_at DATETIME NULL

archived_at DATETIME NULL

Status possíveis

active

completed

archived

---

StudySession

id INTEGER PRIMARY KEY

node_id INTEGER

started_at DATETIME

ended_at DATETIME

duration_seconds INTEGER

notes TEXT NULL

created_at DATETIME

---

Task

id INTEGER PRIMARY KEY

node_id INTEGER

parent_task_id INTEGER NULL

title TEXT

completed BOOLEAN

completed_at DATETIME NULL

created_at DATETIME

Permite subtarefas infinitas.

---

SleepSession

id INTEGER PRIMARY KEY

started_at DATETIME

ended_at DATETIME NULL

status TEXT

created_at DATETIME

Status

sleeping

awake

interrupted

---

MoodEntry

id INTEGER PRIMARY KEY

mood TEXT

note TEXT NULL

created_at DATETIME

---

MoodTag

id INTEGER PRIMARY KEY

name TEXT

---

MoodEntryTag

entry_id INTEGER

tag_id INTEGER

Relacionamento N:N.

---

Location

id INTEGER PRIMARY KEY

name TEXT

latitude REAL

longitude REAL

radius INTEGER

active BOOLEAN

created_at DATETIME

---

LocationEvent

id INTEGER PRIMARY KEY

location_id INTEGER

event_type TEXT

created_at DATETIME

Tipos

entered

left

---

ExportHistory

id INTEGER PRIMARY KEY

type TEXT

file_path TEXT

created_at DATETIME

---

6. Sistema de Conclusão

Nunca apagar.

Nunca deletar.

Sempre alterar estado.

Exemplo:

Matemática 1

status = completed

O item desaparece da área principal.

Permanece acessível.

---

7. Sistema de Estatísticas

Estatísticas de estudo

Calculadas dinamicamente.

Nunca armazenadas.

Exemplos:

- tempo total
- tempo semanal
- tempo mensal
- tempo por nó
- tempo por ancestral

---

Agregação Hierárquica

Exemplo:

Matemática
├── M1 = 10h
├── M2 = 15h
└── M3 = 20h

Resultado:

Matemática = 45h

Obtido automaticamente.

---

8. Telas

Home

Resumo rápido.

Widgets:

- estudo hoje
- sono ontem
- humor atual
- próximos prazos

---

Estudos

Estrutura principal.

Funcionalidades:

- criar nó
- editar nó
- mover nó
- concluir nó
- restaurar nó
- iniciar timer

---

Timer

Tela dedicada.

Botões:

▶ Iniciar

⏸ Pausar

■ Finalizar

---

Sono

Botões:

Vou dormir

Acordei

Perdi o sono

---

Localização

Lista:

Casa

Cursinho

Biblioteca

Cadastro livre.

---

Humor

Escala:

Excelente

Bom

Neutro

Ruim

Péssimo

Tags múltiplas.

Campo de observação.

---

Agenda

Mostra:

- vencidos
- hoje
- semana
- futuro

---

Estatísticas

Gráficos:

- por projeto
- por pasta
- por ancestral
- por período

---

Exportação

Botões:

Exportar Excel

Exportar CSV

Backup SQLite

---

9. Estrutura de Pastas Flutter

lib/

├── core/
│
├── data/
│   ├── database/
│   ├── repositories/
│   └── models/
│
├── features/
│
│   ├── study/
│   ├── sleep/
│   ├── mood/
│   ├── location/
│   ├── statistics/
│   ├── export/
│   └── agenda/
│
├── shared/
│
├── widgets/
│
└── main.dart

---

10. Ordem de Implementação

Sprint 1

Infraestrutura

- Flutter
- Drift
- Riverpod
- Migrações

---

Sprint 2

Árvore Hierárquica

- Node
- CRUD
- navegação
- conclusão

---

Sprint 3

Estudos

- timer
- sessões
- agregações

---

Sprint 4

Sono

- estados
- registros
- histórico

---

Sprint 5

Humor

- registros
- tags
- observações

---

Sprint 6

Localização

- cadastro
- geofence
- eventos

---

Sprint 7

Agenda

- prazos
- notificações

---

Sprint 8

Estatísticas

- gráficos
- agregações

---

Sprint 9

Exportação

- Excel
- CSV
- Backup

---

11. Preparação para Plugins

Mesmo sem implementar agora, reservar:

Plugin

PluginRegistry

PluginAction

PluginPage

no núcleo.

Isso evita uma grande refatoração futura.

---

12. Regra Fundamental

O ativo mais valioso do Athena não é a interface.

Não são os gráficos.

Não são os timers.

O ativo principal é o histórico de dados acumulado ao longo dos anos.

Toda decisão técnica deve priorizar:

- preservação dos dados
- portabilidade
- rastreabilidade
- compatibilidade futura