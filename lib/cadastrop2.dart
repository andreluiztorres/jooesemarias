import 'package:flutter/material.dart';
import 'package:projeto1/usuario.dart';
import 'cadastrop3.dart';

class CadastroP2 extends StatefulWidget {
  @override
  _CadastroP2State createState() => _CadastroP2State();
}

class _CadastroP2State extends State<CadastroP2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Joões e Marias - Localização'),
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
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            Usuario.endereco = text;
                          });
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Endereço',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            Usuario.numero = text;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Número', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            Usuario.complemento = text;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Complemento',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            Usuario.cidade = text;
                          });
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Cidade', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            Usuario.uf = text;
                          });
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Estado', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => CadastroP3()),
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
