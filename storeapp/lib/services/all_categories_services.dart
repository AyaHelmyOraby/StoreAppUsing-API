import 'package:storeapp/Helper/api.dart';

class AllCategoriesServices {
  Future<List<dynamic>> getaAllCategories() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products/categories ");

    return data;
  }
}
