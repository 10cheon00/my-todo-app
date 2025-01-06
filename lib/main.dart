import 'package:flutter/material.dart';
import 'package:my_app/models/Note.dart';
import 'package:my_app/widgets/DailyNoteWidget.dart';
import 'package:my_app/widgets/NoteList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App with Multi-line Items',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Note> notes = [
      Note(DateTime(2019,12,31), "# h1\n ## h2\n ### h3\n"),
      Note(DateTime(2020,1,1), "# h1\n ## h2\n ### h3\n"),
      Note(DateTime(2020,1,2), "# h1\n ## h2\n ### h3\n"),
      Note(DateTime(2020,1,3), "# h1\n ## h2\n ### h3\n"),
      Note(DateTime(2020,1,4), "# h1\n ## h2\n ### h3\n"),
      Note(DateTime(2020,1,5), "# h1\n ## h2\n ### h3\n"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO Notes'),
      ),
      body: NoteList(notes: notes)
    );
  }
}