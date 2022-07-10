import 'package:flutter/material.dart';
import 'package:software_news/core/constants/colors.dart';

regularTextStyle({double? fontSize,color}) => TextStyle(fontSize: fontSize ?? 14.0 ,color: color ?? primaryColor);
mediumTextStyle({double? fontSize,color}) => TextStyle(fontSize: fontSize ?? 14.0 ,color: color ?? primaryColor,fontWeight: FontWeight.bold);