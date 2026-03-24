import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable{
  const ImagePickerEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CameraPickerEvent extends ImagePickerEvent{}
class GalleryPickerEvent extends ImagePickerEvent{}