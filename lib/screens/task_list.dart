import 'package:flutter/material.dart';
import '../state/category_manager.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({
    super.key,
    required this.categoryManager,
    required this.categoryIndex,
  });

  final CategoryManager categoryManager;
  final int categoryIndex;

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController controller = TextEditingController();

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(milliseconds: 300),
        child: AlertDialog(
          title: const Text('Add Task'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Task Name',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                final name = controller.text.trim();
                if (name.isNotEmpty) {
                  widget.categoryManager.addTask(widget.categoryIndex, name);
                  controller.clear();
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final category = widget.categoryManager.mainCategories[widget.categoryIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('${category.name} Tasks'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: widget.categoryManager,
              builder: (context, _) {
                final tasks = category.taskModels;
                return ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 80),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          title: Text(task.taskName),
                          leading: Checkbox(
                            value: task.isChecked,
                            onChanged: (_) {
                              widget.categoryManager.toggleTaskCheck(
                                  widget.categoryIndex, index);
                            },
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => widget.categoryManager
                                .removeTask(widget.categoryIndex, index),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}