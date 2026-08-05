import 'package:cosmetics/core/helper/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DataState { loading, failed, succes }

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

  DataState state = DataState.loading;
  Future<void> getData() async {
    state = DataState.loading;
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

      state = DataState.succes;
    } else {
      state = DataState.failed;
    }

    setState(() {});
  }

  /*Future<void> getData() async {
    final resp = await Dio().get('https://cosmatics.growfet.com/api/Countries');
    final data = CountriesData.fromJson({'list': resp.data}).list;

    setState(() {
      countriesList = data;
      int index = countriesList!.indexWhere((element) => element.code == '+20');
      if (index != null && index != -1) {
        selectedCode = countriesList![index].code;
      } else {
        selectedCode = countriesList!.first.code;
      }
       widget.onCodeChanged(selectedCode!);
    });
  }*/

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
          child: state == DataState.loading
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: .5,
                    color: Colors.red,
                    backgroundColor: Colors.grey,
                  ),
                )
              : state == DataState.failed
              ? IconButton(
                  onPressed: () {
                    state = DataState.loading;
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
