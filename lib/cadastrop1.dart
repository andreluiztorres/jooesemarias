import 'package:flutter/material.dart';
import 'package:projeto1/cadastrop2.dart';
import 'package:projeto1/usuario.dart';

class CadastroP1 extends StatefulWidget {
  @override
  _CadastroP1State createState() => _CadastroP1State();
}

class _CadastroP1State extends State<CadastroP1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Joões e Marias - Dados Pessoais'),
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
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            Usuario.nome = text;
                          });
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Nome completo',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            Usuario.cpf = text;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'CPF', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            Usuario.email = text;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'E-mail', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            Usuario.telefone = text;
                          });
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Telefone',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => CadastroP2()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Próximo',
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
