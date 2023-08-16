import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List myDailyTodo = [
    'Bangun pagi jam 6',
    'Mandi pagi jam 6.30',
    'Persiapan berangkat bekerja jam 6.45',
    'Makan pagi jam 7',
    'Persiapan berangkat kerja jam 7.15',
  ];

  void updateMyDaily(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }
      //we have 2 things for the function running
      //1. get the myDaily are move, and
      final myDaily = myDailyTodo.removeAt(oldIndex);

      //2. place the myDaily in the new position
      myDailyTodo.insert(newIndex, myDaily);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReorderableListView(
        header: Container(
          alignment: Alignment.center,
          height: 50,
          color: const Color.fromARGB(0, 177, 109, 109).withOpacity(0.5),
          child: const Text('My Daily TODO List'),
        ),
        children: [
          for (final myDaily in myDailyTodo)
            ListTile(
              key: ValueKey(myDaily),
              leading: const Icon(Icons.lock_clock_rounded),
              title: Text(myDaily),
              trailing: const Icon(Icons.drag_handle_outlined),
            ),
        ],
        onReorder: (oldIndex, newIndex) => updateMyDaily(oldIndex, newIndex),
      ),
    );
  }
}
