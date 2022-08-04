import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:fastpad/hive/note_model.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class NoteEditWidget extends StatelessWidget {
  const NoteEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();

    NotesState state = BlocProvider.of<NotesBloc>(context).state;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    if (state.notes.isNotEmpty && arguments["id"] != null) {
      titleController.text = state.notes[arguments["id"]].title;
      subtitleController.text = state.notes[arguments["id"]].subtitle;
    }

    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () {},
          child: const Icon(Icons.settings),
        )
      ]),
      body:  ListView(
          children: [
            ListTile(
              title: TextField(
                style: Theme.of(context).textTheme.titleLarge,
                decoration: const InputDecoration(
                  hintText: ("Название"),
                ),
                controller: titleController,
              ),
              subtitle: TextField(
                decoration: const InputDecoration(
                    hintText: ("Текст"), border: InputBorder.none),
                maxLines: null,
                controller: subtitleController,
              ),
            ),
            SizedBox(
              height: 90,
            )
          ],
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NoteModel note = NoteModel(
              titleController.text,
              subtitleController.text,
              BlocProvider.of<NotesBloc>(context).state.notes.length - 1);
          if (arguments["id"] == null) {
            BlocProvider.of<NotesBloc>(context).add(NoteAddEvent(note));
          } else {
            BlocProvider.of<NotesBloc>(context)
                .add(NoteEditEvent(note, arguments["id"]));
          }

          Navigator.pop(context, arguments);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
