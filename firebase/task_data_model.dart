// class to create task data model
class TaskDataModel {
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  TaskDataModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    this.isDone = false,
  });

  TaskDataModel.formFirestore(Map<String, dynamic> map)
    : this(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(
          map['dateTime'],
        ), // to convert milliseconds to date time.
        isDone: map['isDone'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime':
          dateTime
              .millisecondsSinceEpoch, // to convert date time to milliseconds, to make us able to do any operation on it.
      'isDone': isDone,
    };
  }
}
