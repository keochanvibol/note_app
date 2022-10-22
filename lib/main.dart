import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/utils/theme_constants.dart';
import 'bloc/notes/notes_bloc.dart';
import 'bloc/notes/notes_event.dart';
import 'bloc/search/search_bloc.dart';
import 'bloc/search/search_event.dart';
import 'screens/home_screen.dart';

void main(List<String> args) {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NotesBloc>(
          create: (context) => NotesBloc()..add(GetAllNotesEvent()),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc()..add(SearchGetAllNotesEvent()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: notesTheme,
      title: 'Notes Keeper',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
