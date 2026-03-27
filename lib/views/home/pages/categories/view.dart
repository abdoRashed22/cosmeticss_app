import 'package:cosmetics/core/widgets/search_input.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
part 'widgets/category_item.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
 /*  final List<Map<String, dynamic>> categories = [
    {"name": "Bundles", "image": "assets/images/bundles.png"},
    {"name": "Perfumes", "image": "assets/images/perfumes.png"},
    {"name": "Makeup", "image": "assets/images/Makeup.png"},
    {"name": "Bundles Care", "image": "assets/images/Skin Care.png"},
    {"name": "Gifts", "image": "assets/images/gifts.png"},
  ]; */
  List<CategoryModel> categoriesList = [];
  Future<void> getData() async {
    final resp = await Dio().get(
      'https://cosmatics.growfet.com/api/Categories',
    );
    categoriesList = CategoriesData.fromJsonList(resp.data).list;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Center(
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff434C6D),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SearchInput(onSearchTap: () {}),
            SizedBox(height: 25.h),
            categoriesList == null
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.separated(
                      itemCount: 
                        
                           categoriesList.length,
                      separatorBuilder: (_, __) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Divider(
                          color: Colors.grey.withOpacity(.5),
                          thickness: 1,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        final model = 
                           
                             categoriesList[index];

                        return CategoryItem(
                          model: model,
                          name: model.title,
                          image: model.imageUrl, 
                          onTap: () => print("Tapped on ${model.title}"),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class CategoryModel {
  late final int id;
  late final String title;
  late String imageUrl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? json['name'] ?? '';
    imageUrl = json['imageUrl'] ?? "";
    final raw = json['imageUrl'] ?? json['image'] ?? '';
    imageUrl = raw.isEmpty ? 'assets/images/bundles.png' : raw;
  }
}

class CategoriesData {
  late List<CategoryModel> list;

  CategoriesData.fromJsonList(List<dynamic> json) {
    list = json.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
