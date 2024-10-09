import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pixelscape/model/categories_model.dart';


String apiKey = dotenv.env['API_KEY']!;

List<CategoriesModel> getCategories(){

  List<CategoriesModel> categories = <CategoriesModel>[];
  CategoriesModel categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/2127740/pexels-photo-2127740.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categoriesModel.categoriesName = "Cars";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

    //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categoriesModel.categoriesName = "Nature";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

    //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/33045/lion-wild-africa-african.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categoriesModel.categoriesName = "Wild Life";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

    //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/276267/pexels-photo-276267.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categoriesModel.categoriesName = "Material";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();


  //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/235986/pexels-photo-235986.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  categoriesModel.categoriesName = "Background";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgUrl = "https://images.pexels.com/photos/1097456/pexels-photo-1097456.jpeg";
  categoriesModel.categoriesName = "Cool BG";
  categories.add(categoriesModel);
  categoriesModel = new CategoriesModel();



  return categories;
}