import 'package:flutter/material.dart';
import 'package:my_app/config/color.dart';

class CreateNoteButton extends StatelessWidget {
  final VoidCallback openCreateNoteTextField;

  const CreateNoteButton({super.key, required this.openCreateNoteTextField});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: openCreateNoteTextField,
        icon: Icon(Icons.add),
        style: ElevatedButton.styleFrom(
            backgroundColor: TodoAppColor.grayScale,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        label: Text('노트 생성'));
  }
}
