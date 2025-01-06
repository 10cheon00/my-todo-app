import 'package:flutter/material.dart';
import 'package:my_app/widgets/daily_note.dart';

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
  final List<String> notes = [
    '2025-01-02:\nComplete Flutterrr project\n- UI Design\n- Backend Integration\n- Testing and Deployment',
    '2025-01-02:\nComplete Flutterrr project\n- UI Design\n- Backend Integration\n- Testing and Deployment',
    '2025-01-03:\nRead a book\n- Chapter 1: Introduction\n- Chapter 2: Basics\n- Chapter 3: Advanced Topics',
    ':smiley: 2025-01-04:\nPlan the weekend\n- Saturday: Hiking\n- Sunday: Relaxing and family time',
    '- [x] asdfa\n- [ ] asdfaf\n# asdf \n ## asdf\n ### asdf **aasdf** *asdfads* - asdfasdf \n-asdfasdf\n [asdfasdf](http://www.google.com))',
    '|asdf|asdf|\n|---|---|\n|asdf|asdfasdfasdf|'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return DailyNote(
              date: "2022-11-13",
              note: notes[index],
              onDelete: () => {});
        },
      ),
    );
  }
}
