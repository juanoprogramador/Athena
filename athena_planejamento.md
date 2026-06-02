# Athena — planejamento do projeto

## Visão geral

Athena é um aplicativo Android local para monitoramento pessoal de rotina acadêmica. O objetivo central não é apenas registrar atividades, mas unificar eventos relevantes da vida de estudos em uma base estruturada, exportável e resistente a mudanças futuras.

O princípio orientador do projeto é simples: os dados dos estudantes pertencem aos estudantes. O aplicativo deve permitir exportação total e livre dos registros, em formatos abertos ou amplamente interoperáveis, para que o usuário possa analisar, migrar, arquivar ou processar os dados em qualquer ferramenta externa.

## Objetivos principais

- Registrar estudo, sono, humor e localização com o menor atrito possível.
- Permitir criação livre de estruturas hierárquicas de estudo, sem categorias prontas.
- Registrar eventos como acontecimentos, não apenas totais agregados.
- Manter o banco preparado para evoluir por anos sem perda de histórico.
- Exportar dados completos para análise externa.
- Suportar conclusão, arquivamento e recuperação de projetos e pastas.
- Ser modular o bastante para aceitar novos recursos e, no futuro, extensões.

## Princípios de arquitetura

### 1. Tudo é evento
O sistema deve priorizar registros atômicos:

- início e fim de estudo
- chegada e saída de locais
- início e fim de sono
- registro de humor
- tarefas concluídas
- alteração de status

Os totais e gráficos devem ser derivados depois, não armazenados como única verdade.

### 2. Estrutura hierárquica genérica
Não tratar o conteúdo como um conjunto fixo de “pastas”, “matérias” ou “projetos”. O núcleo deve ser uma árvore de nós, onde cada nó pode ter filhos e múltiplos níveis de profundidade.

Isso permite que o usuário crie estruturas como:

- Vestibular
  - Matemática
    - Matemática 1
      - Geometria Analítica
- Graduação
  - Semestre 1
    - Cálculo I

### 3. Histórico preservado
Nada deve ser apagado de forma destrutiva. O sistema deve usar estados como:

- ativo
- concluído
- arquivado

Se um nó pai for concluído, os descendentes podem ser concluídos em cascata, mas sempre com possibilidade de restauração individual.

### 4. Evolução por migração
O banco precisa suportar versões e migrações, para que o aplicativo possa receber novos recursos sem destruir registros antigos.

### 5. Baixo atrito de uso
A coleta de dados precisa ser rápida. Sempre que possível, o app deve automatizar:

- localização
- duração de estudo
- períodos de sono
- consolidação de dados

Registros manuais devem ser curtos e objetivos.

## Escopo da versão inicial

### Aba 1: Estudos
- árvore livre de projetos, pastas e subpastas
- criação manual de nós
- reordenação e organização hierárquica
- timer de estudo embutido
- registro manual de sessões, quando necessário
- tarefas e subtarefas com checkboxes
- conclusão e reativação de nós
- prazos opcionais
- visualização de tempo por nó e por ancestral
- gráfico de distribuição de tempo por pasta, projeto ou nível escolhido

### Aba 2: Sono
- botão “vou dormir”
- botão “acordei”
- botão “perdi o sono”
- prevenção de estados inválidos
- cálculo de duração e estatísticas

### Aba 3: Localização
- cadastro livre de locais
- detecção de entrada e saída por geofence
- horários de chegada e saída
- tempo de permanência
- histórico por local
- suporte a múltiplos locais, sem limite rígido na interface

### Aba 4: Humor
- seleção rápida de humor
- múltiplas tags opcionais
- observação livre
- registro com data e hora
- uso mínimo de tempo para preenchimento

### Aba 5: Agenda
- visão de prazos e itens futuros
- exibição de itens com prazo e itens sem prazo
- indicadores de próximos vencimentos
- itens concluídos ocultos da área principal, mas acessíveis em área separada

### Aba 6: Exportação
- exportação em Excel
- exportação em CSV, se necessário
- backup completo do banco
- preservação de dados brutos e consolidados

## Modelo conceitual recomendado

### Entidades principais
- Node: representa qualquer item da árvore hierárquica.
- Event: representa registros atômicos de estudo, sono, humor, localização e outros eventos.
- Task: representa checklist e subtarefas vinculadas a um nó.
- Location: representa locais monitorados.
- MoodEntry: representa o registro de humor diário.
- SleepSession: representa intervalos de sono.
- StudySession: representa sessões de estudo.
- ExportJob: representa uma exportação gerada.
- Attachment: representa imagens, como fotos de redação, no futuro.

### Campos essenciais para Node
- id
- parent_id
- nome
- tipo
- status
- prazo_opcional
- criado_em
- atualizado_em
- concluido_em_opcional
- arquivado_em_opcional

### Campos essenciais para Event
- id
- node_id_opcional
- tipo
- inicio_em_opcional
- fim_em_opcional
- valor_opcional
- observacao_opcional
- metadata_json
- criado_em

## Regras de negócio

- Nenhum nó raiz deve ser imposto pelo aplicativo.
- Nenhuma estrutura pré-pronta deve ser imposta ao usuário.
- Nós concluídos devem desaparecer da área principal, mas permanecer acessíveis.
- A conclusão de um nó pai pode afetar os descendentes, porém a restauração precisa ser possível.
- Localização deve registrar eventos de entrada e saída de forma automática, quando a permissão estiver ativa.
- O estudo contabilizado é apenas estudo próprio, não aulas passivas do cursinho.
- O gráfico de tempo deve aceitar análise por nó selecionado ou por ancestral.
- O sistema deve ser útil sem internet e sem servidor.

## Estratégia de tecnologia

### Camada de app
- Flutter para Android
- UI modular e responsiva
- foco em componentes reutilizáveis

### Persistência
- SQLite local
- sistema de migração versionado
- schema organizado para eventos e árvore hierárquica

### Estado e organização
- Riverpod ou equivalente para gerenciamento de estado
- repositórios para isolar a UI do banco
- serviços para localização, timer e exportação

### Recursos auxiliares
- geolocalização e geofence
- notificações locais
- biblioteca de exportação para planilhas
- captura de imagens para anexos futuros

## Organização do desenvolvimento

### Fase 1 — fundação
- criar projeto Flutter
- definir tema visual
- criar banco SQLite
- modelar árvore de nós
- implementar CRUD básico
- implementar migrações

### Fase 2 — estudos
- criar árvore hierárquica livre
- criar timer de estudo
- registrar sessões manuais
- criar tarefas e subtarefas
- registrar conclusão e restauração de nós
- calcular agregações de tempo

### Fase 3 — sono, humor e localização
- implementar rotina de sono
- implementar humor diário
- implementar locais monitorados
- registrar entrada e saída por geofence

### Fase 4 — agenda e consolidação
- exibir prazos
- listar itens futuros
- organizar itens concluídos em área separada
- consolidar dados para análise

### Fase 5 — exportação
- exportar banco e relatórios
- gerar planilhas com múltiplas abas
- validar encoding e formatação
- incluir backup integral

### Fase 6 — refinamento
- melhorar fluxos de uso
- reduzir toques necessários
- aprimorar reativação de nós
- adicionar filtros, buscas e gráficos

## Diretrizes para o futuro

O Athena deve aceitar expansão sem reescrita total. Novas áreas, como redações, simulados, leituras, hábitos ou anexos, devem entrar como extensões do mesmo modelo, não como exceções fora da arquitetura.

A comunidade futura, se existir, deve interagir por módulos bem definidos, preferencialmente extensões que dependam de APIs internas estáveis e de um modelo de dados versionado.

## Critério de sucesso

O projeto estará em bom estado se:

- o usuário conseguir registrar dados rapidamente
- a árvore puder crescer livremente
- o histórico permanecer íntegro após atualizações
- o exportado for útil em outras ferramentas
- o sistema continuar consistente após anos de uso
