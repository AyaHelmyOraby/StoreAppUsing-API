import 'package:storeapp/Helper/api.dart';
import 'package:storeapp/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required int id,
    required String title,
    required dynamic price,
    required String description,
    required String image,
    required String category,
  }) async {
    print('product id = $id');
    try {
      Map<String, dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products/$id', // Correct URL format
        body: {
          "title": title,
          "price": price.toString(), // Convert double to string
          "description": description,
          "image": image,
          "category": category,
        },
      );

      print('Response data: $data'); // Log the API response data
      // Validate that the response contains expected fields
      if (data.containsKey('id')) {
        return ProductModel.fromJson(data);
      } else {
        throw Exception('Invalid API response');
      }
    } catch (e) {
      print('Error occurred: $e');
      rethrow; // Rethrow the exception to handle it further up the call stack
    }
  }
}
