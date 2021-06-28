import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: todoapp(),
  ));
}

// ignore: camel_case_types
class todoapp extends StatefulWidget {


  @override
  _todoappState createState() => _todoappState();
}

class _todoappState extends State<todoapp> {
  var output = "";
  List<dynamic> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50.0,
                color: Colors.blue,
                margin: EdgeInsets.only(top: 15),
                child: ListTile(
                  title: Text(
                    "${list[index]}",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          list.removeAt(index);
                        });
                      },
                      child: Icon(Icons.delete)),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Add Item "),
                    content: TextField(
                      onChanged: (value) {
                        output = value;
                      },
                    ),
                    actions: [
                      FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            list.add(output);
                          });
                        },
                        child: Text("Add"),
                      )
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
        ));
  }
}
