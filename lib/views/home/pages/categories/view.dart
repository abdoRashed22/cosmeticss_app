import 'package:cosmetics/core/helper/app_image.dart';
import 'package:cosmetics/core/helper/dio_helper.dart';
import 'package:cosmetics/core/widgets/country_code.dart';
import 'package:cosmetics/core/widgets/search_input.dart';
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
  List<CategoryModel> categoriesList = [];
  DataState state = DataState.loading;

  Future<void> getData() async {
    state = DataState.loading;
    setState(() {});

    final resp = await DioHelper.getData(path: '/api/Categories');

    if (resp.isSuccess) {
      categoriesList = (resp.data as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      state = DataState.succes;
    } else {
      state = DataState.failed;
    }

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
            state == DataState.loading
                ? const Center(child: CircularProgressIndicator())
                : state == DataState.failed
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Failed to load categories'),
                        SizedBox(height: 12.h),
                        TextButton(
                          onPressed: () {
                            state = DataState.loading;
                            setState(() {});
                            getData();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      itemCount: categoriesList.length,
                      separatorBuilder: (_, __) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Divider(
                          color: Colors.grey.withOpacity(.5),
                          thickness: 1,
                        ),
                      ),
                      itemBuilder: (context, index) {
                        final model = categoriesList[index];

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
  late final String titleAr;
  late String imageUrl;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title_en'] ?? json['title'] ?? json['name'] ?? '';
    // titleAr job: keep the Arabic title for future use (commented out to hide it)
    titleAr = json['title_ar'] ?? '';
    imageUrl = json['image_url'] ?? json['imageUrl'] ?? "";
    imageUrl = imageUrl.isEmpty ? 'assets/images/bundles.png' : imageUrl;
  }
}

class CategoriesData {
  late List<CategoryModel> list;

  CategoriesData.fromJsonList(List<dynamic> json) {
    list = json.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
