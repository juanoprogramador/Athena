import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'routes/app_router.dart';

class AthenaApp extends StatelessWidget {
  const AthenaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Athena',
      theme: appTheme,
      routerConfig: appRouter,
    );
  }
}
