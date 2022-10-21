import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerttl;
  late TextEditingController controlleralamat;
  late TextEditingController controllertelp;
  late TextEditingController controllerposisi;

  void editData() {
    var url = Uri.parse("http://10.0.2.2/data_pemain/editdata.php");
    http.post(url, body: {
      "nama": widget.list[widget.index]['nama'],
      "ttl": controllerttl.text,
      "alamat": controlleralamat.text,
      "telp": controllertelp.text,
      "posisi": controllerposisi.text
    });
  }

  @override
  void initState() {
    controllerttl =
        new TextEditingController(text: widget.list[widget.index]['ttl']);
    controlleralamat =
        new TextEditingController(text: widget.list[widget.index]['alamat']);
    controllertelp =
        new TextEditingController(text: widget.list[widget.index]['telp']);
    controllerposisi =
        new TextEditingController(text: widget.list[widget.index]['posisi']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
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
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()));
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