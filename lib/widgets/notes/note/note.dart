import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.back_hand)],
      ),
      body: ListTile(
        title: TextField(
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(hintText: ("Название")),
        ),
        subtitle: TextField(
          decoration: InputDecoration(hintText: ("Текст")),
          maxLines: 99999999999,
        ),
      ),
    );
  }
}
