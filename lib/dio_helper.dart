import 'package:dio/dio.dart';

import 'constant.dart';

class DioHelper{

 // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b0748495ba5947249ddd19f9d82fffc6
 static late Dio dio;

 static init(){
   dio = Dio(
      BaseOptions(
       baseUrl: baseUrl,
        headers: {
         'Accept':'Application/json',
         'Content_Type':'Application/json'
        }
     )
   );
 }
// get 
static getData({required String path,
  Map<String,dynamic>? data,
  Map<String,dynamic>? query,
  String? token ,
}
)
async {
   try{
     dio.options.headers ={
       'Authorization': 'Bearer ${token ?? ''}'
     };
 Response response=   await dio.get(path,
       data:data ,
       queryParameters:query );
 print(response.statusCode); // 200// 400// 500
 return response;
   } on DioException catch (e) {
     // The request was made and the server responded with a status code
     // that falls out of the range of 2xx and is also not 304.
     if (e.response != null) {
       print(e.response!.data);
       print(e.response!.headers);
       print(e.response!.requestOptions);
     } else {
       // Something happened in setting up or sending the request that triggered an Error
       print(e.requestOptions);
       print(e.message);
     }
   }}

// post 
static postData({required String path , required Map<String, dynamic> data , Map<String, dynamic>? query })async{
   try{
  Response response=  await dio.post(path, data:  data , queryParameters: query);
   return response;
   }

   on DioException catch (e) {
     // The request was made and the server responded with a status code
     // that falls out of the range of 2xx and is also not 304.
     if (e.response != null) {
       print(e.response!.data);
       print(e.response!.headers);
       print(e.response!.requestOptions);
     } else {
       // Something happened in setting up or sending the request that triggered an Error
       print(e.requestOptions);
       print(e.message);
     }
   }}

}
//delete

// put


