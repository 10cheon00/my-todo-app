import 'package:flutter/material.dart';
import 'package:my_app/models/Note.dart';
import 'package:my_app/widgets/DailyNote.dart';

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
  final List<Note> notes = [
    Note(DateTime(2019,12,31), "# h1\n # h2\n # h3\n"),
    Note(DateTime(2020,1,1), "# h1\n # h2\n # h3\n"),
    Note(DateTime(2020,1,2), "# h1\n # h2\n # h3\n"),
    Note(DateTime(2020,1,3), "# h1\n # h2\n # h3\n"),
    Note(DateTime(2020,1,4), "# h1\n # h2\n # h3\n"),
    Note(DateTime(2020,1,5), "# h1\n # h2\n # h3\n"),
  ];

  @override
  Widget build(BuildContext context) {
    notes.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return DailyNote(
              note: notes[index],
              onDelete: () => {});
        },

      ),
    );
  }
}
