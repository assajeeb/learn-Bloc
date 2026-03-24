import 'package:equatable/equatable.dart';
import 'package:learnblocnew/models/favourite_model.dart';

abstract class FavourtiveEvent extends Equatable{

  const FavourtiveEvent();
  @override
  List<Object?> get props => [];
}


class FetchFavouriteList extends FavourtiveEvent{
  @override
  List<Object?> get props => [];
}
class AddFavouriteItem extends FavourtiveEvent{
  final FavouriteModel? favouriteModel;
  const AddFavouriteItem({this.favouriteModel});

  @override
  List<Object?> get props => [favouriteModel];
}
class RemoveFavouriteItem extends FavourtiveEvent{
  final FavouriteModel? favouriteModel;
  const RemoveFavouriteItem({this.favouriteModel});

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteModel];
}
class SelectFavouriteItem extends FavourtiveEvent{
  final FavouriteModel? favouriteModel;
  const SelectFavouriteItem({this.favouriteModel});

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteModel];
}
class DeleteSelectedItems extends FavourtiveEvent{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

