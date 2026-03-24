import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocnew/UI/Counter_screen.dart';
import 'package:learnblocnew/UI/Switch_screen.dart';
import 'package:learnblocnew/UI/image_picker.dart';
import 'package:learnblocnew/bloc/counter_bloc.dart';
import 'package:learnblocnew/image_picker_bloc/image_picker_bloc.dart';
import 'package:learnblocnew/switch_bloc/switch_bloc.dart';
import 'package:learnblocnew/utils/ImagePickerUtils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(create: (context)=> ImagePickerBloc(Imagepickerutils()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: ImagePickerScreen(),
      ),
    );
  }
}

