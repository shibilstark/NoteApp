import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:note_app/application/note/note_cubit.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/presentation/widgets/custom_textfield.dart';

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
