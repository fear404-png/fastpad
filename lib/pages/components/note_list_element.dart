import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NoteListElementWidget extends StatelessWidget {
  final int index;
  const NoteListElementWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    NotesState state = BlocProvider.of<NotesBloc>(context).state;
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          //Кнопка появляется при слайде в право
          SlidableAction(
            onPressed: (context) => //Удаляет запись из списка
                BlocProvider.of<NotesBloc>(context).add(NoteDeleteEvent(index)),

            //Не менять в зависимости от темы, красный визуально дополняет кнопку удаления
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
          ),
        ],
      ),

      //Элемент записки
      child: ListTile(
        title: RichText(
          text: TextSpan(
              text: state.notes[index].title,
              style: state.themeData.textTheme.headline6),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: RichText(
          text: TextSpan(
              text: state.notes[index].subtitle,
              style: state.themeData.textTheme.subtitle2),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        leading: const Icon(Icons.document_scanner),
        trailing: Text(state.notes[index].timeEdit.toString()),
        onTap: () {
          Navigator.pushNamed(context, "/notes/note_view",
              arguments: {"id": index});
        },
      ),
    );
  }
}
