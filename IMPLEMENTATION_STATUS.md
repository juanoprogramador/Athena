# Athena - Roadmap e Status de Implementação

Este documento centraliza as fases gerais do projeto, acompanha o progresso de desenvolvimento e lista as próximas prioridades.

## Roteiro de Implementação (Roadmap)

- [x] **Fase 1: Fundação** (Flutter, Drift, Riverpod, Migrações)
- [x] **Fase 2: Estudos Básico** (Árvore hierárquica, CRUD de Nodes, Conclusão de nós)
- [ ] **Fase 3: Estudos Avançado** (Timer, Sessões de estudo, Tarefas e agregações de tempo)
- [ ] **Fase 4: Sono** (Rotina, estados, registros rápidos e histórico)
- [ ] **Fase 5: Humor** (Registros de emoção, tags e observações diárias)
- [ ] **Fase 6: Localização** (Cadastro de lugares, geofence, eventos de entrada/saída)
- [ ] **Fase 7: Agenda** (Prazos, itens futuros e atrasados, visão cronológica)
- [ ] **Fase 8: Estatísticas** (Gráficos, dashboards e agregações hierárquicas)
- [ ] **Fase 9: Exportação** (Geração de relatórios Excel, CSV e Backup local SQLite completo)

---

## Estado Atual (O que já foi feito)

### Infraestrutura

- Projeto Flutter criado e estrutura base configurada (`lib/core`, `lib/features`, etc).
- `flutter_riverpod` integrado de forma limpa.
- Roteamento com `go_router` configurado (rota `/` apontando para `StudyScreen`).
- Persistência configurada com `Drift` no SQLite (`lib/data/database/app_database.dart`).
- Tabelas `nodes` e `study_sessions` modeladas e geradas.

### Funcionalidades e UI

- **Nodes**: Modelo de domínio implementado e testado.
- **NodeRepository**: Operações completas de banco isoladas da UI.
- Interface renderizando a árvore de nós corretamente e suportando hierarquia infinita.
- Edição, deleção (soft delete), conclusão e restauração em pleno funcionamento via pressões longas.
- **StudySessions**: Timer dinâmico funcional em `StudyScreen`. É possível focar em um nó e contar o tempo.
- Análise de código limpa (`flutter analyze` passando sem issues no último checklist).

---

## Próximos Passos (Backlog Ativo)

### Prioridade Alta (Finalizar Fase 3)

1. **Histórico de Sessões**: Exibir as sessões concluídas e seu tempo acumulado em cada nó.
2. **UX do Timer**: Permitir adicionar uma nota (observação) ao encerrar o cronômetro, além de exibir o título do nó que está sendo estudado (atualmente apenas salva no banco).
3. **Tarefas (Checklists)**: Implementar tabelas de `Tasks` para permitir dividir um "Nó" em pequenos checkboxes concluíveis.

### Prioridade Média

- Adicionar abas/filtros visíveis na tela de Estudos para separar nós `Ativos`, `Concluídos` e `Arquivados`.
- Implementar edição de `due_date` (Prazo) nos nós.
- Desenvolver os gráficos (Fase 8) pelo menos para a parte de estudos.

### Longo Prazo

- Começar a desenhar os fluxos de Sono e Humor, estendendo o banco de dados via migrations sem quebrar a estrutura existente.
- Polimento visual da UI (suporte nativo a dark mode refinado, drag and drop da árvore de estudos, micro-animações).
