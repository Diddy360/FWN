import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fwn/view/home_screen.dart';
import 'package:fwn/view/login_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  var usreName = TextEditingController();
  var fullname = TextEditingController();
  var email = TextEditingController();
  var contactNumber = TextEditingController();
  var location = TextEditingController();
  var password = TextEditingController();
  Future<void> registerUser({
    required BuildContext context,
    required String username,
    required String password,
    required String email,
    required String phoneNumber,
    required String location,
    required String fullName,
  }) async {
    try {
      // Create a new user with the provided email and password.
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user's unique ID.
      String uid = userCredential.user!.uid;

      // Save the additional user information in Firestore under the 'users' collection.
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'address': location,
        'fullName': fullName,
      });

      // Navigate to the home page after successful registration.
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString("email", email);
      sp.setBool("login", true);
      Get.offAll(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
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
                    child: SingleChildScrollView(
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
                                border: Border.all(
                                    color: Colors.white, width: 0.1.w),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Column(
                              children: [
                                Text(
                                  "Registration",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                                SizedBox(
                                  height: 50.h,
                                ),
                                TextField(
                                  controller: fullname,
                                  decoration: InputDecoration(
                                    hintText: "Full Name",
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
                                  controller: usreName,
                                  decoration: InputDecoration(
                                    hintText: "User Name",
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
                                  height: 20.h,
                                ),
                                TextField(
                                  controller: contactNumber,
                                  decoration: InputDecoration(
                                    hintText: "Contact Number",
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
                                  height: 20.h,
                                ),
                                TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    hintText: "Email",
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
                                  height: 20.h,
                                ),
                                TextField(
                                  controller: location,
                                  decoration: InputDecoration(
                                    hintText: "Address",
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
                                  height: 70.h,
                                ),
                                InkWell(
                                  onTap: () => registerUser(
                                      context: context,
                                      username: usreName.text,
                                      password: password.text,
                                      email: email.text,
                                      phoneNumber: contactNumber.text,
                                      location: location.text,
                                      fullName: fullname.text),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    width: 150.w,
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "Register",
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
                                      "Already have an Account? ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.sp),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    InkWell(
                                      onTap: () => Get.to(() => const LoginScreen()),
                                      child: Text(
                                        "Login",
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
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
