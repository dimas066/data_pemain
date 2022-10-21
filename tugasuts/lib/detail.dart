import 'package:flutter/material.dart';
import './editdata.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.index, required this.list});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://10.0.2.2/data_pemain/deletedata.php";
    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Are You sure want to delete '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        ElevatedButton(
          
          child: Text(
            "DELETE",
            style: TextStyle(color: Colors.black),
          ),
          
          // color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Home(),
            ));
          },
        ),
        Container(
          color: Colors.green,
          child:  ElevatedButton(
          child: Text("CANCEL", style: TextStyle(color: Colors.black)),
          
          // color: Colors.green,

          onPressed: () => Navigator.pop(context),
        ),
        )
       
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
    //showDialog(context: context, child: alertDialog);
    //showDialog(context: context, builder: alertDialog())
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("${widget.list[widget.index]['nama']}")),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Text(
                  "nama : ${widget.list[widget.index]['nama']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "ttl : ${widget.list[widget.index]['ttl']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "alamat : ${widget.list[widget.index]['alamat']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "telp : ${widget.list[widget.index]['telp']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "posisi : ${widget.list[widget.index]['posisi']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("EDIT"),
                      // color: Colors.green,
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => EditData(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    ElevatedButton(
                      child: Text("DELETE"),
                      // color: Colors.red,
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}