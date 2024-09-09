import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/get_all_product_services.dart';
import './custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartPlus, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "New Trend",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllProductServices().getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;

            return GridView.builder(
              itemCount: products.length,
              padding: const EdgeInsets.all(16), // Padding around the grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 16, // Horizontal space between items
                mainAxisSpacing: 16, // Vertical space between items
                childAspectRatio:
                    0.75, // Aspect ratio of items (width / height)
              ),
              // itemCount: 8, // Number of items
              itemBuilder: (context, index) {
                return CustomCard(product :products[index]);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
