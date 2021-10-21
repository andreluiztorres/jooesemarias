import 'package:flutter/material.dart';
import 'dart:async';
import 'procura.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Procura()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logosplash.png'),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'carregando ...',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.indigo),
              strokeWidth: 4.0,
            )
          ],
        ),
      ),
    );
  }
}
