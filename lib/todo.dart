import 'dbhelper.dart';
import 'package:flutter/material.dart';

class ToDO extends StatefulWidget {
  const ToDO({Key key}) : super(key: key);

  @override
  _ToDOState createState() => _ToDOState();
}

final texteditingController = TextEditingController();

class _ToDOState extends State<ToDO> {
  final dbhelper = Databasehelper.instance;
  bool validated = true;
  String errtxt = "";
  String todoEdited = "";
  var myItems = List();
  List<Widget> children = new List<Widget>();

  void addtodo() async {
    Map<String, dynamic> row = {
      Databasehelper.columnName: todoEdited,
    };
    final id = await dbhelper.insert(row);
    Navigator.pop(context);
    todoEdited = "";
    setState(() {
      validated = true;
      errtxt = "";
    });
  }

  Future<bool> query() async {
    myItems = [];
    children = [];
    var allrows = await dbhelper.queryall(); //for all the rows in the database
    allrows.forEach((row) {
      // for each row, entry
      myItems.add(row.toString());
      children.add(Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Text(
              row['todo'],
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onLongPress: () {
              dbhelper.deletedata(row['id']);
              //   debugPrint("Deleted");
              setState(() {});
            },
          ),
        ),
      ));
    });
    return Future.value(true);
  }

  void showAlertdialog() {
    texteditingController.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text("Add New Task"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      onChanged: (_val) {
                        todoEdited = _val;
                      },
                      controller: texteditingController,
                      autofocus: true,
                      decoration:
                          InputDecoration(errorText: validated ? null : errtxt),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: RaisedButton(
                            color: Colors.purple,
                            onPressed: () {
                              if (texteditingController.text.isEmpty) {
                                setState(() {
                                  errtxt = "Cannot be empty";
                                  validated = false;
                                });
                              } else if (texteditingController.text.length >
                                  512) {
                                setState(() {
                                  errtxt = "Cannot exceed limit";
                                  validated = false;
                                });
                              } else {
                                addtodo();
                              }
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        if (snap.hasData == null) {
          return Center(
            child: Text("No data available"),
          );
        } else {
          if (myItems.length == 0) {
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.purpleAccent,
                onPressed: () {
                  showAlertdialog();
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              appBar: AppBar(
                title: Text(
                  "MY TASKS",
                  style: TextStyle(
                    //  fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //  backgroundColor: Colors.black
              ),
              //  backgroundColor: Colors.black87,
              body: Center(
                child: Text("No Task Available"),
              ),
            );
          } else {
            return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.purpleAccent,
                onPressed: () {
                  showAlertdialog();
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              appBar: AppBar(
                title: Text(
                  "MY TASKS",
                  style: TextStyle(
                    //  fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //  backgroundColor: Colors.black
              ),
              //backgroundColor: Colors.black87,
              body: SingleChildScrollView(
                child: Column(
                  children: children,
                ),
              ),
            );
          }
        }
      },
      future: query(),
    );
  }
}
