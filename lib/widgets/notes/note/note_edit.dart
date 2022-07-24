import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteEditWidget extends StatelessWidget {
  const NoteEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () {},
          child: const Icon(Icons.settings),
        )
      ]),
      body: ListTile(
        title: TextField(
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: ("Название"),
          ),
          controller: titleController,
        ),
        subtitle: TextField(
          decoration:
              InputDecoration(hintText: ("Текст"), border: InputBorder.none),
          maxLines: null,
          controller: subtitleController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<NotesBloc>(context).add(NoteAdd(Note(
              titleController.text,
              subtitleController.text,
              BlocProvider.of<NotesBloc>(context).state.notesState.length)));
          print(titleController.text +
              "\n" +
              BlocProvider.of<NotesBloc>(context)
                  .state
                  .notesState
                  .length
                  .toString());
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
