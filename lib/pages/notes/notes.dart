import 'package:fastpad/pages/components/note_list.dart';
import 'package:flutter/material.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Записи"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/notes/setting");
            },
            child: Icon(Icons.settings,
                color: Theme.of(context).colorScheme.onError),
          )
        ],
      ),
      body: const NoteListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/notes/note_edit");
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
