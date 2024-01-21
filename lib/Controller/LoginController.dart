import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicle_hrvices/Services/Retrofit.dart';
import 'package:practicle_hrvices/View/HomeView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:practicle_hrvices/Constant/constan.dart';

class LoginController extends GetxController{
  var emailcon = TextEditingController();
  var passwordcon = TextEditingController();


  Login(BuildContext context) async{
    try{
      final Map<String,dynamic> body={
        "params":{
          "username":"${emailcon.text.toString()}",
          "password":"${passwordcon.text.toString()}",
          "device_id":"test",
        }
      };
      final Map<String,String> formData = {
          "username":"${emailcon.text.toString()}",
          "password":"${passwordcon.text.toString()}",
          "device_id":"test",

      };
      var response=await LoginAuth(body);
      if(response.statusCode == 200){
        var astrackdata=json.decode(response.body);
        if(astrackdata['result']['status']){
          print("${astrackdata['result']['message']}");
          String status=astrackdata['result']['message'];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${status}'),
            ),
          );
          var data=astrackdata['result']['data'];
          if(await saveUser(data['token'].toString(),data['email'].toString(),data['user_id'].toString(),data['company_name'].toString(),data['phone'].toString(),data['fullname'].toString())){
            Get.offUntil(MaterialPageRoute(builder: (context) => HomeView()), (route) => false);
          }

        }else{
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              content: Text('Login Filed'),
            ),
          );
        }
      }else{

      }

    }catch(e){
      print(e);
    }
  }

  @override
  void dispose() {
    emailcon.dispose();
    passwordcon.dispose();
  }
  Future<bool> saveUser(String accesstoken,String email_id,String loginuserid,String com_name,String phone_no,String full_name) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    print("$accesstoken");
    sp.setString("access_token", accesstoken);
    sp.setString(email, email_id);
    sp.setString(login_user_id, loginuserid);
    sp.setString(company_name, com_name);
    sp.setString(phone, phone_no);
    sp.setString(fullname, full_name);
    print(loginuserid);
    return true;

  }
}