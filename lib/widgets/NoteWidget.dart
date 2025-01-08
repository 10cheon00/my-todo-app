import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:my_app/models/Note.dart';
import 'package:my_app/widgets/DateWidget.dart';

class NoteWidget extends StatefulWidget {
  final int id;
  final Note note; // 노트 내용 (가운데 영역)
  final Function onDelete; // 삭제 콜백
  final Function onUpdate; // 수정 콜백

  const NoteWidget(
      {super.key,
      required this.id,
      required this.note,
      required this.onUpdate,
      required this.onDelete});

  @override
  NoteState createState() {
    return NoteState();
  }
}

class NoteState extends State<NoteWidget> {
  late Note note;
  bool isEditing = false;
  late String content;
  
  @override
  void initState() {
    super.initState();
    note = widget.note;
    content = widget.note.content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: transparentColor(Colors.white, widget.id),
        borderRadius: BorderRadius.circular(8),
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
                            onPressed: saveNote,
                            icon: Icon(Icons.check, color: Colors.green),
                            tooltip: 'Done',
                          ),
                        ]
                      : [
                          IconButton(
                            onPressed: openTextFormField,
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
                      fillColor: Colors.white),
                  onChanged: (value) {
                    content = value;
                    debugPrint(value);
                  },
                ))
              : MarkdownBlock(data: note.content)
        ],
      ),
    );
  }

  void saveNote() {
    closeTextFormField();
    widget.onUpdate(note, content);
    debugPrint(content);
  }

  void openTextFormField() {
    setState(() {
      isEditing = true;
    });
  }
  
  void closeTextFormField() {
    setState(() {
      isEditing = false;
    });
  }

  Color transparentColor(Color color, int id) {
    id = id == 0 ? 1 : id;
    double alphaValue = 255 * (0.5 / id + 0.5);
    return color.withAlpha(alphaValue.toInt());
  }
  
}
