import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_app/widgets/CreateNoteButtonWidget.dart';

class CreateNoteWidget extends StatefulWidget {
  final VoidCallback createNote;
  final bool isCreating = false;

  const CreateNoteWidget({super.key, required this.createNote});

  @override
  CreateNoteState createState() {
    return CreateNoteState();
  }
}

class CreateNoteState extends State<CreateNoteWidget> {
  late bool isCreating;
  late VoidCallback createNote;
  final String content = '';

  @override
  void initState() {
    super.initState();
    isCreating = false;
    createNote = widget.createNote;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 100,
        width: double.infinity,
        child: isCreating
            ? CreateNoteTextField()
            : CreateNoteButton(
                openCreateNoteTextField: openCreateNoteTextField));
  }

  void openCreateNoteTextField() {
    setState(() {
      isCreating = true;
    });
  }
}

class CreateNoteTextField extends StatelessWidget {
  const CreateNoteTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: TextFormField(
          maxLines: null, // 줄 수를 제한하지 않음
          keyboardType: TextInputType.multiline, // 멀티라인 입력 지원
          autofocus: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Edit Note',
          ),
          onChanged: (value) {
            // 수정 중인 값 처리
          },
        ),
      ),
    );
  }
}
