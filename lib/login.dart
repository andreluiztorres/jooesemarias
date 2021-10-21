import 'package:flutter/material.dart';
import 'package:projeto1/lista.dart';
import 'package:projeto1/selectcli.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String tipocli;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Joões e Marias - Login'),
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
                          width: double.infinity,
                          child: Image.asset('assets/login.gif')),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'E-mail', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Senha', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Lista()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Entrar',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('caso ainda não seja cadastrado clique em'),
                      SizedBox(
                        height: 15,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => Selectcli()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Cadastrar-se agora',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
