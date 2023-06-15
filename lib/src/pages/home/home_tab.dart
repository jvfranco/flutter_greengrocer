import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/home/components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final List<String> categories = [
    'Frutas',
    'Grãos',
    'Verduras',
    'Temperos',
    'Cereais',
  ];

  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //AppBar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 30),
              children: [
                TextSpan(
                  text: 'Green',
                  style: TextStyle(color: CustomColors.customSwatchColor),
                ),
                TextSpan(
                  text: 'grocer',
                  style: TextStyle(color: CustomColors.customContrastColor),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
              child: GestureDetector(
                onTap: () {},
                child: Badge(
                  backgroundColor: CustomColors.customContrastColor,
                  label: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
              ),
            ),
          ],
        ),

        body: Column(children: [
          //Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),

          //Categorias
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => CategoryTile(
                  onPressed: () {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                  category: categories[index],
                  isSelected: categories[index] == selectedCategory),
              separatorBuilder: (ctx, index) => const SizedBox(width: 10),
              itemCount: categories.length,
            ),
          ),
          // Grid
        ]),
      ),
    );
  }
}
