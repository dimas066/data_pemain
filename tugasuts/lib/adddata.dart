import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerttl = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
  TextEditingController controllertelp = new TextEditingController();
  TextEditingController controllerposisi = new TextEditingController();

  void addData() {
    var url = Uri.parse("http://10.0.2.2/data_pemain/adddata.php");

    http.post(url, body: {
      "ttl": controllerttl.text,
      "alamat": controlleralamat.text,
      "telp": controllertelp.text,
      "posisi": controllerposisi.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerttl,
                  decoration: new InputDecoration(
                      hintText: "ttl", labelText: "ttl"),
                ),
                new TextField(
                  controller: controlleralamat,
                  decoration: new InputDecoration(
                      hintText: "alamat", labelText: "alamat"),
                ),
                new TextField(
                  controller: controllertelp,
                  decoration: new InputDecoration(
                      hintText: "telp", labelText: "telp"),
                ),
                new TextField(
                  controller: controllerposisi,
                  decoration: new InputDecoration(
                      hintText: "posisi", labelText: "posisi"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new MaterialButton(
                  child: new Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}