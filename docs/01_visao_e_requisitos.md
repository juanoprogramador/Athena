# Visão e Requisitos

## Visão Geral

Athena é um aplicativo Android focado em monitoramento acadêmico, organização pessoal e análise de dados de estudo. O objetivo central não é apenas registrar atividades, mas unificar eventos relevantes da vida de estudos em uma base estruturada, exportável e resistente a mudanças futuras.

O princípio orientador do projeto é simples: **os dados dos estudantes pertencem aos estudantes**. O aplicativo deve permitir exportação total e livre dos registros, em formatos abertos ou amplamente interoperáveis, para que o usuário possa analisar, migrar, arquivar ou processar os dados em qualquer ferramenta externa.

## Objetivos Principais

- Registrar estudo, sono, humor e localização com o menor atrito possível.
- Permitir criação livre de estruturas hierárquicas de estudo, sem categorias pré-definidas.
- Registrar eventos como acontecimentos atômicos, não apenas como totais agregados.
- Manter o banco de dados preparado para evoluir por anos sem perda de histórico.
- Exportar dados completos para análise externa (Excel, CSV, SQLite).
- Suportar conclusão, arquivamento e recuperação de projetos e nós.
- Ser modular o bastante para aceitar novos recursos e, no futuro, extensões.

## Regras de Negócio e Princípios

1. **Tudo é evento:** O sistema deve priorizar registros atômicos (início e fim de estudo, chegada e saída de locais, etc). Totais e gráficos devem ser derivados dinamicamente a partir dos eventos.
2. **Estrutura hierárquica genérica:** O núcleo é uma árvore de nós genéricos. Nenhuma estrutura obrigatória (como "pasta", "matéria", "semestre") deve ser imposta ao usuário. O usuário organiza sua hierarquia como preferir.
3. **Histórico preservado (Nunca deletar):** Nada deve ser apagado de forma destrutiva. O sistema altera o estado dos nós (`active`, `completed`, `archived`). A conclusão de um nó pai afeta os descendentes em cascata, mas todos podem ser restaurados.
4. **Baixo atrito de uso:** A coleta de dados precisa ser rápida, automatizando o que for possível (ex: geofence para localização).
5. **Autonomia (Offline-first):** O sistema deve funcionar perfeitamente sem internet e sem depender de servidores remotos de terceiros.

## Escopo Geral (Funcionalidades)

### Estudos

- Árvore livre de nós para organizar qualquer fluxo de estudo.
- Timer de estudo embutido.
- Registro manual de sessões, caso necessário.
- Tarefas e subtarefas acopladas aos nós (infinitos níveis de profundidade).
- Prazos opcionais para itens.
- Gráficos de distribuição de tempo agregados hierarquicamente.

### Sono

- Registro simples com botões de estado: "Vou dormir", "Acordei", "Perdi o sono".
- Cálculo automático de duração, prevenção de estados inválidos.

### Humor

- Seleção rápida de humor em uma escala (Excelente, Bom, Neutro, Ruim, Péssimo).
- Múltiplas tags descritivas opcionais (Ex: Cansado, Motivado) e campo livre de observação.

### Localização

- Cadastro livre de locais com monitoramento via Geofence.
- Detecção automática de entrada e saída.

### Agenda

- Visão unificada de prazos e itens futuros, divididos por categorias (atrasados, hoje, semana, futuro).

### Exportação

- Geração de planilhas Excel estruturadas e acesso ao raw data via backup SQLite.

## Critério de Sucesso e Longo Prazo

O projeto será bem sucedido se o usuário conseguir registrar dados rapidamente, a árvore crescer livremente e o histórico permanecer íntegro após atualizações ao longo dos anos. Novas áreas (como acompanhamento de redações ou simulados) devem entrar de forma natural como extensões desse modelo.
