part of 'note_cubit.dart';

class NoteState extends Equatable {
  final List<Note> notes;
  const NoteState(this.notes);

  @override
  List<Object> get props => [notes];
}

// class NoteInitial extends NoteState {}

// class NoteLoading extends NoteState {}

// class NoteLoaded extends NoteState {
//   final List<Note> notes;

//   const NoteLoaded({required this.notes});
//   @override
//   List<Note> get props => notes;
// }
