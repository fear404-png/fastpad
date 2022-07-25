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
            child: const Icon(Icons.settings),
          )
        ],
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
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ListTile(
                    title: Text(state.notesState[index].title),
                    subtitle: Text(state.notesState[index].subtitle),
                    leading: const Icon(Icons.document_scanner),
                    onTap: () {
                      Navigator.pushNamed(context, "/notes/note_view",
                          arguments: {"id": index});
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Text(state.notesState[index].timeEdit.toString()),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.black,
            height: 2,
          ),
          itemCount: state.notesState.length,
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/notes/note_edit");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
