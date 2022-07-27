import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotesSettingWidget extends StatelessWidget {
  const NotesSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> notesSettingWidgets = [
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/notes/setting/change_theme");
        },
        title: Text("Выбор темы"),
        leading: Icon(Icons.theater_comedy),
        trailing: Icon(Icons.arrow_right),
      ),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, "/notes/setting/change_font");
        },
        title: Text("Выбор шрифта"),
        leading: Icon(Icons.font_download_sharp),
        trailing: Icon(Icons.arrow_right),
      ),
    ];

    return Scaffold(
        appBar: AppBar(title: Text("Настройки блокнота")),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return notesSettingWidgets[index];
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.black,
                height: 2,
              );
            },
            itemCount: notesSettingWidgets.length));
  }
}
