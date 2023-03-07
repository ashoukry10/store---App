import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
class Api
{
  Future<dynamic> get({required String url})async
  {
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else {
      throw Exception('three is problem with status code ${response.statusCode}');
    }
  }
  Future<dynamic> post({required String url,@required dynamic body,@required String? token}) async
  {
    Map<String, String> headers = {};
    if(token!=null){
      headers.addAll({
        '':''
      });
    }
    http.Response response = await http
        .post(Uri.parse(url , body,),
        body:body,
    );
    Map<String,dynamic> data =jsonDecode(response.body);
    return data;
  }

  Future<dynamic> put({required String url,@required dynamic body,@required String? token}) async
  {
    Map<String, String> headers = {};
    if(token!=null){
      headers.addAll({
        'Content-Type':'application/x-www-form-urlencoded',
      });
    }
    http.Response response = await http
        .post(Uri.parse(url , body,),
      body:body,
    );
    Map<String,dynamic> data =jsonDecode(response.body);
    return data;
  }

}