import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/screens/home/cubit/states.dart';
import 'package:news_app/screens/home/repository/dto/remote.dart';
import 'package:news_app/screens/home/repository/repo.dart';

import '../../../models/NewsResponse.dart';
import '../../../style/constants.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.baseRepository) : super(HomeInitState());

  static HomeCubit get(context)=>BlocProvider.of(context);

  List<Sources> sources = [];
  List<Articles> articles = [];
  int selectedIndex = 0;
  BaseRepository baseRepository;

  void changeSource(int index){
    selectedIndex=index;
    emit(HomeChangeSourcesState());
  }

  Future<void> getSources(String category) async {
    emit(HomeGetSourcesLoadingState());
    baseRepository.getSources(category)?.then((value) {
      var jsonResponse = jsonDecode(value.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonResponse);
      if(sourcesResponse.status != "ok"){
        emit(HomeConnectionErrorState());
        return;
      }
      sources=sourcesResponse.sources??[];
      emit(HomeGetSourcesSuccessState());
      //return;
    }).catchError((error){
      print(error);
      emit(HomeGetSourcesErrorState(error));
      //return;
    });
    emit(HomeLocalRepoNotFound());
  }

  Future<void> getNewsData() async{
    emit(HomeGetNewsLoadingState());
    baseRepository.getNewsData(sources[selectedIndex].id??"")?.then((value) {
      var jsonResponse = jsonDecode(value.body);
      NewsResponse newsResponse = NewsResponse.fromJson(jsonResponse);
      if(newsResponse.status != "ok"){
        emit(HomeConnectionErrorState());
        return;
      }
      articles=newsResponse.articles??[];
      emit(HomeGetNewsSuccessState());
    }).catchError((error){
      emit(HomeGetNewsErrorState(error));
    });
    
  }
}
