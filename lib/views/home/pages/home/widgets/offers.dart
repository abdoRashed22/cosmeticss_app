part of '../view.dart';

class _Offers extends StatefulWidget {
  const _Offers({super.key});

  @override
  State<_Offers> createState() => _OffersState();
}

class _OffersState extends State<_Offers> {
  List<OfferModels>? list = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      final resp = await Dio().get('https://cosmatics.growfet.com/api/Sliders');
      if (!mounted) return;
      setState(() {
        list = OffersData.fromJsonList(resp.data).list;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => isLoading = false);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (list == null || list!.isEmpty) {
      return const SizedBox.shrink();
    }
    if (isLoading) {
      return Center(child: const CircularProgressIndicator());
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 320.h,
        aspectRatio: 364.w / 320.h,
        autoPlay: true,
        //padEnds: true,
        viewportFraction: 1,
      ),
      items: List.generate(
        list!.length,

        (index) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AppImage(
                  image: 'layer1.png',
                  height: 320.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: double.infinity, height: 320.h),
                Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xffE9DCD3).withValues(alpha: .8),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),
                      Row(
                        children: [
                          // SizedBox(height: 30),
                          Text(
                            "${list![index].discountPercent}% OFF DISCOUNT\nCUPON CODE : ${list![index].couponCode}",
                            style: TextStyle(
                              color: const Color(0xff62322D),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          AppImage(image: 'home_layer3.svg'),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/home_layer3.svg',
                            width: 55.w,
                            height: 55.h,
                          ),
                          Text(
                            "${list![index].descriptionTitle1}\n${list![index].descriptionTitle2}",
                            style: TextStyle(
                              color: const Color(0xff434C6D),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OffersData {
  late List<OfferModels> list;
  OffersData.fromJsonList(List<dynamic> json) {
    list = json.map((e) => OfferModels.fromJson(e)).toList();
  }
}

class OfferModels {
  late final String couponCode, descriptionTitle1, descriptionTitle2, imageUrl;
  late num discountPercent;
  late final int productId;
  OfferModels.fromJson(Map<String, dynamic> json) {
    couponCode = json['couponCode'] ?? "";
    descriptionTitle1 = json['descriptionTitle1'] ?? "";
    descriptionTitle2 = json['descriptionTitle2'] ?? "";
    imageUrl = json['imageUrl'] ?? "";
    discountPercent = json['discountPercent'] ?? 0;
    productId = json['id'] ?? 0;
  }
}
