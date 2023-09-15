import 'package:animation/intro.dart';
import 'package:animation/splash.dart';
import 'package:animation/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isvisited = preferences.getBool("isIntroVisited") ?? false;
  runApp(MultiProvider(
      providers: [
        ListenableProvider(create: (context) => themeprovider()),
      ],
      builder: (context, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            //  theme: ThemeData(useMaterial3: true),
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: (Provider.of<themeprovider>(context, listen: true)
                        .theme3
                        .isdark ==
                    false)
                ? ThemeMode.dark
                : ThemeMode.light,
            initialRoute: (isvisited) ? 'splash' : '/',
            routes: {
              '/': (context) => intro_page(),
              'splash': (context) => Splash(),
              'Home': (context) => Home(),
              'detail': (context) => detail()
            },
          )));
}
