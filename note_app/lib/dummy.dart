
// class MyApp extends StatelessWidget {
//   late NotesRepository notesRepository;
//   late NoteCubit noteCubit;
//   MyApp({super.key}) {
//     notesRepository = NotesRepository();
//     noteCubit = NoteCubit(notesRepository);
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
      
//       create: (context) => noteCubit,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: MyAppThemes.lightTheme,
//         home: HomeScreen(),
//       ),
//     );
//   }
// }
