import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto1/cadastrop1.dart';
import 'package:projeto1/usuario.dart';

class Selectcli extends StatefulWidget {
  @override
  _SelectcliState createState() => _SelectcliState();
}

class _SelectcliState extends State<Selectcli> {
  Usuario atual = new Usuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Joões e Marias - Tipo de Usuário'),
        ),
        body: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  'assets/bgselect.jpg',
                  fit: BoxFit.cover,
                )),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 100),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  Usuario.tipouser = "cc";
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => CadastroP1()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  child: Text(
                    'Quero contratar um Profissional',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  Usuario.tipouser = "cp";
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => CadastroP1()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  child: Text(
                    'Quero anunciar como Profissional',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ]),
          ],
        ));
  }
}
