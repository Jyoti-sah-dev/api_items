import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:items_api_project_new/coustomers_items_api/put%20data_screen.dart';


import 'get model_class.dart';
import 'user api sarvice.dart';


class GetDataShowScreen extends StatefulWidget {
  const GetDataShowScreen({super.key});

  @override
  State<GetDataShowScreen> createState() => _GetDataShowScreenState();
}

class _GetDataShowScreenState extends State<GetDataShowScreen> {
  @override
  var api = Get.put(UserApiServices());


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.pinkAccent, title: Center(child: Text("GET DATA SHOW")),),
        body:  RefreshIndicator(
          child:  GetBuilder(
          init: UserApiServices(),
          builder: (controller) {
            return  FutureBuilder(
                future: controller.getOders(),
                builder: (_, snapshot){
                  var data = snapshot.data?.items?? List<Item>.empty();
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index){
                        return Padding(
                          padding:EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 5,
                            shadowColor: Colors.black,
                            color: Colors.teal,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(padding: EdgeInsets.all(8.0),
                                          child: Text("${data[index].name}"),
                                        ),
                                        Padding(padding: EdgeInsets.all(8.0),
                                          child: Text("${data[index].email}"
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.all(8.0),
                                          child: Text("${data[index].contact}"),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(onPressed: (){
                                          Get.to(PutDataScreen(name: "${data[index].name}", email: "${data[index].email}", contant: "${data[index].contact}", id: "${data[index].id}",));
                                        }, icon: Icon(Icons.edit)
                                        ),
                                        IconButton(onPressed: (){

                                        }, icon: Icon(Icons.delete))
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  );
                }
            );
          },
        ), onRefresh: () {
          return api.getOders();
        },
        )
    );
  }
}