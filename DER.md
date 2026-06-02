Athena — DER (Diagrama Entidade-Relacionamento) e Wireframes

1. DER Conceitual

Visão Geral

Node
 │
 ├── StudySession
 │
 ├── Task
 │     │
 │     └── Task (subtarefas)
 │
 └── Attachment (futuro)

MoodEntry
 │
 └── MoodEntryTag
       │
       └── MoodTag

Location
 │
 └── LocationEvent

SleepSession

ExportHistory

---

2. Relacionamentos

Node

Representa qualquer elemento da árvore.

Node
│
├── Vestibular
│
├── Matemática
│
├── Matemática 1
│
└── Geometria Analítica

Relacionamento:

Node
│
└── Node

Tipo:

1 → N

Um Node pode possuir infinitos filhos.

---

StudySession

Node
│
├── Sessão 1
├── Sessão 2
├── Sessão 3
└── Sessão N

Relacionamento:

Node
│
└── StudySession

Tipo:

1 → N

---

Task

Node
│
├── Lista 12
├── Lista 13
└── Revisão

Relacionamento:

Node
│
└── Task

Tipo:

1 → N

---

Subtarefas

Task
│
├── Questão 1
├── Questão 2
└── Questão 3

Relacionamento:

Task
│
└── Task

Tipo:

1 → N

---

Humor

MoodEntry
│
├── Ansioso
├── Cansado
└── Motivado

Relacionamento:

MoodEntry
│
└── MoodEntryTag
      │
      └── MoodTag

Tipo:

N ↔ N

---

Localização

Casa
│
├── Entrou
├── Saiu
├── Entrou
└── Saiu

Relacionamento:

Location
│
└── LocationEvent

Tipo:

1 → N

---

3. Banco de Dados Físico

Node

CREATE TABLE nodes (
    id INTEGER PRIMARY KEY,

    parent_id INTEGER,

    name TEXT NOT NULL,

    description TEXT,

    status TEXT NOT NULL,

    due_date DATETIME,

    sort_order INTEGER,

    created_at DATETIME NOT NULL,

    updated_at DATETIME NOT NULL,

    completed_at DATETIME,

    archived_at DATETIME,

    FOREIGN KEY(parent_id)
        REFERENCES nodes(id)
);

---

StudySession

CREATE TABLE study_sessions (

    id INTEGER PRIMARY KEY,

    node_id INTEGER NOT NULL,

    started_at DATETIME NOT NULL,

    ended_at DATETIME NOT NULL,

    duration_seconds INTEGER NOT NULL,

    notes TEXT,

    created_at DATETIME NOT NULL,

    FOREIGN KEY(node_id)
        REFERENCES nodes(id)
);

---

Task

CREATE TABLE tasks (

    id INTEGER PRIMARY KEY,

    node_id INTEGER NOT NULL,

    parent_task_id INTEGER,

    title TEXT NOT NULL,

    completed INTEGER NOT NULL,

    completed_at DATETIME,

    created_at DATETIME NOT NULL,

    FOREIGN KEY(node_id)
        REFERENCES nodes(id),

    FOREIGN KEY(parent_task_id)
        REFERENCES tasks(id)
);

---

SleepSession

CREATE TABLE sleep_sessions (

    id INTEGER PRIMARY KEY,

    started_at DATETIME NOT NULL,

    ended_at DATETIME,

    status TEXT NOT NULL,

    created_at DATETIME NOT NULL
);

---

MoodEntry

CREATE TABLE mood_entries (

    id INTEGER PRIMARY KEY,

    mood TEXT NOT NULL,

    note TEXT,

    created_at DATETIME NOT NULL
);

---

MoodTag

CREATE TABLE mood_tags (

    id INTEGER PRIMARY KEY,

    name TEXT NOT NULL
);

---

MoodEntryTag

CREATE TABLE mood_entry_tags (

    mood_entry_id INTEGER,

    mood_tag_id INTEGER,

    PRIMARY KEY (
        mood_entry_id,
        mood_tag_id
    )
);

---

Location

CREATE TABLE locations (

    id INTEGER PRIMARY KEY,

    name TEXT NOT NULL,

    latitude REAL NOT NULL,

    longitude REAL NOT NULL,

    radius INTEGER NOT NULL,

    active INTEGER NOT NULL,

    created_at DATETIME NOT NULL
);

---

LocationEvent

CREATE TABLE location_events (

    id INTEGER PRIMARY KEY,

    location_id INTEGER NOT NULL,

    event_type TEXT NOT NULL,

    created_at DATETIME NOT NULL,

    FOREIGN KEY(location_id)
        REFERENCES locations(id)
);

---

4. Wireframe das Telas

Tela Inicial

┌─────────────────────┐
│ Athena             │
├─────────────────────┤
│ Estudo Hoje        │
│ 4h 32min           │
├─────────────────────┤
│ Sono               │
│ 7h 15min           │
├─────────────────────┤
│ Humor Atual        │
│ 🙂 Bom             │
├─────────────────────┤
│ Próximos Prazos    │
│ Matemática 3       │
└─────────────────────┘

---

Tela de Estudos

┌────────────────────────┐
│ Estudos               │
├────────────────────────┤
│ ▼ Vestibular          │
│   ▼ Matemática        │
│     ▼ Matemática 3    │
│       Geometria       │
│       Vetores         │
│                       │
│ + Novo Item           │
└────────────────────────┘

Pressão longa:

Editar

Mover

Concluir

Arquivar

Excluir (soft delete)

---

Tela de Timer

┌──────────────────────┐
│ Geometria Analítica │
├──────────────────────┤
│ 01:43:22            │
│                     │
│ ▶ ⏸ ■              │
└──────────────────────┘

---

Tela de Tarefas

┌──────────────────────┐
│ Lista 12            │
├──────────────────────┤
│ ☑ Questão 01       │
│ ☑ Questão 02       │
│ ☐ Questão 03       │
│ ☐ Questão 04       │
│                    │
│ + Nova tarefa      │
└──────────────────────┘

---

Tela de Sono

┌─────────────────────┐
│ Sono               │
├─────────────────────┤
│ Vou dormir         │
│                     │
│ Acordei            │
│                     │
│ Perdi o sono       │
└─────────────────────┘

---

Tela de Humor

┌─────────────────────┐
│ Humor              │
├─────────────────────┤
│ 😀 Excelente       │
│ 🙂 Bom             │
│ 😐 Neutro          │
│ 😕 Ruim            │
│ 😞 Péssimo         │
├─────────────────────┤
│ Tags               │
│ ☑ Motivado         │
│ ☑ Cansado          │
│ ☐ Ansioso          │
├─────────────────────┤
│ Observação         │
│ _____________      │
└─────────────────────┘

---

Tela de Localização

┌─────────────────────┐
│ Locais             │
├─────────────────────┤
│ Casa               │
│ Raio: 100m         │
│                    │
│ Cursinho           │
│ Raio: 150m         │
│                    │
│ + Novo Local       │
└─────────────────────┘

---

Tela de Agenda

┌─────────────────────┐
│ Agenda             │
├─────────────────────┤
│ Hoje               │
│ • Lista 12         │
│ • Redação          │
├─────────────────────┤
│ Esta Semana        │
│ • Vetores          │
│ • Eletrostática    │
└─────────────────────┘

---

Tela de Estatísticas

┌─────────────────────┐
│ Estatísticas       │
├─────────────────────┤
│ Analisar por:      │
│                    │
│ ○ Projeto          │
│ ○ Pasta            │
│ ○ Nível Atual      │
│                    │
│ [Gráfico Pizza]    │
│                    │
│ Matemática 60h     │
│ Física 25h         │
│ Química 15h        │
└─────────────────────┘

---

Tela de Exportação

┌─────────────────────┐
│ Exportação         │
├─────────────────────┤
│ Exportar Excel     │
│                    │
│ Exportar CSV       │
│                    │
│ Backup SQLite      │
└─────────────────────┘

5. Próximo Passo

Antes de escrever código, o próximo artefato ideal seria um documento chamado:

Athena Architecture Decision Record (ADR)

contendo decisões formais sobre:

- Flutter x Kotlin
- Drift x Isar
- Geofence x GPS contínuo
- Estrutura de plugins
- Estratégia de backup
- Estratégia de migração
- Estrutura de exportação
- Política de versionamento do banco
- Política de compatibilidade futura

Esse documento costuma evitar meses de retrabalho em projetos que se pretende manter por muitos anos.