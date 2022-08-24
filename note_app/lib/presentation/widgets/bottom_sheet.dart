import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/application/note/note_cubit.dart';
import 'package:note_app/core/colors.dart';

class NoteBottomSheet extends StatelessWidget {
  NoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController discriptionController = TextEditingController();
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWidget(
              titleController: titleController,
              hint: "Title...",
              lines: 1,
              height: 45,
            ),
            SizedBox(height: 30),
            TextFieldWidget(
              titleController: discriptionController,
              hint: "Discription...",
              lines: 3,
              height: 80,
            ),
            SizedBox(height: 30),
            NewNoteButton(
                titleController: titleController,
                discriptionController: discriptionController)
          ],
        ),
      ),
    );
  }
}

class NewNoteButton extends StatelessWidget {
  const NewNoteButton({
    Key? key,
    required this.titleController,
    required this.discriptionController,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController discriptionController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 5, horizontal: 15)),
            backgroundColor: MaterialStateProperty.all(primaryColor),
            foregroundColor: MaterialStateProperty.all(pureWhite),
          ),
          onPressed: () {
            if (titleController.text.trim().isEmpty ||
                discriptionController.text.trim().isEmpty) {
              Fluttertoast.showToast(msg: "Fields Can't be empty");
            } else {
              context.read<NoteCubit>().addNewNote(
                  title: titleController.text.trim(),
                  discription: discriptionController.text.trim());
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.add),
          label: Text("Add")),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hint,
    required this.height,
    required this.lines,
    required this.titleController,
  }) : super(key: key);

  final TextEditingController titleController;
  final int lines;
  final String hint;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        maxLines: lines,
        cursorColor: primaryColor,
        controller: titleController,
        style: TextStyle(
          letterSpacing: 0.5,
          fontSize: 16,
          color: commonBlack,
        ),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(fontSize: 16, color: commonBlack.withOpacity(0.5)),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: primaryColor.withOpacity(0.2)),
      ),
    );
  }
}
