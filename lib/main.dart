import 'package:flutter/material.dart';
import 'package:projeto1/detalhes.dart';
import 'package:projeto1/parametros.dart';
import 'package:projeto1/procura.dart';
import 'package:projeto1/selectcli.dart';
import 'splash.dart';
import 'lista.dart';
import 'login.dart';
import 'procura.dart';
import 'cadastrop1.dart';
import 'cadastrop2.dart';
import 'cadastrop3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joões e Marias',
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/splash',
      routes: {
        '/procura': (context) => Procura(),
        '/lista': (context) => Lista(),
        '/splash': (context) => Splash(),
        '/login': (context) => Login(),
        '/cadastrop1': (context) => CadastroP1(),
        '/cadastrop2': (context) => CadastroP2(),
        '/cadastrop3': (context) => CadastroP3(),
        '/detalhes': (context) => Detalhes(),
        '/selectcli': (context) => Selectcli(),
        '/parametros': (context) => Parametros(),
      },
    );
  }
}
