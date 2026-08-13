import 'package:cosmetics/core/helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ViewState { initial, loading, failed, success }

class AppCountryCode extends StatefulWidget {
  const AppCountryCode({super.key, required this.onCodeChanged});
  final ValueChanged<String> onCodeChanged;
  @override
  State<AppCountryCode> createState() => _AppCountryCodeState();
}

class _AppCountryCodeState extends State<AppCountryCode> {
  String? selectedCode;
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<CountryModel>? list;

  ViewState state = ViewState.loading;
  Future<void> getData() async {
    state = ViewState.loading;
    setState(() {});

    final resp = await DioHelper.getData(path: "api/Countries");

    print(resp.data);

    if (resp.isSuccess) {
      list = (resp.data as List<dynamic>)
          .map((e) => CountryModel.fromJson(e))
          .toList();

      if (list!.isNotEmpty) {
        selectedCode = list!.first.code;
        widget.onCodeChanged(selectedCode!);
      }

      state = ViewState.success;
    } else {
      state = ViewState.failed;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 85.w,
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey, width: 1.w),
          ),
          child: state == ViewState.loading
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: .5,
                    color: Colors.red,
                    backgroundColor: Colors.grey,
                  ),
                )
              : state == ViewState.failed
              ? IconButton(
                  onPressed: () {
                    state = ViewState.loading;
                    setState(() {});
                    getData();
                  },
                  icon: const Icon(Icons.replay),
                )
              : DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCode,
                    icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
                    items: list!.map((country) {
                      return DropdownMenuItem<String>(
                        value: country.code,
                        child: Text(country.code),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        selectedCode = value;
                      });

                      widget.onCodeChanged(value);
                    },
                  ),
                ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}

/*class CountriesData {
  CountriesData();
  late final List<CountryModel> list;

  CountriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CountryModel.fromJson(e)).toList();
  }
}*/

class CountryModel {
  late final int id;
  late final String code;
  late final String nameEn;
  late final String nameAr;
  //named constructor
  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }
}
