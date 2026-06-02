# Athena

Projeto inicializado para o app Athena.

## Começando

1. Instale o Flutter no ambiente de desenvolvimento.
2. Execute `flutter pub get` na raiz do projeto.
3. Use `flutter run` após configurar o Android SDK/Dispositivo.

## Estrutura inicial criada

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
- repositório em memória para provar o fluxo
- stub de banco Drift para próxima etapa
