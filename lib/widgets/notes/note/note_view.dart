import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteViewWidget extends StatelessWidget {
  const NoteViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ListTile(
            title: Text(
              state.notesState[arguments["id"]].title,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(state.notesState[arguments["id"]].subtitle),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/notes/note_edit",
                    arguments: {"id": arguments["id"]});
              },
              child: const Icon(Icons.edit)),
        );
      },
    );
  }
}
