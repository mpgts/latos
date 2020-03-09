import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:latos/src/pages/init.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light
  ));
  runApp(MyApp());
}

