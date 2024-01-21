import 'dart:convert';

import 'package:http/http.dart' as http;

String base_url="http://3.111.141.106:8051/vwm/";

Future<http.Response> LoginAuth(Map<String ,dynamic> formData) async{
  String jsonBody = jsonEncode(formData);
  Map<String, String> headers = {
    "Content-Type": "application/json",
  };
  var uri=Uri.parse(base_url+"login");

  http.Response response=await http.post(uri, body: jsonBody, headers: headers);

  return response;
}

Future<http.Response> Getservice(Map<String ,dynamic> formData,Map<String,String> headers) async{
  String jsonBody = jsonEncode(formData);

  var uri=Uri.parse(base_url+"sr_by_status");

  http.Response response=await http.post(uri, body: jsonBody, headers: headers);

  return response;
}
Future<http.Response> AddPrePorcedure(Map<String ,dynamic> formData,Map<String,String> headers) async{
  String jsonBody = jsonEncode(formData);

  var uri=Uri.parse(base_url+"add_pre_procedure_review_to_sr");

  http.Response response=await http.post(uri, body: jsonBody, headers: headers);

  return response;
}