import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultFormField ({
  required TextEditingController controller ,
  required TextInputType type ,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false ,
  required Function validate,
  required var label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true ,

}) => TextFormField (
  controller: controller,
  keyboardType: type,
  obscureText : isPassword,
  enabled: isClickable,
  onFieldSubmitted: onSubmit != null? onSubmit(): null,
  onChanged: onChange != null? onChange(): null ,
  onTap: onTap != null? onTap(): null,
  validator: (value)
  {
    return validate (value);
  },
  decoration:  InputDecoration(
    // hintText: 'Enter Email Address',
    labelText: label  ,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      // ignore: unnecessary_null_comparison
      onPressed: (){
        suffixPressed != null ? suffixPressed() : null ;
      },
      icon: Icon(
        suffix,
      ),
    ) : null ,
    border: const OutlineInputBorder(),
  ),
);
