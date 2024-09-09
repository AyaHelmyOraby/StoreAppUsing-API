
import 'package:storeapp/Helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class GetAllCategoriesService {
  Future<List<ProductModel>> getAllCategories(
      {required String
          categoryName}) async //needed for path varaiable :catogery

  ///method
  {
     List<dynamic> data = await Api().get(url:'https://fakestoreapi.com/products/category/category_name/$categoryName');

    List<ProductModel> productsList = [];


    for (int i = 0; i < data.length; i++) {
      // ProductsList.add(ProductModel.fromJson(data[i]));

      productsList.add(ProductModel.fromJson(data[i]));
    }

    return productsList;
  }
}
