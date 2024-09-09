import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storeapp/Screens/home_page.dart';
import 'package:storeapp/Screens/update_product_page.dart';
// import 'package:http/http.dart' as http;

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (context) =>UpdateProductPage()
      },
      initialRoute: HomePage.id,
    );
  }
}
