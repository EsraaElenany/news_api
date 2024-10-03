import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_api/dio_helper.dart';
import 'package:news_api/model/news_model.dart';

import '../../constant.dart';

part 'news_state.dart';
// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b0748495ba5947249ddd19f9d82fffc6

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context)=> BlocProvider.of(context);

  List<Articles>businessList =[];
  List<Articles>sportList =[];
  List<Articles>technologyList =[];
  NewsModel newsModel = NewsModel();
  //1- LOADING
  //2- success
  //3- error
  getBusiness()async{
    emit(GetBusinessLoadingState());
   await DioHelper.getData(path: endPointTop,query:{
      'country':'us',
      'category':'business',
      'apiKey':'b0748495ba5947249ddd19f9d82fffc6'
        }
    ).then((value){
     newsModel = NewsModel.fromJson(value.data);
     businessList = newsModel.articles!;
     print(businessList);
     emit(GetBusinessSuccessState());
   });
  }



  getSport()async{
   await DioHelper.getData(path: endPointTop,query:{
      'country':'us',
      'category':'sport',
      'apiKey':'b0748495ba5947249ddd19f9d82fffc6'
        }
    ).then((value){
     newsModel = NewsModel.fromJson(value.data);
     sportList = newsModel.articles!;
     print(sportList);
   });
  }
  getTechnology()async{
   await DioHelper.getData(path: endPointTop,query:{
      'country':'us',
      'category':'technology',
      'apiKey':'b0748495ba5947249ddd19f9d82fffc6'
        }
    ).then((value){
     newsModel = NewsModel.fromJson(value.data);
     technologyList = newsModel.articles!;
     print(technologyList);
   });
  }


  int currentIndex= 0;
  changeBottomNavBar(int index){
    currentIndex= index;
    emit(ChangeNavBarState());
  }
}
