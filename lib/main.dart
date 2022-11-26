import 'package:flutter/material.dart';
import 'package:meweb/Widgets/animated_introduction.dart';
import 'package:meweb/Widgets/appbar.dart';
import 'package:metaballs/metaballs.dart';

class ColorsEffectPair {
  final List<Color> colors;
  final MetaballsEffect? effect;
  final String name;

  ColorsEffectPair({
    required this.colors,
    required this.name,
    required this.effect,
  });
}

List<ColorsEffectPair> colorsAndEffects = [
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 255, 21, 0),
    const Color.fromARGB(255, 255, 153, 0),
  ], effect: MetaballsEffect.follow(), name: 'FOLLOW'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 0, 255, 106),
    const Color.fromARGB(255, 255, 251, 0),
  ], effect: MetaballsEffect.grow(), name: 'GROW'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 90, 60, 255),
    const Color.fromARGB(255, 120, 255, 255),
  ], effect: MetaballsEffect.speedup(), name: 'SPEEDUP'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 255, 60, 120),
    const Color.fromARGB(255, 237, 120, 255),
  ], effect: MetaballsEffect.ripple(), name: 'RIPPLE'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 120, 217, 255),
    const Color.fromARGB(255, 255, 234, 214),
  ], effect: null, name: 'NONE'),
];

void main() {
// enable dithering to smooth out the gradients and metaballs
  Paint.enableDithering = true;
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
    const int _transparentPrimaryValue = 0x00FFFFFF;

    const MaterialColor primaryTransparent = MaterialColor(
      _blackPrimaryValue,
      <int, Color>{
        50: Color(0x00FFFFFF),
        100: Color(0x00FFFFFF),
        200: Color(0x00FFFFFF),
        300: Color(0x00FFFFFF),
        400: Color(0x00FFFFFF),
        500: Color(_transparentPrimaryValue),
        600: Color(0x00FFFFFF),
        700: Color(0x00FFFFFF),
        800: Color(0x00FFFFFF),
        900: Color(0x00FFFFFF),
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: 'RobotoMono',
        primarySwatch: primaryTransparent, // primaryBlack,
        scaffoldBackgroundColor: Colors.black,
        dividerColor: Color.fromARGB(255, 145, 140, 140),
        scrollbarTheme: ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(Colors.white),
            trackColor: MaterialStateProperty.all(Colors.grey[500])),
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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = 1200.toDouble();
    return Scaffold(
      body: Scrollbar(
        thickness: 5,
        //trackVisibility: true,
        thumbVisibility: true,
        child: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.bottomCenter,
                  radius: 1.5,
                  colors: [
                Color.fromARGB(255, 13, 35, 61),
                Colors.black,
              ])),
          child: Metaballs(
            effect: MetaballsEffect.follow(),
            glowRadius: 1,
            glowIntensity: 0.6,
            maxBallRadius: 35,
            minBallRadius: 15,
            metaballs: 80,
            speedMultiplier: 1,
            bounceStiffness: 3,
            color: Colors.grey,
            gradient: const LinearGradient(colors: [
              Color.fromARGB(0, 237, 133, 68),
              //Color(0x00110916),
              Color(0x004fb2e7),
              //Color(0x0067383b),
            ], begin: Alignment.bottomRight, end: Alignment.topLeft),
            child: Center(
              child: SizedBox(
                width: maxWidth,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: CustomScrollView(
                    reverse: false,
                    slivers: <Widget>[
                      const SliverAppBar(
                        // Provide a standard title.
                        //title: CustomAppBar(maxWidth: 1200),
                        // Allows the user to reveal the app bar if they begin scrolling
                        // back up the list of items.
                        floating: true,
                        // Display a placeholder widget to visualize the shrinking size.
                        flexibleSpace: CustomAppBar(headerTexts: [
                          "01 : Home",
                          "02 : About me",
                          "03 : Projects",
                          "04 : Blog"
                        ], maxWidth: 1200),
                        // Make the initial height of the SliverAppBar larger than normal.
                        expandedHeight: 100,
                        backgroundColor: Colors.transparent,
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Hello,",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                            Wrap(
                              children: [
                                const Text(
                                  "I am ",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                AnimatedIntroduction(
                                  textsForAnimation: const [
                                    "André Scheiermann",
                                    "a Software Engineer",
                                    "a Sport Entusiast",
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}




// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int colorEffectIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     return Material(
//       child: GestureDetector(
//         onDoubleTap: () {
//           setState(() {
//             colorEffectIndex = (colorEffectIndex + 1) % colorsAndEffects.length;
//           });
//         },
//         child: Container(
//           decoration: const BoxDecoration(
//               gradient: RadialGradient(
//                   center: Alignment.bottomCenter,
//                   radius: 1.5,
//                   colors: [
//                 Color.fromARGB(255, 13, 35, 61),
//                 Colors.black,
//               ])),
//           child: Metaballs(
//             effect: colorsAndEffects[colorEffectIndex].effect,
//             glowRadius: 1,
//             glowIntensity: 0.6,
//             maxBallRadius: 50,
//             minBallRadius: 20,
//             metaballs: 40,
//             color: Colors.grey,
//             gradient: LinearGradient(
//                 colors: colorsAndEffects[colorEffectIndex].colors,
//                 begin: Alignment.bottomRight,
//                 end: Alignment.topLeft),
//             child: 
//           ),
//         ),
//       ),
//     );
//   }
// }
