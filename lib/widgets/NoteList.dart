import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:my_app/models/Note.dart';
import 'package:my_app/widgets/NoteWidget.dart';

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
    notes.sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.all(10),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteWidget(
                  key: ValueKey(notes[index].date),
                  id: notes.length - index,
                  note: notes[index],
                  onUpdate: updateNoteContent,
                  onDelete: () => deleteNote(index));
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 10);
            },
          ))
        ]);
  }

  void deleteNote(index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void updateNoteContent(note, content) {
    http
        .post(
            Uri.https(
                "yfi1ooqmm9.execute-api.ap-northeast-2.amazonaws.com", "todos"),
            body: jsonEncode({
              "date": note.date.toUtc().millisecondsSinceEpoch,
              "content": content
            }))
        .then((response) {
      var body = jsonDecode(response.body);
      debugPrint(body["content"]);
      setState(() {
        note.content = body["content"];
      });
    });
  }

  void createNote() {
    setState(() {
      notes.insert(0, Note(DateTime.now(), ''));
      // todo: 새로운 노트를 생성, 그러나 DailyNoteWidget 속 isEditing 상태를 true로 만들어야함
    });
  }
}
