import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/application/note/note_cubit.dart';
import 'package:note_app/core/colors.dart';
import 'package:note_app/presentation/widgets/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<NoteCubit>().getAllNotes();
    });
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Note App",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: HomeScreenBody(),
        floatingActionButton: FloatingActionButton(
          foregroundColor: pureWhite,
          backgroundColor: primaryColor,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => NoteBottomSheet());
          },
          child: Icon(
            Icons.add,
          ),
        ));
  }
}

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.notes[index].title),
                  subtitle: Text(state.notes[index].discription),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: state.notes.length);
        },
      ),
    );
  }
}
