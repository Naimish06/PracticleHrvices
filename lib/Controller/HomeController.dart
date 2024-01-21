import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicle_hrvices/Constant/constan.dart';
import 'package:practicle_hrvices/Model/ServiceModel.dart';
import 'package:practicle_hrvices/Services/Retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:practicle_hrvices/View/ServiceDetailsView.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  String Accesstoken = "";
  ServiceModel? serviceModel;

  @override
  void onInit() {
    super.onInit();
    GetAccessToken();
  }

  GetService(BuildContext context) async {
    try {
      final Map<String, dynamic> body = {
        "params": {
          "sr_status": ["assigned"],
          "date": "2023-09-12",
          "clinician_status": ["acknowledged", "pending_acknowledgement"],
        }
      };
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "token": "${Accesstoken}"
      };

      var response = await Getservice(body, headers);
      if (response.statusCode == 200) {
        serviceModel = ServiceModel.fromJson(json.decode(response.body));
        var astrackdata = json.decode(response.body);
        if (serviceModel!.result!.status!) {
          String status = astrackdata['result']['message'];
          print(status);
          isLoading.value = true;
          update();
        } else {
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              content: Text('No Data Found'),
            ),
          );
        }
      } else {}
    } catch (e) {
      print(e);
    }
  }

  ViewDetails(String caseid) {
    try {
      SaveCaseId(caseid);
    } catch (e) {
      print(e);
    }
  }

  Future<void> GetAccessToken() async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      Accesstoken = sp.getString("access_token")!;
      print(Accesstoken);
      GetService(Get.context!);
    } catch (e) {
      print(e);
    }
  }

  Future<void> SaveCaseId(String caseid) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp..setString("case_id", caseid);
      Get.to(ServiceDetailsView());
    } catch (e) {
      print(e);
    }
  }
}
