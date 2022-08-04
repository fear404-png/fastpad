import 'package:fastpad/bloc/custom_bottom_sheet_bloc/custom_bottom_sheet_bloc.dart';
import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:fastpad/hive/note_model.dart';
import 'package:fastpad/pages/components/note_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/custom_bottom_sheet.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text("Записи"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/notes/setting");
                  },
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/notes/setting");
                  },
                  child: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Colors.green),
                      accountName: Text('Мистер Твистер'),
                      accountEmail: Text("ds@ds.g"),
                      currentAccountPicture: Container(
                          decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.red,
                      )),
                    ),
                  ),
                  ListTile(
                      title: new Text("О себе"),
                      leading: Icon(Icons.account_box),
                      onTap: () {}),
                  ListTile(
                      title: new Text("Настройки"),
                      leading: Icon(Icons.settings),
                      onTap: () {})
                ],
              ),
            ),
            bottomSheet: CustomBottomSheet(),
            body: const NoteListWidget(),
            floatingActionButton:
                BlocBuilder<CustomBottomSheetBloc, CustomBottomSheetState>(
              builder: (context, state) {
                return state.isOpenBottomSheet
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              BlocProvider.of<CustomBottomSheetBloc>(context)
                                  .add(OpenEvent(
                                      !BlocProvider.of<CustomBottomSheetBloc>(
                                              context)
                                          .state
                                          .isOpenBottomSheet));
                              Navigator.pushNamed(context, "/notes/note_edit",
                                  arguments: {
                                    "title": state.title,
                                    "subtitle": state.subtitle
                                  });
                            },
                            child: const Icon(
                              Icons.fullscreen,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              BlocProvider.of<CustomBottomSheetBloc>(context)
                                  .add(OpenEvent(
                                      !BlocProvider.of<CustomBottomSheetBloc>(
                                              context)
                                          .state
                                          .isOpenBottomSheet));
                            },
                            child: const Icon(
                              Icons.arrow_downward_rounded,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              BlocProvider.of<CustomBottomSheetBloc>(context)
                                  .add(OpenEvent(
                                      !BlocProvider.of<CustomBottomSheetBloc>(
                                              context)
                                          .state
                                          .isOpenBottomSheet));
                              BlocProvider.of<NotesBloc>(context).add(
                                  NoteAddEvent(NoteModel(
                                      state.title,
                                      state.subtitle,
                                      BlocProvider.of<NotesBloc>(context)
                                              .state
                                              .notes
                                              .length -
                                          1)));
                              BlocProvider.of<CustomBottomSheetBloc>(context)
                                  .add(ClearEvent());
                            },
                            child: const Icon(
                              Icons.check,
                            ),
                          ),
                        ],
                      )
                    : FloatingActionButton(
                        onPressed: () {
                          BlocProvider.of<CustomBottomSheetBloc>(context).add(
                              OpenEvent(!BlocProvider.of<CustomBottomSheetBloc>(
                                      context)
                                  .state
                                  .isOpenBottomSheet));
                        },
                        child: const Icon(
                          Icons.add,
                        ),
                      );
              },
            ));
      },
    );
  }
}
