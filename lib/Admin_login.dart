import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';



import 'create_account.dart';
import 'lojic.dart';


class Admin_login extends StatefulWidget {
  const Admin_login({super.key});

  @override
  State<Admin_login> createState() => _Admin_loginState();
}

class _Admin_loginState extends State<Admin_login> {
   bool obscuretext =true;
  

   

  @override
  Widget build(BuildContext context) {
    final logic = Provider.of<Data>(context);
      return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
      
        body: SingleChildScrollView(
          child: Container(
           
            height: 800.h,
            width: 400.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 350.h,
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        Text(
                          "Login",
                          style: TextStyle(color: Colors.black,fontSize: 40.sp,fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Please sing in to continue",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    height: 65.h,
                    width: 350.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color( 0xffcfcfcf)),
                    child: TextField(style: TextStyle(color: Colors.black,fontSize: 18),
                      controller:logic. namcon,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: 'Enter your email',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    height: 65.h,
                    width: 350.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xffcfcfcf)),
                    child: TextField(style: TextStyle(color: Colors.black,fontSize: 18),
                      obscureText: obscuretext,
                      controller:logic. pascon,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: obscuretext ==true?
                          IconButton(onPressed: (){setState(() {
                            obscuretext =false;

                          });}, icon: Icon(Icons.remove_red_eye,size: 20.w,color: Colors.black,)):
                              IconButton(onPressed: (){setState(() {
                                obscuretext = true;
                              });}, icon:Icon(Icons.visibility_off,size: 20.w,color: Colors.black) ),

                          hintText: 'Enter your password',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                 GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0xfff25826), fontSize: 16),
                    ),
                  ),
                  onTap: (){logic.resetPassword();}
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 80),
                  child: GestureDetector(
                    child: Container(
                      height: 90.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                          color: Color(0xfff25826),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black, fontSize: 28),
                        ),
                      ),
                    ),onTap: (){Provider.of<Data>(context,listen: false).singin(context);},
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Container(
                  height: 30.h,
                  width: 400.w,
                  child: Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 200.w,
                        padding: EdgeInsets.only(left: 75, top: 2),
                        child: Text(
                          "Don't have an Account?",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ),

                      GestureDetector(
                        child: Container(
                          height: 30.h,
                          width: 140.w,
                          child: Text(
                            "Create an Account",
                            style: TextStyle(color: Color(0xfff25826), fontSize: 18),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>createac()));

                        },
                      ),
                    ],
                  ),
                
                    
                  
                
            )],
            ),
          ),
        ),
      ),
    );
  }
}