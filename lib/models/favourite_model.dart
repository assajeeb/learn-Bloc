import 'package:equatable/equatable.dart';

class FavouriteModel extends Equatable{
  final int? id;
  final String? data;
  final bool? status;
  const FavouriteModel({this.id =0, this.data= "", this.status = false});

  FavouriteModel copyWith({int? id, String? data,bool? status}){
    return FavouriteModel(id: id?? this.id,data: data?? this.data, status: status?? this.status );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id,data,status];

}