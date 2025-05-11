import 'task_model.dart';

class CategoryModel {
  String name;
  bool isChecked;
  List<TaskModel> taskModels;

  CategoryModel({
    required this.name,
    required this.isChecked,
    required this.taskModels,
  });
}