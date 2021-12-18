import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dynamicthemeexample/test_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme/theme_chooser_dialog.dart';
import 'theme/theme_values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String spColorValue = '';
  ThemeData initTheme = lightTheme;
  @override
  void initState() {
    getSpThemeColorValue().then((value) {
      setThemeFromSp();
    });
    super.initState();
  }

  Future getSpThemeColorValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      spColorValue = prefs.getString('spColorValue').toString();
    });
  }

  setThemeFromSp() {
    if (spColorValue == 'null') {
      setState(() {
        initTheme = lightTheme;
      });
    } else if (spColorValue == 'pinkTheme') {
      setState(() {
        initTheme = pinkTheme;
      });
    } else if (spColorValue == 'halloweenTheme') {
      setState(() {
        initTheme = halloweenTheme;
      });
    } else if (spColorValue == 'darkBlueTheme') {
      setState(() {
        initTheme = darkBlueTheme;
      });
    } else if (spColorValue == 'redTheme') {
      setState(() {
        initTheme = redTheme;
      });
    } else if (spColorValue == 'purpleTheme') {
      setState(() {
        initTheme = purpleTheme;
      });
    } else if (spColorValue == 'tealTheme') {
      setState(() {
        initTheme = tealTheme;
      });
    } else
      return;
  }

  @override
  Widget build(BuildContext context) {
    // final isPlatformDark =
    //     WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    // final initTheme = isPlatformDark ? darkTheme : lightTheme;
    return ThemeProvider(
      initTheme: initTheme,
      key: Key('$spColorValue'),
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Theme',
          theme: ThemeProvider.of(context),
          home: MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text(
            'Flutter Demo Theme',
          ),
        ),
        body: Center(
          child: Container(
            height: 100,
            width: 200,
            child: Card(
              child: Center(
                child: Text(
                  'Theme chooser',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => TestPage(),
            //   ),
            // );
            showDialog(
                context: context,
                builder: (context) {
                  return ThemeChooserDialog();
                });
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
