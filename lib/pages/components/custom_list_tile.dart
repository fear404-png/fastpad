import 'package:fastpad/bloc/custom_bottom_sheet_bloc/custom_bottom_sheet_bloc.dart';
import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomListTile extends StatelessWidget {
  final int index;
  const CustomListTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                foregroundColor: Theme.of(context).colorScheme.primary,
                onPressed: (context) {},
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                icon: Icons.share,
                label: 'Поделиться',
              ),
              SlidableAction(
                foregroundColor: Theme.of(context).colorScheme.primary,
                onPressed: (context) {
                  BlocProvider.of<NotesBloc>(context).add(PinNoteEvent(index));
                },
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                icon: state.notes[index].isLock
                    ? Icons.heart_broken
                    : Icons.favorite,
                label: state.notes[index].isLock ? 'Открепить' : 'Закрепить',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                foregroundColor: Theme.of(context).colorScheme.primary,
                onPressed: (context) {
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
                                    BlocProvider.of<NotesBloc>(context)
                                        .add(NoteDeleteEvent(index));
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: RichText(
                                        text: TextSpan(
                                            text:
                                                'Запись ${state.notes[index].title} удалена',
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline
                                                ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .inversePrimary)),
                                        maxLines: 2,
                                      ),
                                      duration:
                                          const Duration(milliseconds: 800),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                    ));
                                  },
                                  child: const Text("Да")),
                            ],
                          )));
                },
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                icon: Icons.delete,
                label: 'Удалить',
              ),
            ],
          ),
          child: InkWell(
            splashColor: Theme.of(context).colorScheme.primary,
            onTap: () {
              BlocProvider.of<CustomBottomSheetBloc>(context)
                  .add(OpenEvent(false));
              Navigator.pushNamed(context, "/notes/note_view",
                  arguments: {"id": index});
            },
            child: Container(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                      height: 30,
                    ),
                  ),
                  state.notes[index].isLock
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite,
                              size: 20,
                              color: Theme.of(context).colorScheme.primary),
                        )
                      : Container(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: state.notes[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inverseSurface)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          RichText(
                            text: TextSpan(
                                text: state.notes[index].subtitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inverseSurface)),
                            maxLines: 3,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 135,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(state.notes[index].timeEdit.toString(),
                          style: Theme.of(context).textTheme.overline?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .inverseSurface)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                      height: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
