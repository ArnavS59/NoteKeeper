import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({Key key}) : super(key: key);

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  static var _priorities = ["High", "Low"];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  //final TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDown) {
                  return DropdownMenuItem<String>(
                    value: dropDown,
                    child: Text(dropDown),
                  );
                }).toList(),
                value: "Low",
                onChanged: (valueSelected) {
                  debugPrint("UserSelected $valueSelected");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: titleController,
                //style: ,
                onChanged: (value) {
                  debugPrint("Something chnaged");
                },
                decoration: InputDecoration(
                    labelText: "Title",
                    //labelStyle: //
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: descriptionController,
                //  style: ,
                onChanged: (value) {
                  debugPrint("Something chnaged");
                },
                decoration: InputDecoration(
                    labelText: "Description",
                    //labelStyle: //
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),
            //padding
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      setState(() {
                        debugPrint("Save button clicked");
                      });
                    },
                    elevation: 2,
                    child: Text(
                      "To Do",
                      textScaleFactor: 1.5,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  )),
                  Spacer(),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        setState(() {
                          debugPrint("Delete button clicked");
                        });
                      },
                      elevation: 2,
                      child: Text(
                        "Delete",
                        textScaleFactor: 1.5,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
