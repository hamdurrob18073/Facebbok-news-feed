import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Admin_login.dart';
import 'lojic.dart';








void main()async {WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(  ChangeNotifierProvider(create: (context) => Data(context),
  child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: Size(375, 812),builder: (contex,index){
      return MaterialApp(debugShowCheckedModeBanner: false,title: "Nutretion app",theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Admin_login()
      );
    },);
  }
}