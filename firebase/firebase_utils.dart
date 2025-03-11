import 'task_data_model.dart';

class FirebaseUtils {
  // function to creete get collection
  static CollectionReference<TaskDataModel> getCollection(
    String coloectionName,
  ) {
    return FirebaseFirestore.instance
        .collection(coloectionName)
        .withConverter<TaskDataModel>(
          fromFirestore:
              (snapshot, _) => TaskDataModel.formFirestore(snapshot.data()!),
          toFirestore: (taskDataModel, _) => taskDataModel.toMap(),
        );
  }

  // function to write data in firebase firestore
  static Future<void> AddTask(TaskDataModel taskModel) {
    var collection = getCollection('task');
    var doc = collection.doc();
    taskModel.id = doc.id;
    return doc.set(taskModel);
  }
}
