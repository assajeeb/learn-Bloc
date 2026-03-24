import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocnew/image_picker_bloc/image_picker_bloc.dart';
import 'package:learnblocnew/image_picker_bloc/image_picker_event.dart';
import 'package:learnblocnew/image_picker_bloc/image_picker_state.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick Images"),),
      body: Center(
        child: BlocBuilder<ImagePickerBloc,ImagePickerState>(builder: (context, state) {
          if(state.file != null){
            return Image.file(File(state.file!.path.toString()));
          }
          return IconButton(onPressed: (){
            context.read<ImagePickerBloc>().add(CameraPickerEvent());
          }, icon: Icon(Icons.camera));
        },),
      ),
    );
  }
}
