import 'package:ecshop_techpit/pages/home_page/home_header.dart';
import 'package:ecshop_techpit/pages/home_page/item_categories.dart';
import 'package:ecshop_techpit/pages/home_page/item_grid.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Techpit Sports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [
          HomeHeader(),
          ItemCategories(),
          ItemGrid(),
        ],
      ),
    );
  }
}
