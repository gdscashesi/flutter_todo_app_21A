


class Task{
  late String title;
  late String notes;
  late bool setDate;
  late String taskGroup;
  late DateTime date;
  List<String>? imageList;
  int? priority;


  Task({
    required this.title,
    required this.notes,
    required this.setDate,
    required this.taskGroup,
    required this.date,
    this.imageList,
    this.priority
});


  Task.fromMap(Map<String, dynamic>map)  {
     Task(
        title: map["title"],
        notes: map['notes'],
        setDate: map["setDate"],
        taskGroup: map["taskGroup"],
        date: DateTime.fromMillisecondsSinceEpoch(map["date"]),
        imageList: map["imageList"],
        priority: map["priority"]
    );
  }


  Map<String,dynamic> toMap() =>{
    "title" : title,
    "notes" : notes,
    "setDate" : setDate,
    "taskGroup" : taskGroup,
    "imageList" : imageList,
    "priority" : priority,
    "date" : date.millisecondsSinceEpoch
  };

}