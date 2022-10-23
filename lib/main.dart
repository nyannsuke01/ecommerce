import 'package:shop_ui/bloc/app_theme_notifer.dart';
import 'package:shop_ui/pages/welcome_page.dart';
import 'package:shop_ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shop_ui/router.dart' as router;
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Widget checkScreen() {
    return WelcomePage();
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AppStateNotifier()),
    ],
    child: RootApp(rootScreen: checkScreen()),
  ));
}

class RootApp extends StatefulWidget {
  final Widget rootScreen;
  RootApp({this.rootScreen});
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
            home: this.widget.rootScreen,
            onGenerateRoute: router.generateRoute);
      },
    );
  }
}
