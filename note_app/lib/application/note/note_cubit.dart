import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:note_app/domain/models/note.dart';

part 'note_state.dart';

List<Note> allNotes = [];

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteState([]));

  void getAllNotes() {
    emit(NoteState(state.notes));
  }

  void addNewNote({required String title, required String discription}) {
    final note = Note(discription: discription, title: title);

    emit(NoteState(List.from(state.notes)..add(note)));
  }
}
