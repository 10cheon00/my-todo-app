import 'package:flutter/material.dart';
import 'package:my_app/models/Note.dart';
import 'package:my_app/widgets/DailyNoteWidget.dart';

class NoteList extends StatefulWidget {
  final List<Note> notes;

  const NoteList({super.key, required this.notes});

  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  late List<Note> notes;

  @override
  void initState() {
    super.initState();
    notes = widget.notes;
    notes.sort((a, b) => b.date.compareTo(a.date));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return DailyNoteWidget(
            key: ValueKey(notes[index].date),
            note: notes[index],
            onUpdate: (content) => updateNoteContent(index, content),
            onDelete: () => deleteNote(index));
      },
    );
  }

  void deleteNote(index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void updateNoteContent(index, content) {
    setState(() {
      notes[index].content = content;
    });
  }
}
