# Banco de Dados e Modelos

## O Modelo Principal: Node

A inovação principal do modelo de dados do Athena é não usar tabelas separadas para estruturas como "Pastas", "Matérias" ou "Projetos". Todos esses conceitos são reduzidos a uma única entidade poderosa: o **Node** (Nó).

O núcleo do sistema é uma árvore hierárquica genérica construída ligando Nodes aos seus respectivos pais (`parent_id`).

**Exemplo Lógico:**

```text
Node (Vestibular)
 ├── Node (Matemática)
 │    ├── Node (Matemática 1)
 │    │    └── Node (Geometria Analítica)
```

A profundidade da árvore é ilimitada e as estatísticas de tempo de estudo são calculadas dinamicamente percorrendo a árvore de baixo para cima (agregando os totais dos filhos nos nós pais).

---

## Diagrama Entidade-Relacionamento (Conceitual)

```text
Node (Raiz / Qualquer elemento)
  │
  ├── StudySession (Múltiplas sessões de estudo registradas no nó)
  │
  ├── Task (Tarefas daquele nó)
  │     │
  │     └── Task (Subtarefas em loop infinito via parent_task_id)
  │
  └── Attachment (Futuro - anexos fotográficos/pdfs do nó)

MoodEntry (Registro diário de humor)
  │
  └── MoodEntryTag (Tabela associativa)
        │
        └── MoodTag (Tags que descrevem sentimentos extras)

Location (Locais físicos monitorados)
  │
  └── LocationEvent (Eventos de entrada e saída por geofence)

SleepSession (Intervalos de sono e despertares)

ExportHistory (Histórico de relatórios gerados e rotinas de backup)
```

---

## Estrutura das Tabelas (Esquema Físico Simplificado)

O banco é implementado usando **SQLite** com o ORM **Drift**. Abaixo estão as colunas fundamentais planejadas:

### 1. Nodes

Representa qualquer item da árvore de estudos.

- `id` INTEGER PRIMARY KEY
- `parent_id` INTEGER (FK para nodes)
- `name` TEXT
- `description` TEXT
- `status` TEXT (`active`, `completed`, `archived`)
- `due_date` DATETIME
- `sort_order` INTEGER
- `created_at` DATETIME
- `updated_at` DATETIME
- `completed_at` DATETIME
- `archived_at` DATETIME

### 2. StudySessions

Registra os eventos de estudo reais e atômicos.

- `id` INTEGER PRIMARY KEY
- `node_id` INTEGER (FK para nodes)
- `started_at` DATETIME
- `ended_at` DATETIME
- `duration_seconds` INTEGER
- `notes` TEXT
- `created_at` DATETIME

### 3. Tasks

Checklists e tarefas vinculadas a um nó.

- `id` INTEGER PRIMARY KEY
- `node_id` INTEGER (FK para nodes)
- `parent_task_id` INTEGER (FK para tasks, útil para criar subtarefas infinitas)
- `title` TEXT
- `completed` INTEGER/BOOLEAN
- `completed_at` DATETIME
- `created_at` DATETIME

### 4. SleepSessions

Acompanhamento da rotina de sono.

- `id` INTEGER PRIMARY KEY
- `started_at` DATETIME
- `ended_at` DATETIME
- `status` TEXT (`sleeping`, `awake`, `interrupted`)
- `created_at` DATETIME

### 5. MoodEntries & MoodTags

Registros emocionais do usuário (Relação N:N).

- **MoodEntries**: `id`, `mood`, `note`, `created_at`
- **MoodTags**: `id`, `name`
- **MoodEntryTags**: `mood_entry_id`, `mood_tag_id` (Primary Key composta)

### 6. Locations & Events

Geofence e locais importantes.

- **Locations**: `id`, `name`, `latitude`, `longitude`, `radius`, `active`, `created_at`
- **LocationEvents**: `id`, `location_id` (FK), `event_type` (`entered`, `left`), `created_at`

---

## Sistema de Evolução (Migrations)

Como o banco de dados é o maior ativo deste app, ele nunca deve destruir os registros do usuário durante atualizações da Play Store. Toda mudança estrutural (como adicionar uma nova tabela de relatórios ou uma coluna de cor no nó) será tratada através de rotinas de migração rigorosas (`schemaVersion` e `onUpgrade` do Drift).
