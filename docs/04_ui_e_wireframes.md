# Interface e Wireframes

O design do Athena prioriza a eficiência, o foco nos dados e o "baixo atrito", o que significa que o usuário deve precisar do menor número de toques possível para registrar uma ação frequente.

## Wireframes Base

### 1. Tela Inicial (Home)

Resumo rápido do dia para dar contexto e sensação de progresso sem sobrecarregar com detalhes não essenciais.

```text
┌─────────────────────────┐
│ Athena                  │
├─────────────────────────┤
│ Estudo Hoje             │
│ 4h 32min                │
├─────────────────────────┤
│ Sono (Noite Passada)    │
│ 7h 15min                │
├─────────────────────────┤
│ Humor Atual             │
│ 🙂 Bom                  │
├─────────────────────────┤
│ Próximos Prazos         │
│ • Matemática 3 (Amanhã) │
└─────────────────────────┘
```

### 2. Tela de Estudos (Árvore Principal)

É a principal interface de navegação da ferramenta. Permite expandir, retrair e navegar pelos nós livremente.

```text
┌─────────────────────────┐
│ Estudos                 │
├─────────────────────────┤
│ ▼ Vestibular            │
│   ▼ Matemática          │
│     ▼ Matemática 3      │
│       Geometria Analítica
│       Vetores           │
│                         │
│ + Novo Item             │
└─────────────────────────┘
```

**Ações de Pressão Longa (Long Press) no Nó:**

- **Editar:** Muda nome, descrição, etc.
- **Mover:** Troca o nó de pai, reestruturando a árvore.
- **Concluir:** Finaliza o nó, removendo-o da visão padrão, mas sem deletar.
- **Arquivar:** Esconde projetos que não estão mais em andamento.
- **Excluir:** Opção de soft-delete para acidentes graves.

### 3. Tela de Timer

Uma interface grande e livre de distrações ativada para focar na sessão de estudo.

```text
┌─────────────────────────┐
│ Geometria Analítica     │
├─────────────────────────┤
│                         │
│       01:43:22          │
│                         │
│       ▶  ⏸  ■          │
└─────────────────────────┘
```

### 4. Tela de Tarefas (Checklists)

Para gerenciar etapas de um subprojeto com micro-vitórias.

```text
┌─────────────────────────┐
│ Lista 12                │
├─────────────────────────┤
│ ☑ Questão 01            │
│ ☑ Questão 02            │
│ ☐ Questão 03            │
│ ☐ Questão 04            │
│                         │
│ + Nova tarefa           │
└─────────────────────────┘
```

### 5. Tela de Sono

Botões rápidos e robustos, evitando confusões durante as horas de sonolência.

```text
┌─────────────────────────┐
│ Sono                    │
├─────────────────────────┤
│                         │
│      [Vou dormir]       │
│                         │
│      [Acordei]          │
│                         │
│     [Perdi o sono]      │
└─────────────────────────┘
```

### 6. Tela de Humor

Um registro com tags para facilitar correlações futuras entre hábitos e produtividade.

```text
┌─────────────────────────┐
│ Humor                   │
├─────────────────────────┤
│ 😀 Excelente            │
│ 🙂 Bom                  │
│ 😐 Neutro               │
│ 😕 Ruim                 │
│ 😞 Péssimo              │
├─────────────────────────┤
│ Tags:                   │
│ ☑ Motivado  ☑ Cansado   │
│ ☐ Ansioso               │
├─────────────────────────┤
│ Observação livre:       │
│ _______________________ │
└─────────────────────────┘
```

### 7. Tela de Localização

Configuração simples de lugares fixos para acionamento de Geofences de fundo.

```text
┌─────────────────────────┐
│ Locais                  │
├─────────────────────────┤
│ Casa                    │
│ Raio: 100m  [Ligado]    │
│                         │
│ Cursinho                │
│ Raio: 150m  [Ligado]    │
│                         │
│ + Novo Local            │
└─────────────────────────┘
```

### 8. Tela de Agenda

Visão cronológica de vencimentos agregados de todos os nós.

```text
┌─────────────────────────┐
│ Agenda                  │
├─────────────────────────┤
│ Hoje                    │
│ • Lista 12              │
│ • Redação Semanal       │
├─────────────────────────┤
│ Esta Semana             │
│ • Vetores               │
│ • Revisão de Biologia   │
└─────────────────────────┘
```

### 9. Tela de Estatísticas

Análise agregada. Quando o usuário seleciona "Vestibular", ele vê a soma das horas de "Matemática", "Física", etc.

```text
┌─────────────────────────┐
│ Estatísticas            │
├─────────────────────────┤
│ Analisar por:           │
│ ○ Projeto               │
│ ○ Pasta                 │
│ ◉ Nível Atual           │
│                         │
│    [Gráfico de Pizza]   │
│                         │
│ Matemática ...... 60h   │
│ Física .......... 25h   │
│ Química ......... 15h   │
└─────────────────────────┘
```

### 10. Tela de Exportação

O portal onde o usuário assegura a propriedade dos dados que cadastrou ao longo de meses/anos.

```text
┌─────────────────────────┐
│ Exportação de Dados     │
├─────────────────────────┤
│                         │
│  [ Exportar Excel ]     │
│                         │
│  [ Exportar CSV ]       │
│                         │
│  [ Backup SQLite ]      │
└─────────────────────────┘
```
