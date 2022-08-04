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
                onPressed: (context) {
                  BlocProvider.of<NotesBloc>(context)
                      .add(NoteDeleteEvent(index));

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Запись ${state.notes[index].title} удалена',
                      style: Theme.of(context).textTheme.overline,
                    ),
                    duration: const Duration(milliseconds: 800),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ));
                },
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                icon: Icons.delete,
                label: 'Удалить',
              ),
              SlidableAction(
                foregroundColor: Theme.of(context).colorScheme.primary,
                onPressed: (context) {},
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                icon: Icons.share,
                label: 'Поделиться',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                foregroundColor: Theme.of(context).colorScheme.primary,
                onPressed: (context) {},
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                icon: Icons.favorite,
                label: 'Закрепить',
              ),
              SlidableAction(
                foregroundColor: Theme.of(context).colorScheme.primary,
                onPressed: (context) {},
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                icon: Icons.settings,
                label: 'Настройки',
              ),
            ],
          ),
          child: InkWell(
            splashColor: Theme.of(context).colorScheme.primary,
            onTap: () {
              BlocProvider.of<NotesBloc>(context)
                  .add(ChangeStateBottomSheet(false));
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.favorite,
                        size: 20, color: Theme.of(context).colorScheme.primary),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: state.notes[index].title,
                                style: Theme.of(context).textTheme.titleMedium),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          RichText(
                            text: TextSpan(
                                text: state.notes[index].subtitle,
                                style: Theme.of(context).textTheme.bodySmall),
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
