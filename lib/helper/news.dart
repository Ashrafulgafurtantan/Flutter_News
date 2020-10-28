import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel>articleModels = [];
  ArticleModel articleModel;
  Future<void>getNews()async{
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=83628bd37d85438a8f96688ad1f7d087";
    var response=await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["description"] !=null && element["urlToImage"]!=null){
          articleModel = new ArticleModel();
          articleModel.title=element["title"] ;
          articleModel.imgUrl=element["urlToImage"];
          articleModel.description = element["description"];
          articleModel.url = element["url"];
          articleModel.timestamp =element["publishedAt"] ;
          articleModel.author =element["author"] ;
          articleModel.content = element["content"];
          articleModels.add(articleModel);
        }
      });


    }

  }
}

class CategoryNews{
  List<ArticleModel>articleModels = [];
  ArticleModel articleModel;
  Future<void>getNews(String category)async{
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=83628bd37d85438a8f96688ad1f7d087";
    var response=await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["description"] !=null && element["urlToImage"]!=null){
          articleModel = new ArticleModel();
          articleModel.title=element["title"] ;
          articleModel.imgUrl=element["urlToImage"];
          articleModel.description = element["description"];
          articleModel.url = element["url"];
          articleModel.timestamp =element["publishedAt"] ;
          articleModel.author =element["author"] ;
          articleModel.content = element["content"];
          articleModels.add(articleModel);
        }
      });


    }

  }
}