


 import 'package:bloct_training/constants/strings.dart';
import 'package:bloct_training/data/models/model.dart';
import 'package:dio/dio.dart';

class WebService{

             
             late Dio dio;

WebService(){
  BaseOptions options =BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true ,
connectTimeout: const Duration(seconds: 20),
receiveTimeout:const Duration(seconds: 20) ,
  );
  dio=Dio(options);
} 


Future<List<Map<String, dynamic>>?>  getALl() async {


try{

  Response response = await dio.get('character');

  print("helllllo"+response.data.toString());
  return response.data;
}catch(e){
  print("noooooooo"+e.toString());
  return [];
}

} 
     
      



 }