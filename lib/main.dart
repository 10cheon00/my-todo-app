import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:my_app/models/Note.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text('TODO Notes'),
        ),
        backgroundColor: Colors.amber,
        body: FutureBuilder(
          future: getAllNote(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 데이터 로딩 중
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // 에러 발생
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // 데이터 없음
              return Center(child: Text('No notes found.'));
            } else {
              // 데이터 로드 완료
              final notes = snapshot.data!;
              return NoteList(notes: notes);
            }
          },
        ));
  }

  static const String text =
      "# h1 Heading 8-)\n## h2 Heading\n### h3 Heading\n#### h4 Heading\n##### h5 Heading\n###### h6 Heading\n---\n## Horizontal Rules";

  void createNote() {}

  Future<List<Note>> getAllNote() async {
    var response = await http.get(Uri.https(
        "yfi1ooqmm9.execute-api.ap-northeast-2.amazonaws.com", "todos"));
    List<dynamic> data = jsonDecode(response.body);
    List<Note> notes = [];
    for (var element in data) {
      int epoch = element["date"];
      String content = "${element["content"]}";

      notes.add(Note(DateTime.fromMillisecondsSinceEpoch(epoch),
          convertLineBreak(content)));
    }
    return notes;
  }

  String convertLineBreak(String content) {
    return content.replaceAll(r"\n", " \n");
  }
}
