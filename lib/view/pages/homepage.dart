import 'package:bottom_navigate_bar/view/navigation/list_of_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int indexOfThePage = 0;

List<String> tasks = ["Clean", "Cooking", "Study", "Work"];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Scaffold(
        body: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) => ListTile(
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text("Are you sure to delete this task"),
                                      actions: [
                                         TextButton(
                                            onPressed: () {},
                                            child: Text("No")),
                                        TextButton(
                                            onPressed: () {
                                            setState(() {
                                              
                                              tasks.remove(tasks[index]);
                                            });
                                            Navigator.pop(context);
                                            },
                                            child: Text("yes")),
                                           
                                      ],
                                    ));
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      title: Text(tasks[index]),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      TextEditingController newtask = TextEditingController();
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 300,
                                  child: TextField(
                                    controller: newtask,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        new SnackBar(
                                            showCloseIcon: true,
                                            dismissDirection:
                                                DismissDirection.endToStart,
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.green,
                                            action: SnackBarAction(
                                                label: "okay",
                                                onPressed: () {}),
                                            content:
                                                Text("Success to Add task")));

                                    tasks.add(newtask.text);

                                    Navigator.pop(context);
                                  },
                                  child: Text("add new task"))
                            ],
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
          ),
        ),
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.green,
      )
    ];
    return Scaffold(
      body: pages[indexOfThePage],
      bottomSheet: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              indexOfThePage = value;
            });
          },
          selectedIndex: indexOfThePage,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Account'),
            NavigationDestination(icon: Icon(Icons.message), label: 'Message'),
          ]),
    );
  }
}
