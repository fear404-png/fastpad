import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Записи")),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                ListTile(
                  title: Text('item $index'),
                  subtitle: Text("eiowfgjweohweo wetiwert"),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text("16.02.22"),
                  alignment: Alignment.centerRight,
                )
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
                color: Colors.black,
                height: 2,
              ),
          itemCount: 100),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
