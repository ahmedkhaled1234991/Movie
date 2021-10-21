import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie/model/movie.dart';

//getdatatoprate provider to send data to ui screen
final getdatatoprate = ChangeNotifierProvider.autoDispose<Gettoprate>((ref)=>Gettoprate());

//Gettoprate class to get top rate movies from themoviedb api
class Gettoprate extends ChangeNotifier{

  List<Movie> listDataModel=[];

  Gettoprate(){
    getData();
  }

  void getData() async{
    listDataModel =[];
    try{
      String apiKey = "15f1909a402bd41cd364f22c4653ff05";
      var url = Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1");
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["results"];
      for(int i=0;i<responsebody.length;i++){
        listDataModel.add(Movie.fromMap(responsebody[i]));
      }
    }catch(e){
      print("Error===>$e");
    }
    notifyListeners();
  }
}