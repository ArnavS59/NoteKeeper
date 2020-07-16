import 'package:NoteKeeper/screens/note_details.dart';
import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

int count = 0;

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    // void naviagtetoPage() {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
    //     return NoteDetails();
    //   }));
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: getListNoteView(),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: 'Add Note',
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return NoteDetails();
          }));
        },
      ),
    );
  }
}

ListView getListNoteView() {
  // TextStyle titlestyle = Theme.of(ctx).textTheme.subtitle1;
  return ListView.builder(
    itemCount: count,
    itemBuilder: (BuildContext context, int position) {
      return Card(
        color: Colors.white,
        elevation: 2,
        child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text(
              "Dummy title",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "Dummy DATE",
            ),
            trailing: Icon(
              Icons.delete,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NoteDetails();
              }));
            }),
      );
    },
  );
}
