import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movie/model/movie.dart';

//getdatapopular provider to send data to ui screen
final getdatapopular= ChangeNotifierProvider.autoDispose<Getpopular>((ref)=>Getpopular());

//Getpopular class to get popular movies from themoviedb api
class Getpopular extends ChangeNotifier{

  List<Movie> listDataModel=[];

  Getpopular(){
    getData();
  }

  void getData() async{
    listDataModel =[];
    try{
      String apiKey = "15f1909a402bd41cd364f22c4653ff05";
      var url = Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1");
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