import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:fastpad/pages/components/note_list_element.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NoteListWidget extends StatelessWidget {
  const NoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
      return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return NoteListElementWidget(
            index: index,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.black,
          height: 2,
        ),
        itemCount: state.notes.length,
      );
    });
  }
}
