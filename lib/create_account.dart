import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import 'admin_login.dart';
import 'lojic.dart';
class createac extends StatefulWidget {
  const createac({super.key});

  @override
  State<createac> createState() => _createacState();
}

class _createacState extends State<createac> {
  bool obscureText =true;
  
  
  @override
  Widget build(BuildContext context) {
    final logic = Provider.of<Data>(context);
    return 
SafeArea(

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
                        Text(
                          "Create An Account",
                          style: TextStyle(color: Colors.black,fontSize: 40.sp,fontWeight: FontWeight.bold)
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Wellcome to the world of Entertainment",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    height: 65.h,
                    width: 350.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xffcfcfcf)),
                    child: TextField(style: TextStyle(color: Colors.black,fontSize: 18),
                      controller: logic.namecontroller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),hintText: "Enter your Email", hintStyle:
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
                      obscureText: obscureText,
                      controller:logic.passcontroller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixIcon: obscureText ==true?
                          IconButton(onPressed: (){setState(() {
                            obscureText =false;

                          });}, icon: Icon(Icons.remove_red_eye,size: 20.w,color: Colors.black,)):
                          IconButton(onPressed: (){setState(() {
                            obscureText = true;
                          });}, icon:Icon(Icons.visibility_off,size: 20.w,color: Colors.black) ),

                          hintText: 'Enter your password',
                          hintStyle:
                          TextStyle(color: Colors.black, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
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
                          "Next",
                          style: TextStyle(color: Colors.black, fontSize: 28),
                        ),
                      ),
                    ),
                    onTap: () {Provider.of<Data>(context,listen: false).singup(context);
                    },
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
                          "Already have an Account?",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ),

                      GestureDetector(
                        child: Container(
                          height: 30.h,
                          width: 140.w,
                          child: Text(
                            "Sing in",
                            style: TextStyle(color: Color(0xfff25826), fontSize: 18),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Admin_login()));

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
  }}