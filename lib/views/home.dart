import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/catagories.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel>categoryModels =new List<CategoryModel>();
  List<ArticleModel> articleModels = new List<ArticleModel>();
  bool isLoading = true;
  getNews ()async{
    News newsClass = News();
    await newsClass.getNews();
    articleModels = newsClass.articleModels;
    setState(() {
      isLoading = false;
    });
  }

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
class CategoryTile extends StatelessWidget {
  final String Url,name;
  CategoryTile(this.Url,this.name);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Catagory(category: name.toLowerCase(),)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(

          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage( width: 120,height: 60,fit: BoxFit.cover, imageUrl: Url)),
            Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(6),
                ),
                height: 60,width: 120,child: Center(child: Text(name,style: TextStyle(color: Colors.white,
                fontWeight:FontWeight.bold,fontSize: 15)))),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgUrl,title,description,newsUrl;
  BlogTile({this.imgUrl,this.title,this.description,this.newsUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Article(url: newsUrl,);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(borderRadius: BorderRadius.circular(6),child: Image.network(imgUrl)),
            SizedBox(height: 5,),
            Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 18),),
            Text(description,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300,fontSize: 12),),
          ],
        ),
      ),
    );
  }
}
