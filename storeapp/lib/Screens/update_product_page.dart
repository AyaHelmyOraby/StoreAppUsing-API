import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/update_product.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  _UpdateProductPageState createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String productName = '';
  String description = '';
  String price = ''; // Keep price as String
  String imageUrl = '';
  String category = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments
        as ProductModel; // for category
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Product Name',
                onChanged: (data) {
                  setState(() {
                    productName = data;
                  });
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Description',
                onChanged: (data) {
                  setState(() {
                    description = data;
                  });
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Price',
                onChanged: (data) {
                  setState(() {
                    price = data; // Store as String
                  });
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'Image URL',
                onChanged: (data) {
                  setState(() {
                    imageUrl = data;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  isLoading = true;
                  setState(() {});

                  try {
                    await UpdateProduct(product);

                    print("Success");
                  } catch (e) {
                    print(e.toString());
                    isLoading = false;
                    setState(() {});
                  }

                  print('Product Name: $productName');
                  print('Description: $description');
                  print('Price: ${price}');
                  print('Image URL: $imageUrl');
                  print('Category: $category');
                  isLoading = false;
                  setState(() {});
                },
                child: Text('Update Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName.isEmpty ? product.title : productName,
      price: price.isEmpty ? product.price : price,
      description: description.isEmpty ? product.description : description,
      image: imageUrl.isEmpty ? product.image : imageUrl,
      category: category.isEmpty ? product.category : category,
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  final String hintText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
