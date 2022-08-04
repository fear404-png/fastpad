import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:fastpad/hive/note_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteEditPage extends StatelessWidget {
  const NoteEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController subtitle = TextEditingController();
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    title.text = arguments['title'];

    subtitle.text = arguments['subtitle'];

    final int id = arguments['id'];
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          appBar: AppBar(
            actions: [],
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<NotesBloc>(context).add(
                  NoteEditEvent(NoteModel(title.text, subtitle.text, id), id));
              Navigator.pop(context);
            },
            child: const Icon(Icons.check),
          ),
          body: Column(
            children: [
              ListTile(
                title: TextField(
                  controller: title,
                  maxLines: 1,
                  decoration: const InputDecoration(hintText: "Заголовок"),
                ),
                subtitle: TextField(
                  controller: subtitle,
                  maxLines: null,
                  decoration: const InputDecoration(
                      hintText: "Текст", border: InputBorder.none),
                ),
                style: ListTileStyle.list,
              ),
            ],
          ),
        );
      },
    );
  }
}
