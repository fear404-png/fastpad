import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:flutter/material.dart';
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
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            title: const Text("Хотите удалить запись?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Нет")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, "/notes", (route) => false);

                                    BlocProvider.of<NotesBloc>(context)
                                        .add(NoteDeleteEvent(arguments["id"]));
                                  },
                                  child: const Text("Да")),
                            ],
                          )));
                },
                child: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.onError),
              )
            ],
          ),
          body: state.notes.length > arguments["id"] && state.notes.isNotEmpty
              ? ListTile(
                  title: Text(
                    "\n${state.notes[arguments["id"]].title}\n",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(state.notes[arguments["id"]].subtitle),
                )
              : const Text("Удалено"),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, "/notes/note_edit",
                    arguments: arguments);
              },
              child: const Icon(Icons.edit)),
        );
      },
    );
  }
}
