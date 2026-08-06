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
      final resp = await DioHelper.getData(path: '/api/Sliders');
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

    return CarouselSlider(
      options: CarouselOptions(
        height: 320.h,
        aspectRatio: 364.w / 320.h,
        autoPlay: true,
        //padEnds: true,
        viewportFraction: 1,
      ),
      items: List.generate(list!.length, (index) {
        final offer = list![index];
        return Padding(
          padding: const EdgeInsetsDirectional.only(end: 12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AppImage(
                  image: offer.imageUrl,
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
                            "${offer.discountPercent}% OFF DISCOUNT\nCUPON CODE : ${offer.couponCode}",
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
                            "${offer.descriptionTitle1En}\n${offer.descriptionTitle2En}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xff434C6D),
                              fontSize: 16.sp,

                              fontWeight: FontWeight.w700,
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
        );
      }),
    );
  }
}

class OffersData {
  late List<OfferModels> list;
  OffersData.fromJsonList(List<dynamic> json) {
    list = json
        .whereType<Map>()
        .map((e) => OfferModels.fromJson(e.cast<String, dynamic>()))
        .toList();
  }
}

class OfferModels {
  late final String couponCode, imageUrl;
  late final String descriptionTitle1En, descriptionTitle1Ar;
  late final String descriptionTitle2En, descriptionTitle2Ar;
  late final num discountPercent;
  late final int productId;

  OfferModels.fromJson(Map<String, dynamic> json) {
    couponCode = json['coupon_code'] ?? '';
    imageUrl = json['image_url'] ?? '';
    descriptionTitle1En = json['description_title1_en'] ?? '';
    descriptionTitle1Ar = json['description_title1_ar'] ?? '';
    descriptionTitle2En = json['description_title2_en'] ?? '';
    descriptionTitle2Ar = json['description_title2_ar'] ?? '';
    discountPercent = json['discount_percent'] ?? 0;
    productId = json['id'] ?? 0;
  }
}
