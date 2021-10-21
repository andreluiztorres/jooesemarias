import 'package:flutter/material.dart';
import 'package:projeto1/mysql.dart';
import 'package:projeto1/procura.dart';
import 'package:projeto1/usuario.dart';
import 'detalhes.dart';

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  String profpesquisado;
  String cidadepesquisado;
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

  String nomeLog = Usuario.nome.toString();
  String cabecalho = 'Usuario não logado';

  Future resultado() async {
    db.getConnection().then((conn) async {
      String sql =
          "SELECT usuarios.usr_id, usuarios.usr_nome, usuarios.usr_cidade, atributos.profissao, atributos.valor, atributos.um, atributos.descricao, atributos.estrelas FROM usuarios INNER JOIN atributos ON usuarios.usr_id=atributos.usr_id WHERE profissao  like '%$profpesquisado%' AND usr_cidade like '%$cidadepesquisado%'";
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Joões e Marias - Pesquisa'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Procura()));
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: Text(cabecalho)),
            ListTile(
              title: Text('Minha Conta'),
            ),
            ListTile(
              title: Text('Notificações'),
            ),
            ListTile(
              title: Text('Contratos'),
            ),
            ListTile(
              title: Text('LOGIN'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          TextField(
            onChanged: (text) {
              profpesquisado = text;

              setState(() {
                resultado();
              });
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'O que procura?',
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onChanged: (text) {
              cidadepesquisado = text;

              setState(() {
                resultado();
              });
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_pin),
                labelText: 'Para qual Cidade?',
                border: OutlineInputBorder()),
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
                        onTap: () {
                          Usuario.selecionado = idusr[index].toString();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Detalhes()),
                          );
                        },
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
                              descri[index].toString().substring(0, 80) + '...',
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
          )
        ],
      ),
    );
  }
}
