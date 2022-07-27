import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Записи"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/notes/setting");
            },
            child: Icon(Icons.settings,
                color: Theme.of(context).colorScheme.onError),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(),
      ),
      body: BlocBuilder<NotesBloc, NotesState>(builder: (context, state) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              startActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => BlocProvider.of<NotesBloc>(context)
                        .add(NoteDeleteEvent(index)),
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
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
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.black,
            height: 2,
          ),
          itemCount: state.notes.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/notes/note_edit");
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
