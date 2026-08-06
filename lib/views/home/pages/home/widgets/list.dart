part of '../view.dart';

class _List extends StatefulWidget {
  final String? title;
  const _List({super.key, this.title});

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {
  List<ProductModel> productsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final resp = await Dio().get(
        'https://cosmatics.growfet.com/api/Products',
      );
      if (!mounted) return;
      setState(() {
        productsList = ProductsData.fromJsonList(resp.data).list;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ?? "Most Popular",
          style: TextStyle(
            color: const Color(0xff434C6D),
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 16.h),
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                shrinkWrap: true,

                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 176 / 237,
                ),
                itemBuilder: (context, index) {
                  return ProductItem(product: productsList[index]);
                },
                itemCount: productsList.length,
              ),
      ],
    );
  }
}

class ProductModel {
  late final int id;
  late final String name, description, imageUrl;
  late final num price;
  late final int stock;
  late final int? categoryId;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    description = json['description'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
    price = json['price'] ?? 0;
    stock = json['stock'] ?? 0;
    categoryId = json['categoryId'];
  }
}

class ProductsData {
  late List<ProductModel> list;

  ProductsData.fromJsonList(List<dynamic> json) {
    list = json.map((e) => ProductModel.fromJson(e)).toList();
  }
}
