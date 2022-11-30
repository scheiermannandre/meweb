import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';
import 'package:meweb/Widgets/animated_introduction.dart';
import 'package:meweb/Widgets/core_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CoreScaffold(
      body: 
      Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.bottomCenter,
                radius: 1.5,
                colors: [
              Color.fromARGB(255, 13, 35, 61),
              Colors.black,
            ])),
        child: Metaballs(
          //effect: MetaballsEffect.follow(),
          glowRadius: 1,
          glowIntensity: 0.3,
          maxBallRadius: 35,
          minBallRadius: 15,
          metaballs: 80,
          speedMultiplier: 1,
          bounceStiffness: 3,
          color: Colors.grey,
          gradient: const LinearGradient(colors: [
            Color(0xFF5e2028),
            //Color.fromARGB(0, 237, 133, 68),
            //Color(0x00110916),
            //Color(0x004fb2e7),
            //Color(0x0067383b),
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 75, color: Colors.transparent),
              const Text(
                "Hello,",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Wrap(
                children: [
                  const Text(
                    "I am ",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  AnimatedIntroduction(
                    textsForAnimation: const [
                      "André Scheiermann",
                      "a Software Engineer",
                      "a Sport Entusiast",
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
