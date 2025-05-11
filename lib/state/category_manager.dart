import 'package:flutter/foundation.dart';
import '../models/category_model.dart';
import '../models/task_model.dart';

class CategoryManager extends ChangeNotifier {
  final List<CategoryModel> mainCategories = [];

  void addCategory(String name) {
    mainCategories.add(
      CategoryModel(name: name, isChecked: false, taskModels: []),
    );
    notifyListeners();
  }

  void removeCategory(int index) {
    mainCategories.removeAt(index);
    notifyListeners();
  }

  void toggleCategoryCheck(int index) {
    mainCategories[index].isChecked = !mainCategories[index].isChecked;
    notifyListeners();
  }

  void addTask(int categoryIndex, String taskName) {
    mainCategories[categoryIndex].taskModels.add(
      TaskModel(taskName: taskName, isChecked: false),
    );
    notifyListeners();
  }

  void removeTask(int categoryIndex, int taskIndex) {
    mainCategories[categoryIndex].taskModels.removeAt(taskIndex);
    notifyListeners();
  }

  void toggleTaskCheck(int categoryIndex, int taskIndex) {
    final task = mainCategories[categoryIndex].taskModels[taskIndex];
    task.isChecked = !task.isChecked;
    notifyListeners();
  }
}