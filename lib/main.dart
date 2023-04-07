import 'package:flutter/material.dart';
import 'blocs/bloc_export.dart';
// import 'contact_repository.dart';
import 'screen/contact_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactsBloc>(
      create: (context) => ContactsBloc()..add(const LoadContacts()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ContactScreen(),
      ),
    );
  }
}
