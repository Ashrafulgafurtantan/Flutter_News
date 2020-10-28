import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/home.dart';
class Catagory extends StatefulWidget {
  final String category;
  Catagory({this.category});
  @override
  _CatagoryState createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {

  List<ArticleModel> articleModels = new List<ArticleModel>();
  List<CategoryModel>categoryModels =new List<CategoryModel>();
  bool isLoading = true;
  getNews ()async{
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(widget.category);
    articleModels = newsClass.articleModels;
    setState(() {
      isLoading = false;
    });
  }

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    getNews();
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryModels = getCategoryModel();
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter",style: TextStyle(color: Colors.black,fontSize:25 ),),
            Text("News",style: TextStyle(color: Colors.blueAccent,fontSize:25 ),),
          ],
        ),
      ),
      body:isLoading? Center(child: Container(
          child: CircularProgressIndicator()))
          :Container(

          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: <Widget>[

              // Categories...........
              Container(
                height: 80,

                child: ListView.builder(
                    itemCount: categoryModels.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index){
                      return CategoryTile(categoryModels[index].category_url,categoryModels[index].category_name);

                    } ),
              ),
//Atricles news..........
              Expanded(
                child: ListView.builder(

                    itemCount:articleModels.length ,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index){
                      return BlogTile(
                        title:articleModels[index].title ,
                        imgUrl: articleModels[index].imgUrl,
                        description: articleModels[index].description,
                        newsUrl: articleModels[index].url,

                      );
                    }),
              )
            ],

          )
      ) ,
    );
  }
}
