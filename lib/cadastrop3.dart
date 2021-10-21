import 'package:flutter/material.dart';
import 'package:projeto1/lista.dart';
import 'package:projeto1/parametros.dart';
import 'package:projeto1/usuario.dart';
import 'mysql.dart';

class CadastroP3 extends StatefulWidget {
  @override
  _CadastroP3State createState() => _CadastroP3State();
}

class _CadastroP3State extends State<CadastroP3> {
  String senha;
  String resenha;
  String id = DateTime.now().hashCode.toString();
  String nome = Usuario.nome;
  String mail = Usuario.email;
  String fone = Usuario.telefone;
  String endereco = Usuario.endereco;
  String number = Usuario.numero;
  String complemento = Usuario.complemento;
  String cidade = Usuario.cidade;
  String uf = Usuario.uf;
  String tipo = Usuario.tipouser;
  var db = new Mysql();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Joões e Marias - Senha'),
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
                            senha = text;
                          });
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Senha', border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (text) {
                          setState(() {
                            resenha = text;
                          });
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Confirmar Senha',
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          if (senha == resenha) {
                            Usuario.statuslog = true;
                            Usuario.senha = senha;
                            Usuario.id = id;
                            resultado();

                            if (tipo == "cc") {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Lista()),
                              );
                            } else {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Parametros()),
                              );
                            }
                          } else {
                            // ignore: deprecated_member_use
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  // retorna um objeto do tipo Dialog
                                  return AlertDialog(
                                    title: new Text("Senhas inválida."),
                                    content: new Text(
                                        "Os campos Senha e Confirmar Senha não correspondem."),
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
                            'Finalizar',
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
          "INSERT INTO usuarios (usr_id, usr_nome, usr_mail, usr_fone, usr_endereco, usr_number, usr_complemento, usr_cidade, usr_uf, usr_psw, usr_tipo) VALUES ('$id', '$nome', '$mail', '$fone', '$endereco', '$number', '$complemento', '$cidade', '$uf', '$senha', '$tipo')";
      await conn.query(sql);

      await conn.close();
    });
  }
}
