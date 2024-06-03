import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



import 'package:http/http.dart' as http;

import 'get model_class.dart';



class UserApiServices extends GetxController {

  Future<void> userPost(
      String name,
      String email,
      String contacnt,
      ) async {
    var headers = {
      "Authorization": 'Basic ${base64Encode(
        utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
      "Content-Type": "application/json",

    };
    var url = Uri.parse('https://api.razorpay.com/v1/customers');
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            "name": name,
            "email": email,
            "contact": contacnt,
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.body);
        print("Success");
        Fluttertoast.showToast(
          msg: "Order created successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.teal,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        print("Failed with status: ${response.statusCode}");
        Fluttertoast.showToast(
          msg: "Failed to create order: ${response.reasonPhrase}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.cyan,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print("Error: $e");
      Fluttertoast.showToast(
        msg: "An error occurred: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
  Future<CustomersModal> getOders() async{
    var headers = { "Authorization": 'Basic ' + base64Encode(utf8.encode('${'rzp_test_fDHQt7hg7IlYBv'}:${'SzSUd2fe3n5NO8KragWwfKsc'}'))
    };
    var responce = await http.get(Uri.parse("https://api.razorpay.com/v1/customers"),headers: headers);
    if(responce.statusCode == 200) {
      var json = jsonDecode(responce.body);
      var data = CustomersModal.fromJson(json);
      return data;


    }
    else{
      return getOders();

    }
  }
  putCustomers( String name,
      String email,
      String contacnt,String id)async{
    var url = Uri.parse("https://api.razorpay.com/v1/customers/$id");
    var headers = {
      "Authorization": 'Basic ${base64Encode(
        utf8.encode('${"rzp_test_fDHQt7hg7IlYBv"}:${"SzSUd2fe3n5NO8KragWwfKsc"}'),
      )}',
      "Content-Type": "application/json",
    };
    var repsdons= await http.put(url,headers:headers,body:json.encode(
      {
        "name": name,
        "email": email,
        "contact": contacnt
      },)
    );

    if(repsdons.statusCode==200){
      print(" success");
    }
    else{
      print("no success");
    }

  }
}