

import 'package:news_app/models/category_model.dart';
List<CategoryModel> getCategoryModel(){

  List<CategoryModel>categoryModels = new List<CategoryModel>();
  CategoryModel cm=new CategoryModel();
  cm.category_name="Business";
  cm.category_url="https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  categoryModels.add(cm);

  cm = new CategoryModel();
  cm.category_name = "Entertainment";
  cm.category_url = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModels.add(cm);

  //3
  cm = new CategoryModel();
  cm.category_name = "General";
  cm.category_url = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  categoryModels.add(cm);

  //4
  cm = new CategoryModel();
  cm.category_name = "Health";
  cm.category_url = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  categoryModels.add(cm);

  //5
  cm = new CategoryModel();
  cm.category_name = "Science";
  cm.category_url = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  categoryModels.add(cm);

  //6
  cm = new CategoryModel();
  cm.category_name = "Sports";
  cm.category_url = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categoryModels.add(cm);

  //7
  cm = new CategoryModel();
  cm.category_name = "Technology";
  cm.category_url = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  categoryModels.add(cm);

  return categoryModels;
}