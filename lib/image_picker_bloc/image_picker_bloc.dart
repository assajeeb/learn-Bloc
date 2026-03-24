
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnblocnew/image_picker_bloc/image_picker_event.dart';
import 'package:learnblocnew/image_picker_bloc/image_picker_state.dart';
import 'package:learnblocnew/utils/ImagePickerUtils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerState>{
  final Imagepickerutils  imagepickerutils;
  ImagePickerBloc(this.imagepickerutils):super(const ImagePickerState()){
    on<CameraPickerEvent>(_cameraPick);
    on<GalleryPickerEvent>(_gallryPicker);
  }

  void _cameraPick (ImagePickerEvent event, Emitter<ImagePickerState> emit)async{
    final XFile? file = await imagepickerutils.cameraCapture();
    emit(state.copyWith(file: file));

  }
  void _gallryPicker (ImagePickerEvent event, Emitter<ImagePickerState> states){

  }
}