import 'package:e_commerce/features/presentation/pages/productes/all_products.dart';
import 'package:e_commerce/features/presentation/widget/categories/categories_page.dart';
import 'package:e_commerce/features/presentation/widget/search.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  bool isProducts = false;

  String id = "";
  void onCategorySelected(String selectedId) {
    setState(() {
      id = selectedId;
      isProducts = true;
    });
    print("Selected ID: $id");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Search()),
        isProducts
            ? Expanded(
                flex: 8,
                child: Products(
                  id: id,
                ))
            : Expanded(
                flex: 8,
                child: CategoriesPage(
                  ontap: onCategorySelected,
                ),
              )
      ],
    );
  }
}
