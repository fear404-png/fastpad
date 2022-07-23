import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.check),
        )
      ]),
      body: ListTile(
        title: TextField(
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: ("Название"),
          ),
        ),
        subtitle: TextField(
          decoration:
              InputDecoration(hintText: ("Текст"), border: InputBorder.none),
          maxLines: null,
        ),
      ),
    );
  }
}
