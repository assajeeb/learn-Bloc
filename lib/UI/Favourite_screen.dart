import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocnew/bloc/favourtive_bloc/favourtive_bloc.dart';
import 'package:learnblocnew/bloc/favourtive_bloc/favourtive_event.dart';
import 'package:learnblocnew/bloc/favourtive_bloc/favourtive_state.dart';
import 'package:learnblocnew/models/favourite_model.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState() {
    super.initState();
    context.read<FavourtiveBloc>().add(FetchFavouriteList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Screen"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            context.read<FavourtiveBloc>().add(DeleteSelectedItems());
          }, icon: Icon(Icons.delete))
        ],
      ),
      body: BlocBuilder<FavourtiveBloc,FavouriteeState>(builder: (context, state) {
        if(state.listStatus == ListStatus.Loading){
          return Center(child: CircularProgressIndicator(color: Colors.red,));
        }else if(state.listStatus == ListStatus.Finised){
          return ListView.builder(itemCount: state.favouriteModelList?.length,itemBuilder: (context, index) {
            FavouriteModel item = state.favouriteModelList![index];
            return ListTile(
              leading: Checkbox(value: state.tempList?.contains(item), onChanged: (value) {
                if(state.tempList?.contains(item) == true){
                  context.read<FavourtiveBloc>().add(RemoveFavouriteItem(favouriteModel: item));
                }else{
                  context.read<FavourtiveBloc>().add(SelectFavouriteItem(favouriteModel: item));
                }
              },),
              title: Text("${item.data}"),
              trailing: IconButton(onPressed: (){
                context.read<FavourtiveBloc>().add(AddFavouriteItem(favouriteModel: item));
              }, icon: Icon(item.status == false?Icons.favorite_border:Icons.favorite)),
            );
          },);
        }else{
          return Center(child: Text("Problem With Fetching"));
        }
      },),
    );
  }
}
