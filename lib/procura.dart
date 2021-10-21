import 'package:flutter/material.dart';
import 'package:projeto1/lista.dart';
import 'login.dart';

class Procura extends StatefulWidget {
  @override
  _ProcuraState createState() => _ProcuraState();
}

class _ProcuraState extends State<Procura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Joões e Marias - Pesquisar'),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: 300,
                          height: 300,
                          child: Image.asset('assets/lupa.gif')),
                      SizedBox(
                        height: 15.0,
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Lista()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Procurar um Prestador de Serviços',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text('ou'),
                      SizedBox(
                        height: 10,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Fazer Login / Cadastrar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
