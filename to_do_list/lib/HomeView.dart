import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  TextEditingController controller = TextEditingController();
  TextEditingController searchController = TextEditingController();
  final String mapKey = "task";
  final String statusKey = "status";
  final String spKey = "task";
  List<Map<String, dynamic>> tasks = [];

  String searchText = "";

  @override
  void initState() {
    getTasks();
    super.initState();
  }

  void addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        tasks.add({mapKey: controller.text.toString(), statusKey: false});
      });
      saveTasks();
    }
    controller.clear();
  }

  Future<void> saveTasks() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String data = json.encode(tasks);
    sp.setString(spKey, data);
  }

  Future<void> getTasks() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? data = sp.getString(spKey);
    if (data != null) {
      List<dynamic> decodedData = json.decode(data);
      setState(() {
        tasks = decodedData
            .map((item) => Map<String, dynamic>.from(item))
            .toList();
      });
    }
  }

  void isCompleted(int index) {
    setState(() {
      tasks[index][statusKey] = !tasks[index][statusKey];
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 55,
              child: TextField(
                onChanged: (String value) {
                  setState(() {
                    searchText = value;
                  });
                },
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.topLeft,
              child: Text("All TO-D0s", style: TextStyle(fontSize: 22)),
            ),
            const SizedBox(height: 20),
            tasks.isEmpty
                ? Center(
                    child: Column(
                      children: [
                        Icon(Icons.inbox, size: 80, color: Colors.grey),
                        SizedBox(height: 10),
                        Text(
                          "No Tasks Available",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        late String position = tasks[index][mapKey];
                        if (searchController.text.toString().isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                leading: GestureDetector(
                                  onTap: () {
                                    isCompleted(index);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: tasks[index][statusKey]
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: tasks[index][statusKey]
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.onPrimary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  tasks[index][mapKey],
                                  style: TextStyle(
                                    decoration: tasks[index][statusKey]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    deleteTask(index);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ),
                            ),
                          );
                        } else if (position.toLowerCase().contains(
                          searchController.text.toString(),
                        )) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              width: double.infinity,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                leading: GestureDetector(
                                  onTap: () {
                                    isCompleted(index);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      color: tasks[index][statusKey]
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: tasks[index][statusKey]
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.onPrimary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  tasks[index][mapKey],
                                  style: TextStyle(
                                    decoration: tasks[index][statusKey]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    deleteTask(index);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add New Task"),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(hintText: "Enter task"),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Theme.of(
                            context,
                          ).colorScheme.onPrimary,
                        ),
                        onPressed: () {
                          addTask();
                          Navigator.pop(context);
                        },
                        child: Text("Add"),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
