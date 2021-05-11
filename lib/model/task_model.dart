
class Task{

  int id;
  String title;
  DateTime dateTime;
  String priority;
  int status;

  Task({this.title, this.dateTime, this.priority, this.status});

  Task.withID({this.id, this.title, this.dateTime, this.priority, this.status});


  Map<String, dynamic>toMap (){

    final map = Map<String, dynamic>();

    if(id != null){
      map['id'] = id;
    }

    map['id'] = id;
    map['title'] = title;
    map['dateTime'] = dateTime.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;

    return map;
  }

  factory Task.fromMap(Map<String, dynamic>map){
    return Task.withID(
      id: map ['id'],
      title: map ['title'],
      dateTime: map ['dateTime'],
      priority: map ['priority'],
      status: map ['status'],



    );
  }

}