# Athena Progress Report

## Estado atual (feito)

### Fase 1 — Fundação
- Projeto Flutter criado e configurado.
- `flutter_riverpod` integrado para gerenciamento de estado.
- `go_router` configurado com rota inicial para `StudyScreen`.
- Drift/SQLite configurado em `lib/data/database/app_database.dart`.
- Tabela `nodes` criada com campos básicos: `id`, `parent_id`, `name`, `description`, `status`, `due_date`, `created_at`, `updated_at`, `completed_at`, `archived_at`.
- Tabela `study_sessions` adicionada ao banco, com suporte a `nodeId`, `startedAt`, `endedAt`, `notes` e `createdAt`.
- Código gerado do Drift atualizado com `dart run build_runner build`.

### Fase 2 — Estudos
- Modelo de domínio `StudyNode` implementado em `lib/data/models/node.dart`.
- Repositório de nós (`NodeRepository`) implementado em `lib/data/repositories/node_repository.dart`.
- Criar nós com hierarquia funcionou.
- Edição, conclusão, restauração e arquivamento de nós implementados.
- Tela de estudos atualizada em `lib/features/study/study_screen.dart` para exibir a árvore de nós.
- Ações de nó por `long press` implementadas.
- Repositório de sessões de estudo (`StudyRepository`) criado em `lib/data/repositories/study_repository.dart`.
- Tela de estudos passou a suportar sessão ativa com timer dinâmico.
- Sessões podem ser iniciadas e interrompidas.
- `flutter analyze` confirma que não há issues no código atual.

## O que falta fazer

### Prioritário
- Registrar histórico de sessões por nó em uma interface dedicada.
- Permitir inserir notas ou tipo de estudo ao finalizar a sessão.
- Exibir o nome do nó ativo na sessão em vez de apenas `nodeId`.
- Adicionar suporte a múltiplas sessões por nó e relatório de tempo acumulado.

### Médio prazo
- Implementar subtarefas/tarefas associadas a nós.
- Adicionar filtros de `active`, `completed` e `archived` na UI com seções claras.
- Adicionar campo de prazo (`due_date`) e visualização de ítens com prazo.
- Criar uma tela de estatísticas com agregações hierárquicas de tempo.

### Fase 3 e seguintes
- Implementar telas e modelos para sono, humor e localização.
- Adicionar exportação de dados (Excel, CSV, backup SQLite).
- Planejar migrações de banco para futuras versões.
- Melhorar a UX com animações, busca, e organização arrastável da árvore.

## Notas técnicas
- A arquitetura atual está organizada em `lib/core`, `lib/data`, `lib/features`, `lib/routes`.
- O banco é local e preparado para evoluir com novas tabelas e migrações.
- O trabalho atual já atende ao fluxo básico de criação e gestão de nós e ao timer de estudo.

---

Arquivo gerado automaticamente como registro de progresso em 2026-06-02.
