import 'package:architecture_template/common/theme/theme_provider.dart';
import 'package:architecture_template/environment.dart';
import 'package:architecture_template/features/main_app/cupertino_localizations_delegate.dart';
import 'package:architecture_template/features/main_app/dependency_container.dart';
import 'package:architecture_template/features/main_app/main_localizations.dart';
import 'package:architecture_template/features/main_flow/main_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  final Environment environment;

  const MainApp({Key key, @required this.environment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeProvider = ThemeProvider(isLightTheme: true);
    return DependencyContainer(
      environment: environment,
      child: ChangeNotifierProvider(
        create: (_) => themeProvider,
        child: MaterialApp(
          title: 'Architecture template app',
          theme: themeProvider.theme,
          localizationsDelegates: [
            MainLocalizationsDelegate(),
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            const CupertinoLocalizationsDelegate(),
          ],
          home: MainFlow(),
        ),
      ),
    );
  }
}
