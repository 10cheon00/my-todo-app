import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:my_app/models/Note.dart';
import 'package:my_app/widgets/DateWidget.dart';

class DailyNote extends StatefulWidget {
  final Note note; // 노트 내용 (가운데 영역)
  final VoidCallback onDelete; // 삭제 콜백

  DailyNote({
    super.key,
    required this.note,
    required this.onDelete,
  });

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //     padding: EdgeInsets.all(15),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(8),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.shade300,
  //           blurRadius: 4,
  //           offset: Offset(2, 2),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         // 왼쪽: 연월일 영역
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Date(date: date),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 IconButton(
  //                   onPressed: edit,
  //                   icon: Icon(Icons.edit, color: Colors.green),
  //                   tooltip: 'Edit',
  //                 ),
  //                 IconButton(
  //                   onPressed: onDelete,
  //                   icon: Icon(Icons.delete, color: Colors.red),
  //                   tooltip: 'Delete',
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         SizedBox(width: 10), // 열 간격
  //         // 가운데: 노트 내용 영역
  //         // MarkdownBody(
  //         //   data: note,
  //         // )
  //         TextField(),
  //         // (state == NoteState.edit) ? TextFormField() : MarkdownBlock(data: note)
  //         // SizedBox(width: 10), // 열 간격
  //         // 오른쪽: 수정, 삭제 버튼
  //       ],
  //     ),
  //   );
  // }

  @override
  NoteState createState() {
    return NoteState();
  }
}

class NoteState extends State<DailyNote> {
  bool isEditing = false;
  late Note noteData;

  @override
  void initState() {
    super.initState();
    noteData = widget.note;
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DateWidget(date: widget.note.date),
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
                          onPressed: widget.onDelete,
                          icon: Icon(Icons.delete, color: Colors.red),
                          tooltip: 'Delete',
                        ),
                      ],
              ),
            ],
          ),
          SizedBox(width: 10), // 열 간격

          isEditing
              ? Expanded(
                  child: TextFormField(
                  initialValue: noteData.content,
                  maxLines: null,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Edit Note',
                  ),
                  onChanged: (value) {
                    setState(() {
                      noteData.content = value; // 수정된 내용을 저장
                    });
                  },
                ))
              : MarkdownBlock(data: noteData.content)
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
