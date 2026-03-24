import 'package:bloc/bloc.dart';
import 'package:learnblocnew/bloc/favourtive_bloc/favourtive_event.dart';
import 'package:learnblocnew/bloc/favourtive_bloc/favourtive_state.dart';
import 'package:learnblocnew/models/favourite_model.dart';

import '../../repository/favourite_repository.dart';

class FavourtiveBloc extends Bloc<FavourtiveEvent,FavouriteeState>{
  final FavouriteRepository favouriteRepository;
  List<FavouriteModel> favouiteItemList = [];
  List<FavouriteModel> tempItemList = [];
  FavourtiveBloc(this.favouriteRepository):super(const FavouriteeState()){
    on<AddFavouriteItem>(_addFavouriteItem);
    on<FetchFavouriteList>(_fetchItemList);
    on<RemoveFavouriteItem>(_removeFavouriteItem);
    on<SelectFavouriteItem>(_selectFavouriteItem);
    on<DeleteSelectedItems>(_deleteSelectedItems);
  }
  void _fetchItemList(FavourtiveEvent event, Emitter<FavouriteeState> emit)async{
    favouiteItemList = await favouriteRepository.fetchList();
    emit(state.copyWith(listStatus: ListStatus.Finised,favouriteModelList: List.from(favouiteItemList)));

  }
  void _addFavouriteItem(AddFavouriteItem event, Emitter<FavouriteeState> emit) {
    int index = favouiteItemList.indexWhere(
          (element) => element.id == event.favouriteModel?.id,
    );

    if (index == -1) return;


    if(tempItemList.contains(event.favouriteModel!)){
      favouiteItemList[index] = event.favouriteModel!.copyWith(
        status: !favouiteItemList[index].status!,
      );
      tempItemList[tempItemList.indexWhere((element) => element.id == event.favouriteModel?.id,)] = favouiteItemList[index];
    }else{
      favouiteItemList[index] = event.favouriteModel!.copyWith(
        status: !favouiteItemList[index].status!,
      );
    }
    emit(state.copyWith(favouriteModelList: List.from(favouiteItemList)));
  }
  void _removeFavouriteItem(RemoveFavouriteItem event, Emitter<FavouriteeState> emit){
    tempItemList.remove(event.favouriteModel!);
    emit(state.copyWith(tempList: List.from(tempItemList)));
  }
  void _selectFavouriteItem(SelectFavouriteItem event, Emitter<FavouriteeState> emit){
    tempItemList.add(event.favouriteModel!);

    emit(state.copyWith(tempList: List.from(tempItemList)));
  }
  void _deleteSelectedItems(FavourtiveEvent event, Emitter<FavouriteeState> emit){
    for (FavouriteModel i in tempItemList){
      favouiteItemList.removeWhere((element) => element.id == i.id,);
    }
    tempItemList.clear();

    emit(state.copyWith(tempList: List.from(tempItemList),favouriteModelList: List.from(favouiteItemList)));
  }
}