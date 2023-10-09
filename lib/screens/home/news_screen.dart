import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/remote/api_manager.dart';
import 'package:news_app/screens/home/cubit/cubit.dart';
import 'package:news_app/screens/home/cubit/states.dart';
import 'package:news_app/screens/home/repository/dto/local.dart';
import 'package:news_app/screens/home/repository/dto/remote.dart';
import 'package:news_app/screens/tabs_screen.dart';

class NewsScreen extends StatelessWidget {
  CategoryModel categoryModel;
  bool connect = true;

  NewsScreen(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(connect ? RemoteRepo() : LocalRepo())
        ..getSources(categoryModel.id),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState ||
              state is HomeGetNewsLoadingState) {
            showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          } else if (state is HomeGetSourcesSuccessState) {
            HomeCubit.get(context).getNewsData();
          } else if (state is HomeChangeSourcesState) {
            HomeCubit.get(context).getNewsData();
          } else if (state is HomeGetSourcesErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.error),
              ),
            );
          } else if (state is HomeGetNewsSuccessState) {
            Navigator.pop(context);
          } else if (state is HomeGetNewsErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(state.error),
              ),
            );
          } else if (state is HomeLocalRepoNotFound) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text("Local Data Not Found"),
              ),
            );
          }
        },
        builder: (context, state) {
          if(state is HomeGetSourcesLoadingState){
            return const Center(child: CircularProgressIndicator());
          } else if(state is HomeLocalRepoNotFound){
            return const Center(child: Text("No Local Data Found"));
          } else{
            return TabsScreen(HomeCubit.get(context).sources);
          }
        },
      ),
    );
    // return FutureBuilder(
    //   future: ApiManager.getSources(categoryModel.id),
    //   builder: (context, snapshot) {
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if(snapshot.hasError){
    //       return Column(
    //         children: [
    //           Text("Something went wrong"),
    //           TextButton(onPressed: () {
    //
    //           }, child: Text("try again"))
    //         ],
    //       );
    //     }
    //     if(snapshot.data?.status != "ok"){
    //       return Column(
    //         children: [
    //           Text(snapshot.data?.message ?? ""),
    //           TextButton(onPressed: () {
    //
    //           }, child: Text("try again"))
    //         ],
    //       );
    //     }
    //     var sources = snapshot.data?.sources ?? [];
    //     return TabsScreen(sources);
    //   },
    // );
  }
}
