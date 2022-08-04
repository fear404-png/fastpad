import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:fastpad/pages/components/custom_list_tile.dart';
import 'package:fastpad/pages/components/custom_separator.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class NoteListWidget extends StatelessWidget {
  const NoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
      return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              CustomListTile(
                index: index,
              ),
              index == state.notes.length - 1
                  ? Container(
                      height: 100,
                    )
                  : Container()
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const CustomSeparator(),
        itemCount: state.notes.length,
      );
    });
  }
}
