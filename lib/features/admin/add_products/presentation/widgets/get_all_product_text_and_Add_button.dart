import 'package:flutter/material.dart';
import 'package:store/core/localization/lang_keys.dart';
import 'package:store/core/widgets/admin_text_and_add_button.dart';


class GetAllProductTextAndAddButton extends StatelessWidget {
  const  GetAllProductTextAndAddButton ({super.key});

  @override
  Widget build(BuildContext context) {
    return
    AdminTextAndAddButton(text:LangKeys.getAllProducts , onpressed: (){ 
                      
                });
}}