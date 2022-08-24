import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String title;
  final String discription;
  const Note({required this.discription, required this.title});

  @override
  List<Object?> get props => [title, discription];
}
