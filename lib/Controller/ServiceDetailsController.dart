import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:practicle_hrvices/Services/Retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceViewController extends GetxController {
  RxBool isExpand = false.obs;
  var renalcontroller = TextEditingController();
  var datecontroller = TextEditingController();
  String Accesstoken = "";
  String Case_id = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GetAccessToken();
  }

  ShowServiceDetails() {
    isExpand.value = true;
    update();
  }

  HideServiceDetails() {
    SubmitPreProcedure();
  }

  Future<void> SelectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      datecontroller.text =
          DateFormat('yyyy-MM-dd').format(selectedDate.toLocal());
      update();
      print(datecontroller.text);
    }
  }

  SubmitPreProcedure() async {
    try {
      final Map<String, dynamic> body = {
        "params": {
          "case_id": "${Case_id}",
          "pre_procedure_data": {
            "blood_thinner": ["Dabigatran", "Edoxaban"],
            "blood_thinners_other": "other",
            "platelet_count": "10",
            "ptt_value": "1",
            "creatinine": "10",
            "dialysis": "no",
            "history_nephrectomy": "no",
            "wbc": "10",
            "results": "negative",
            "inr": "10",
            "pt": "5",
            "bun": "2",
            "gfr": "10",
            "renal_transplant": "no",
            "renal_status_approved_by": "${renalcontroller.text.toString()}",
            "blood_culture_date": "${datecontroller.text.toString()}"
          },
        }
      };
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "token": "${Accesstoken}"
      };
      var response = await AddPrePorcedure(body, headers);
      if (response.statusCode == 200) {
        var astrackdata = json.decode(response.body);
        print(astrackdata);
        if (astrackdata['result']['status']) {
          print("${astrackdata['result']['message']}");
          String status = astrackdata['result']['message'];
          ScaffoldMessenger.of(Get.context!).showSnackBar(
             SnackBar(
              content: Text('${status}'),
            ),
          );
          isExpand.value = false;
          datecontroller.text="";
          renalcontroller.text="";
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

  Future<void> GetAccessToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    Accesstoken = sp.getString("access_token")!;
    Case_id = sp.getString("case_id")!;
  }
}
