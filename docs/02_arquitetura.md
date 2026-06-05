# Arquitetura e Tecnologias

## Stack Tecnológica Principal

A arquitetura do Athena prioriza desenvolvimento ágil, portabilidade e uso estritamente local (offline-first).

- **Frontend / Aplicação:** Flutter
- **Linguagem:** Dart
- **Gerenciamento de Estado:** Riverpod
- **Navegação / Roteamento:** GoRouter
- **Banco de Dados (ORM):** Drift sobre SQLite
- **Localização e Geofence:** Geolocator / Geofencing API
- **Exportação:** Excel Package (ou similiar para geração de `.xlsx`)
- **Gráficos:** fl_chart
- **Notificações:** Flutter Local Notifications

## Organização de Pastas do Projeto

A base de código segue uma arquitetura orientada a features com isolamento de camadas.

```text
lib/
├── core/            # Configurações gerais, temas, constantes e utils
├── data/
│   ├── database/    # Configuração do banco SQLite/Drift e migrações
│   ├── repositories/# Classes de acesso a dados (Repository Pattern)
│   └── models/      # Classes e modelos de domínio
├── features/        # Lógica de negócio e UI divididas por funcionalidade
│   ├── study/
│   ├── sleep/
│   ├── mood/
│   ├── location/
│   ├── statistics/
│   ├── export/
│   └── agenda/
├── routes/          # Definições e configuração do GoRouter
├── shared/          # Código compartilhado entre features
├── widgets/         # Componentes de UI reaproveitáveis
└── main.dart
```

## Fluxo da Arquitetura Geral

```text
[ UI Layer ]
Screens, Components, Widgets
      │ (Acessa dados via Riverpod Providers)
      ▼
[ Application Layer ]
Services e Repositories
      │
      ▼
[ Persistence Layer ]
Drift (SQLite) e Migrations
```

**Regras de Ouro da Arquitetura:**

- Nenhuma tela ou widget deve acessar o banco de dados diretamente.
- Todo acesso passa por `Repositories` e as chamadas reativas são gerenciadas pelo Riverpod.
- A persistência é tratada como a fonte única da verdade.

## Preparação para Plugins e Extensões

O modelo de dados e a UI devem ser pensados com modularidade para o futuro. Mesmo sem implementar imediatamente, as bases do aplicativo são orientadas a separar:

- `PluginRegistry`
- `PluginAction`
- `PluginPage`
Isso garante que um dia o Athena possa receber módulos da comunidade ou novos recursos do sistema sem exigir uma quebra e reescrita do núcleo.
