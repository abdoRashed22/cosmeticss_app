import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  List<CountryModel>? countriesList;

  Future<void> getData() async {
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
          child: countriesList == null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: .5,
                      color: Colors.red,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                )
              : DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedCode,
                    icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
                    items: countriesList!
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.code,
                            child: Text(e.code),
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      if (val != null) {
                        setState(() {
                          selectedCode = val;
                           widget.onCodeChanged(val);
                        });
                      }
                    },
                  ),
                ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}

class CountriesData {
  CountriesData();
  late final List<CountryModel> list;

  CountriesData.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['list'] ?? [],
    ).map((e) => CountryModel.fromJson(e)).toList();
  }
}

class CountryModel {
  CountryModel();
  late final int id;
  late final String code;
  late final String nameEn;
  late final String nameAr;

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    code = json['code'] ?? '';
    nameEn = json['name_en'] ?? '';
    nameAr = json['name_ar'] ?? '';
  }
}
