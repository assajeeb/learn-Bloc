import 'package:learnblocnew/models/favourite_model.dart';

class FavouriteRepository {
Future<List<FavouriteModel>> fetchList()async{
  await Future.delayed(Duration(seconds: 3));
  return genarateList(10);
}

List<FavouriteModel> genarateList(int length){
  return List.generate(length, (index) => FavouriteModel(id: index,data: "item $length"),);
}
}