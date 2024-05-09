import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fwn/view/home_screen.dart';

import 'package:fwn/view/login_screen.dart';
import 'package:intl/intl.dart';

import 'package:fwn/view/registration_screen.dart';
import 'package:fwn/view/support_us.dart';
import 'package:fwn/view/thanku_page.dart';

import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ReportDisaster extends StatefulWidget {
  const ReportDisaster({super.key});

  @override
  State<ReportDisaster> createState() => _ReportDisasterState();
}

class _ReportDisasterState extends State<ReportDisaster> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  final List<String> desasteritems = [
    'Flood',
    'Tsunami',
    'Wildfire',
    'Drought',
  ];
  final List<String> Status = [
    'Ongoing',
    'Resolved',
    'Other',
  ];
  String? selectedValue1;
  String? selectedValue2;

  Future<void> saveUserData({
    required String disaster,
    required String status,
    required String address,
  }) async {
    // Reference to the collection where data will be stored
    CollectionReference users =
        FirebaseFirestore.instance.collection('disaster');

    // Get the current time
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    // Call the 'add' method to save data to the collection
    return users.add({
      'disaster': disaster,
      'status': status,

      'address': address,
      'timestamp': formattedTime, // Add the current time here
    }).then((value) {
      Get.to(() => const ThankuPage());
    }).catchError((error) => print("Failed to add user: $error"));
  }

//String? dropdownvalue = 'Item 1';
  var address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150.h,
                width: double.infinity,
                color: Colors.black.withOpacity(0.8),
                child: Center(
                  child: Image.asset(
                    "assets/logo.png",
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
               InkWell(
                  onTap: () => Get.to(() => const HomeScreen()),
                  child: const Text("Home")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const RegistrationScreen()),
                  child: const Text("Registration")),
              const Divider(),
              InkWell(
                  onTap: () {
                    Get.to(() => const LoginScreen());
                  },
                  child: const Text("Login")),
              const Divider(),
              const InkWell(child: Text("News")),
              const Divider(),
              const InkWell(child: Text("Wether")),
              const Divider(),
              const InkWell(child: Text("Forecasting")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const SupportUs()),
                  child: const InkWell(child: Text("Support us"))),
              const Divider(),
              const InkWell(child: Text("Notification")),
            ],
          ),
        ),
      ),
      // Disable opening the end drawer with a swipe gesture.
      endDrawerEnableOpenDragGesture: false,

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
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                        height: 45.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/logo.png",
                            ),
                            Text(
                              "FWN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: () {
                                _openEndDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 22.sp,
                              ),
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Report Disaster",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.h,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            height: 400.h,
                            color: Colors.grey.withOpacity(0.3),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        hint: const Text(
                                          'Select Disaster',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        items: desasteritems
                                            .map((String item) =>
                                                DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ))
                                            .toList(),
                                        value: selectedValue1,
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedValue1 = value;
                                          });
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: 40,
                                          width: 140,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Container(
                                    height: 50.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(20.r)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        hint: const Text(
                                          'Select Status',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        items: Status.map((String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            )).toList(),
                                        value: selectedValue2,
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedValue2 = value;
                                          });
                                        },
                                        buttonStyleData: const ButtonStyleData(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          height: 40,
                                          width: 140,
                                        ),
                                        menuItemStyleData:
                                            const MenuItemStyleData(
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  SizedBox(
                                    height: 50.h,
                                    child: TextField(
                                      controller: address,
                                      decoration: InputDecoration(
                                        hintText: "Address/location/city",
                                        hintStyle:
                                            const TextStyle(color: Colors.black),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.grey), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1,
                                              color:
                                                  Colors.grey), //<-- SEE HERE
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          InkWell(
                            onTap: () {
                              saveUserData(
                                  disaster: selectedValue1!,
                                  status: selectedValue2!,
                                  address: address.text);
                            },
                            child: Container(
                              height: 40.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      color: Colors.white, width: 0.1.w),
                                  color: Colors.green),
                              child: const Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
