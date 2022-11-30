import 'package:flutter/material.dart';
import 'package:meweb/Widgets/animated_introduction.dart';
import 'package:meweb/Widgets/appbar.dart';
import 'package:metaballs/metaballs.dart';
import 'package:meweb/pages/home_page.dart';

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
            const ButtonThemeData(buttonColor: Color.fromARGB(255, 94, 32, 40)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 94, 32, 40)),
        appBarTheme: AppBarTheme(
          toolbarTextStyle: Theme.of(context)
              .textTheme
              .apply(
                fontFamily: "RobotoMono",
                bodyColor: Colors.red,
                displayColor: Colors.red,
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
    return HomePage();
  }
}
































// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: ExampleStaggeredAnimations(),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }

// class ExampleStaggeredAnimations extends StatefulWidget {
//   const ExampleStaggeredAnimations({
//     super.key,
//   });

//   @override
//   State<ExampleStaggeredAnimations> createState() =>
//       _ExampleStaggeredAnimationsState();
// }

// class _ExampleStaggeredAnimationsState extends State<ExampleStaggeredAnimations>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _drawerSlideController;

//   @override
//   void initState() {
//     super.initState();

//     _drawerSlideController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 150),
//     );
//   }

//   @override
//   void dispose() {
//     _drawerSlideController.dispose();
//     super.dispose();
//   }

//   bool _isDrawerOpen() {
//     return _drawerSlideController.value == 1.0;
//   }

//   bool _isDrawerOpening() {
//     return _drawerSlideController.status == AnimationStatus.forward;
//   }

//   bool _isDrawerClosed() {
//     return _drawerSlideController.value == 0.0;
//   }

//   void _toggleDrawer() {
//     if (_isDrawerOpen() || _isDrawerOpening()) {
//       _drawerSlideController.reverse();
//     } else {
//       _drawerSlideController.forward();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: _buildAppBar(),
//       body: Stack(
//         children: [
//           _buildContent(),
//           _buildDrawer(),
//         ],
//       ),
//     );
//   }

//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       title: const Text(
//         'Flutter Menu',
//         style: TextStyle(
//           color: Colors.black,
//         ),
//       ),
//       backgroundColor: Colors.transparent,
//       elevation: 0.0,
//       automaticallyImplyLeading: false,
//       actions: [
//         AnimatedBuilder(
//           animation: _drawerSlideController,
//           builder: (context, child) {
//             return IconButton(
//               onPressed: _toggleDrawer,
//               icon: _isDrawerOpen() || _isDrawerOpening()
//                   ? const Icon(
//                       Icons.clear,
//                       color: Colors.black,
//                     )
//                   : const Icon(
//                       Icons.menu,
//                       color: Colors.black,
//                     ),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   Widget _buildContent() {
//     // Put page content here.
//     return const SizedBox();
//   }

//   Widget _buildDrawer() {
//     return AnimatedBuilder(
//       animation: _drawerSlideController,
//       builder: (context, child) {
//         return FractionalTranslation(
//           translation: Offset(1.0 - _drawerSlideController.value, 0.0),
//           child: _isDrawerClosed() ? const SizedBox() : const Menu(),
//         );
//       },
//     );
//   }
// }

// class Menu extends StatefulWidget {
//   const Menu({super.key});

//   @override
//   State<Menu> createState() => _MenuState();
// }

// class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
//   static const _menuTitles = [
//     'Declarative style',
//     'Premade widgets',
//     'Stateful hot reload',
//     'Native performance',
//     'Great community',
//   ];

//   static const _initialDelayTime = Duration(milliseconds: 50);
//   static const _itemSlideTime = Duration(milliseconds: 250);
//   static const _staggerTime = Duration(milliseconds: 50);
//   static const _buttonDelayTime = Duration(milliseconds: 150);
//   static const _buttonTime = Duration(milliseconds: 500);
//   final _animationDuration = _initialDelayTime +
//       (_staggerTime * _menuTitles.length) +
//       _buttonDelayTime +
//       _buttonTime;

//   late AnimationController _staggeredController;
//   final List<Interval> _itemSlideIntervals = [];
//   late Interval _buttonInterval;

//   @override
//   void initState() {
//     super.initState();

//     _createAnimationIntervals();

//     _staggeredController = AnimationController(
//       vsync: this,
//       duration: _animationDuration,
//     )..forward();
//   }

//   void _createAnimationIntervals() {
//     for (var i = 0; i < _menuTitles.length; ++i) {
//       final startTime = _initialDelayTime + (_staggerTime * i);
//       final endTime = startTime + _itemSlideTime;
//       _itemSlideIntervals.add(
//         Interval(
//           startTime.inMilliseconds / _animationDuration.inMilliseconds,
//           endTime.inMilliseconds / _animationDuration.inMilliseconds,
//         ),
//       );
//     }

//     final buttonStartTime =
//         Duration(milliseconds: (_menuTitles.length * 50)) + _buttonDelayTime;
//     final buttonEndTime = buttonStartTime + _buttonTime;
//     _buttonInterval = Interval(
//       buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
//       buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
//     );
//   }

//   @override
//   void dispose() {
//     _staggeredController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           _buildFlutterLogo(),
//           _buildContent(),
//         ],
//       ),
//     );
//   }

//   Widget _buildFlutterLogo() {
//     return const Positioned(
//       right: -100,
//       bottom: -30,
//       child: Opacity(
//         opacity: 0.2,
//         child: FlutterLogo(
//           size: 400,
//         ),
//       ),
//     );
//   }

//   Widget _buildContent() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 16),
//         ..._buildListItems(),
//         const Spacer(),
//         _buildGetStartedButton(),
//       ],
//     );
//   }

//   List<Widget> _buildListItems() {
//     final listItems = <Widget>[];
//     for (var i = 0; i < _menuTitles.length; ++i) {
//       listItems.add(
//         AnimatedBuilder(
//           animation: _staggeredController,
//           builder: (context, child) {
//             final animationPercent = Curves.easeOut.transform(
//               _itemSlideIntervals[i].transform(_staggeredController.value),
//             );
//             final opacity = animationPercent;
//             final slideDistance = (1.0 - animationPercent) * 150;

//             return Opacity(
//               opacity: opacity,
//               child: Transform.translate(
//                 offset: Offset(slideDistance, 0),
//                 child: child,
//               ),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
//             child: Text(
//               _menuTitles[i],
//               textAlign: TextAlign.left,
//               style: const TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//     return listItems;
//   }

//   Widget _buildGetStartedButton() {
//     return SizedBox(
//       width: double.infinity,
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: AnimatedBuilder(
//           animation: _staggeredController,
//           builder: (context, child) {
//             final animationPercent = Curves.elasticOut.transform(
//                 _buttonInterval.transform(_staggeredController.value));
//             final opacity = animationPercent.clamp(0.0, 1.0);
//             final scale = (animationPercent * 0.5) + 0.5;

//             return Opacity(
//               opacity: opacity,
//               child: Transform.scale(
//                 scale: scale,
//                 child: child,
//               ),
//             );
//           },
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               shape: const StadiumBorder(),
//               backgroundColor: Colors.blue,
//               padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
//             ),
//             onPressed: () {},
//             child: const Text(
//               'Get started',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 22,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
