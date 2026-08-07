import 'package:cosmetics/core/helper/cach.dart';
import 'package:cosmetics/core/helper/dio_helper.dart';
import 'package:cosmetics/core/helper/message_snack_bar.dart';
import 'package:cosmetics/core/widgets/country_code.dart';
import 'package:cosmetics/views/auth/login/model.dart';
import 'package:flutter/material.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final phoneController = TextEditingController(text: "01025353411");
  final passwordController = TextEditingController(text: "123123123!");
  String selectedCountryCode = '+20';
  DataState? state;
  bool isLoginClicked = false;
  Future<void> sendData(UpdateState update) async {
    // todo :fix the setState issue in the controller and view
    //setState(() {});
    update(() {
      state = DataState.loading;
    });
    final resp = await DioHelper.sendData(
      path: '/api/Auth/login',
      data: {
        "countryCode": selectedCountryCode,
        "phoneNumber": phoneController.text.trim(),
        "password": passwordController.text.trim(),
      },
    );

    if (resp.isSuccess) {
      update(() {
        state = DataState.succes;
      });
      final model = UserData.fromJson(resp.data);
      print(model.user.email);
      await Cach.saveUserData(data: model);
      showCustomSnackBar(message: 'Login Successful');

      Navigator.pushNamed(navigatorKey.currentContext!, 'main');
    } else {
      update(() {
        state = DataState.failed;
      });
      showCustomSnackBar(
        message: resp.message ?? 'Login Failed',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    //todo :fix the setState issue in the controller and view

    // setState(() {});
  }

  void onChangedFormData() {
    if (isLoginClicked) {
      formKey.currentState!.validate();
    }
  }

  void onLoginButtonClicked(UpdateState update) {
    {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        sendData(update); // ← النجاح والـ navigate اتنقلوا لجوا sendData
      } else {
        //  setState(() => autovalidateMode = AutovalidateMode.always);
        update(() {
          autovalidateMode = AutovalidateMode.always;
          isLoginClicked = true;
        });
      }
    }
  }

  bool get isLoading => state == DataState.loading;
}

// important : this is the solution of using the SetState in class (does not stateful widget) and it is used in the controller to update the view when the state changes
typedef UpdateState = void Function(void Function());
