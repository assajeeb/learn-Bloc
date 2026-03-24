import 'package:equatable/equatable.dart';
import 'package:learnblocnew/models/favourite_model.dart';

enum ListStatus{Loading,Finised,Faild}

class FavouriteeState extends Equatable{

  final List<FavouriteModel>? favouriteModelList;
  final List<FavouriteModel>? tempList;
  final ListStatus? listStatus;
  const FavouriteeState({this.favouriteModelList=const[],this.listStatus = ListStatus.Loading, this.tempList= const[]});

  FavouriteeState copyWith({List<FavouriteModel>? favouriteModelList, ListStatus? listStatus,List<FavouriteModel>?  tempList }){
    return FavouriteeState(
        favouriteModelList: favouriteModelList ?? this.favouriteModelList,
      listStatus: listStatus?? this.listStatus,
      tempList: tempList ?? this.tempList
    );
}
  @override
  // TODO: implement props
  List<Object?> get props => [favouriteModelList,listStatus,tempList];
}