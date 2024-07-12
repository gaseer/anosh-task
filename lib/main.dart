import 'package:anosh/bloc/item_bloc.dart';
import 'package:anosh/repositories/item_repository.dart';
import 'package:anosh/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/item_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ItemBloc>(
        create: (context) => ItemBloc(ItemRepository())..add(LoadItems()),
        child: const HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
