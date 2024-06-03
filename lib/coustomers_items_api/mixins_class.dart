import 'package:flutter/material.dart';

mixin ViewTextField {
textField( [ TextEditingController? controller,String ? hitTexts,]){
return Padding(padding: EdgeInsets.all(8.0),
child: TextField(
controller: controller,
decoration: InputDecoration(
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(15)
),hintText: hitTexts
),
),
);
}

}
