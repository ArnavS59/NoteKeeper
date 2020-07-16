class Note {
  int id;
  String title;
  int priority;
  String description;
  String date;

  //NotewithId({this.title, this.date, this.description, this.priority});
  Note({this.title, this.date, this.description, this.id, this.priority});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map["id"] = id;
    }
    map["title"] = title;
    map["description"] = description;
    map["date"] = date;
    map["priority"] = priority;
    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map) {
    this.title = map["title"];
    this.date = map["date"];
    this.description = map["description"];
    this.id = map["id"];
    this.priority = map["priority"];
  }
}

// String get title => _title;

// set title(String newTitle) {
//   if (newTitle.length <= 255) {
//     this.title = newTitle;
//   }
// }
