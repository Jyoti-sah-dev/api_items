import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'get data show.dart';
import 'mixins_class.dart';
import 'user api sarvice.dart';


class PostDataScreen extends StatefulWidget {
  const PostDataScreen({super.key});

  @override
  State<PostDataScreen> createState() => _PostDataScreenState();
}

class _PostDataScreenState extends State<PostDataScreen> with ViewTextField {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var contantController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.purple, title: Center(child: Text("GET API SCREEN")),),
        body: GetBuilder(
          init: UserApiServices(),
          builder: (controller) {
            return   Column(
              children: [
                textField(nameController,"Name", ),
                textField(emailController,"Email", ),
                textField(contantController,"Contant"),

                MaterialButton(color: Colors.purple, onPressed: (){
                  controller.userPost(nameController.text, emailController.text, contantController.text);
                  Get.to(GetDataShowScreen());

                },child: Text("SAVE",style: TextStyle(color: Colors.black,fontSize: 20  ),),)
              ],
            );
          },)


    );
  }
}