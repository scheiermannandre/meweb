import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meweb/Navigation/headerBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const int _blackPrimaryValue = 0xFF000000;

    const MaterialColor primaryBlack = MaterialColor(
      _blackPrimaryValue,
      <int, Color>{
        50: Color(0xFF000000),
        100: Color(0xFF000000),
        200: Color(0xFF000000),
        300: Color(0xFF000000),
        400: Color(0xFF000000),
        500: Color(_blackPrimaryValue),
        600: Color(0xFF000000),
        700: Color(0xFF000000),
        800: Color(0xFF000000),
        900: Color(0xFF000000),
      },
    );
    const int _redPrimaryValue = 0xFF5e2028;

    const MaterialColor primaryRed = MaterialColor(
      _blackPrimaryValue,
      <int, Color>{
        50: Color(0xFF5e2028),
        100: Color(0xFF5e2028),
        200: Color(0xFF5e2028),
        300: Color(0xFF5e2028),
        400: Color(0xFF5e2028),
        500: Color(_redPrimaryValue),
        600: Color(0xFF5e2028),
        700: Color(0xFF5e2028),
        800: Color(0xFF5e2028),
        900: Color(0xFF5e2028),
      },
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: 'RobotoMono',
        primarySwatch: primaryBlack,
        scaffoldBackgroundColor: primaryBlack,
        dividerColor: Color.fromARGB(255, 145, 140, 140),
        buttonTheme:
            ButtonThemeData(buttonColor: Color.fromARGB(255, 94, 32, 40)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 94, 32, 40)),
        appBarTheme: AppBarTheme(
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .apply(
                fontFamily: "RobotoMono",
                bodyColor: Colors.black,
                displayColor: Colors.black,
              )
              .bodyText2,
          titleTextStyle: Theme.of(context)
              .textTheme
              .apply(
                fontFamily: "RobotoMono",
                bodyColor: Color.fromARGB(255, 145, 140, 140),
                displayColor: Color.fromARGB(255, 145, 140, 140),
                // bodyColor: Color.fromARGB(255, 94, 32, 40),
                // displayColor: Color.fromARGB(255, 145, 140, 140),
              )
              .headline6,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "RobotoMono",
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    print("HALLO");
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Color.fromRGBO(107, 3, 6, 1),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const HeaderBar()),
      body: Center(
        child: Container(
          //color: Colors.yellow,
          width: 1200.toDouble(),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child:
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Hello,",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    "I am ",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  AnimatedTextKit(repeatForever: true, animatedTexts: [
                    TypewriterAnimatedText(
                      "André Scheiermann",
                      textStyle: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      "a Software Engineer",
                      textStyle: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText("a Sport Enthusiast",
                        textStyle: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 100)),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


