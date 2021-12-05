import 'dart:async';
import 'package:flutter/material.dart';
import 'view/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Color.fromRGBO(217, 217, 217, 1), //D9D9D9
        theme: ThemeData(
          backgroundColor: const Color.fromRGBO(217, 217, 217, 1), //D9D9D9
          brightness: Brightness.light,
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline5: TextStyle(fontSize: 20.0),
            bodyText1: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Hind',
                color: Color.fromRGBO(217, 217, 217, 1)),
          ),
        ),
        title: 'CUCKOO',
        home: const Scaffold(body: SplashPage()));
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splashscreen.png'),
                    fit: BoxFit.cover))),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 100),
            child: Column(children: const [
              Text(
                "YOUR SAFETY IS OUR NO.1",
                style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(60, 59, 110, 1),
                    fontWeight: FontWeight.bold),
              ),
              LinearProgressIndicator(),
              Text("\nCUCKOO",
                  style: TextStyle(
                      fontSize: 45,
                      fontFamily: 'Open Sans Bold',
                      color: Color.fromRGBO(178, 35, 52, 1),
                      fontWeight: FontWeight.bold)),
              Text("WATER FILTER",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Open Sans Bold',
                      color: Color.fromRGBO(60, 59, 110, 1),
                      fontWeight: FontWeight.bold)),
              Text(
                "\n\n\n\n\nVersion 0.1",
                style: TextStyle(
                    fontSize: 10,
                    color: Color.fromRGBO(60, 59, 110, 1),
                    fontWeight: FontWeight.bold),
              ),
            ]))
      ],
    );
  }
}
