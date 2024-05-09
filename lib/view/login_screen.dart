import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fwn/view/home_screen.dart';
import 'package:fwn/view/registration_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString("email", email);
      sp.setBool("login", true);
      Get.offAll(() => const HomeScreen());
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              image: const DecorationImage(
                  image: AssetImage(
                    "assets/earth.jpg",
                  ),
                  fit: BoxFit.fill)),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 45.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/logo.png",
                            ),
                            SizedBox(
                              width: 50.w,
                            ),
                            Text(
                              "FWN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              border:
                                  Border.all(color: Colors.white, width: 0.1.w),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              TextField(
                                controller: email,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                 style: const TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextField(
                                controller: password,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.grey), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                 style: const TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 150.h,
                              ),
                              InkWell(
                                onTap: () => signInWithEmailPassword(
                                    email.text, password.text),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  width: 150.w,
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Do not have Account? ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        Get.to(() => const RegistrationScreen()),
                                    child: Text(
                                      "Sign Up ",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
