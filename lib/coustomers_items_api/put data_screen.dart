import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'get data show.dart';
import 'mixins_class.dart';
import 'user api sarvice.dart';


class PutDataScreen extends StatefulWidget {
  String name;
  String email;
  String contant;
  String id;

  PutDataScreen({required this.name, required this.email, required this.contant,required this.id});

  @override
  State<PutDataScreen> createState() => _PutDataScreenState();
}

class _PutDataScreenState extends State<PutDataScreen> with ViewTextField{
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var contantController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    contantController = TextEditingController(text: widget.contant);

    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.purpleAccent, title: Center(child: Text("UPDATE API SCREEN")),),
        body: GetBuilder(
          init: UserApiServices(),
          builder: (controller) {
            return   Column(
              children: [
                textField(nameController),
                textField(emailController),
                textField( contantController),
                MaterialButton(
                  color: Colors.purpleAccent,
                  onPressed: (){
                    controller.putCustomers(nameController.text,emailController.text,contantController.text,
                        widget.id
                    );
                    Get.back(result: GetDataShowScreen());
                  },child: Text("UPDATE",style: TextStyle(color: Colors.redAccent,fontSize: 20),),
                )
              ],
            );
          },
        )
    );
  }
}