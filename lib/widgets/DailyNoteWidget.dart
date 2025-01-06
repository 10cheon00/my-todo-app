import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:my_app/models/Note.dart';
import 'package:my_app/widgets/DateWidget.dart';

class DailyNoteWidget extends StatefulWidget {
  final Note note; // 노트 내용 (가운데 영역)
  final Function onDelete; // 삭제 콜백
  final Function onUpdate; // 수정 콜백

  const DailyNoteWidget(
      {super.key,
      required this.note,
      required this.onUpdate,
      required this.onDelete});

  @override
  NoteState createState() {
    return NoteState();
  }
}

class NoteState extends State<DailyNoteWidget> {
  late Note note;
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    note = widget.note;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 왼쪽: 연월일 영역
          Container(
            constraints: BoxConstraints(minWidth: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateWidget(date: note.date),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: isEditing
                      ? [
                          IconButton(
                            onPressed: edit,
                            icon: Icon(Icons.check, color: Colors.green),
                            tooltip: 'Done',
                          ),
                        ]
                      : [
                          IconButton(
                            onPressed: edit,
                            icon: Icon(Icons.edit, color: Colors.green),
                            tooltip: 'Edit',
                          ),
                          IconButton(
                            onPressed: () => widget.onDelete(),
                            icon: Icon(Icons.delete, color: Colors.red),
                            tooltip: 'Delete',
                          ),
                        ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10), // 열 간격

          isEditing
              ? Expanded(
                  child: TextFormField(
                  initialValue: note.content,
                  maxLines: null,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Edit Note',
                  ),
                  onChanged: (value) {
                    widget.onUpdate(value);
                  },
                ))
              : MarkdownBlock(data: note.content)
        ],
      ),
    );
  }

  void edit() {
    setState(() {
      isEditing = !isEditing;
    });
  }
}
