import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projeto1/usuario.dart';
import 'contrato.dart';
import 'mysql.dart';

class Detalhes extends StatefulWidget {
  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  void initState() {
    super.initState();
    if (contlista == 0) {
      Timer(Duration(seconds: 1), () => setState(() {}));
    }
  }

  var db = new Mysql();
  // ignore: deprecated_member_use
  int contlista = 0;
  // ignore: deprecated_member_use
  var idusr = new List();
  // ignore: deprecated_member_use
  var nome = new List();
  // ignore: deprecated_member_use
  var cidade = new List();
  // ignore: deprecated_member_use
  var profiss = new List();
  // ignore: deprecated_member_use
  var valor = new List();
  // ignore: deprecated_member_use
  var descri = new List();
// ignore: deprecated_member_use
  var um = new List();
// ignore: deprecated_member_use
  var estrelas = new List();
  String idprof = Usuario.selecionado;

  Future resultado() async {
    db.getConnection().then((conn) async {
      String sql =
          "SELECT usuarios.usr_id, usuarios.usr_nome, usuarios.usr_cidade, atributos.profissao, atributos.valor, atributos.um, atributos.descricao, atributos.estrelas FROM usuarios INNER JOIN atributos ON usuarios.usr_id=atributos.usr_id WHERE usuarios.usr_id='$idprof'";
      var results = await conn.query(sql);
      contlista = 0;
      idusr.clear();
      nome.clear();
      cidade.clear();
      profiss.clear();
      valor.clear();
      descri.clear();
      um.clear();
      estrelas.clear();

      for (var row in results) {
        idusr.add(row[0].toString());
        nome.add(row[1].toString());
        cidade.add(row[2].toString());
        profiss.add(row[3].toString());
        valor.add(row[4]);
        um.add(row[5].toString());
        descri.add(row[6].toString());
        estrelas.add(row[7]);
        contlista++;
      }

      await conn.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    resultado();
    return Scaffold(
      appBar: AppBar(
        title: Text('Joões e Marias - Detalhes'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: nome.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      color: Colors.indigo[50],
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profiss[index].toString().toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 35,
                                ),
                                Image.asset('assets/' +
                                    estrelas[index].toString() +
                                    '.png'),
                                Text(
                                  nome[index].toString() +
                                      " - " +
                                      cidade[index].toString(),
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.indigo),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'R\$ ' + valor[index].toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.indigo),
                                ),
                                Text(
                                  ' ' + um[index].toString(),
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.indigo),
                                ),
                              ],
                            ),
                            Text(
                              descri[index].toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.indigo,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Contrato()),
              );
            },
            child: Container(
              width: double.infinity,
              child: Text(
                'Contratar Serviços',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
