import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto1/lista.dart';
import 'package:projeto1/mysql.dart';
import 'package:projeto1/usuario.dart';

class Parametros extends StatefulWidget {
  @override
  _ParametrosState createState() => _ParametrosState();
}

class _ParametrosState extends State<Parametros> {
  var db = new Mysql();
  String unimedidas;
  List umItens = ["Hora", "Diaria", "M²", "M³", "Metros", "Km", "Kg", "Litros"];
  String id = Usuario.id;
  String profissao;
  String valor;
  String um;
  String minimo;
  String descricao;
  var contaletras = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Joões e Marias - Parametros'),
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
                            profissao = text;
                          });
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: 'Tipo de Serviço Prestado',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            valor = text;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Valor do Serviço',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "O serviço será cobrado por:",
                        style: TextStyle(fontSize: 18),
                      ),
                      DropdownButton(
                          value: unimedidas,
                          onChanged: (novovalor) {
                            setState(() {
                              unimedidas = novovalor;
                              um = unimedidas;
                            });
                          },
                          items: umItens.map((novovalor) {
                            return DropdownMenuItem(
                                value: novovalor, child: Text(novovalor));
                          }).toList()),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            minimo = text;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Quantidade mínima aceita por contrato',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            descricao = text;
                            contaletras = text.length;
                          });
                        },
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            labelText:
                                'Descrição do serviço - $contaletras letras',
                            border: OutlineInputBorder()),
                        maxLines: 5,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          if (descricao.length >= 80) {
                            resultado();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Lista()),
                            );
                          } else {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // retorna um objeto do tipo Dialog
                                  return AlertDialog(
                                    title: new Text("Descrição inválida."),
                                    content: new Text(
                                        "O campo Descrição de Serviço deve conter pelo mentos letras."),
                                    actions: <Widget>[
                                      // define os botões na base do dialogo
                                      // ignore: deprecated_member_use
                                      new FlatButton(
                                        child: new Text("Fechar"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            });
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Finalizar Cadastro',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }

  Future resultado() async {
    db.getConnection().then((conn) async {
      String sql =
          "INSERT INTO atributos (usr_id, profissao, valor, um, minimo, descricao, estrelas, opnaram) VALUES ('$id', '$profissao', '$valor', '$um', '$minimo', '$descricao', '3', '0')";
      await conn.query(sql);

      await conn.close();
    });
  }
}
