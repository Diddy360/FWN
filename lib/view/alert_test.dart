import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fwn/view/home_screen.dart';
import 'package:fwn/view/login_screen.dart';
import 'package:fwn/view/map_screen.dart';
import 'package:fwn/view/news_screen.dart';
import 'package:fwn/view/notification_screen.dart';
import 'package:fwn/view/setting_page.dart';
import 'package:fwn/view/support_us.dart';
import 'package:fwn/view/wether_Page.dart';
import 'package:get/get.dart';

class AlertTest extends StatefulWidget {
  const AlertTest({super.key});

  @override
  State<AlertTest> createState() => _AlertTestState();
}

class _AlertTestState extends State<AlertTest>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_controller!);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  final player = AudioPlayer();
  var test = 0;
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
                  onTap: () => Get.to(() => const MapScreen()), child: const Text("Map")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const NewsScreen()), child: const Text("News")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const WetherPage()),
                  child: const Text("Wether")),
              const Divider(),
              const InkWell(child: Text("Forecasting")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const SupportUs()),
                  child: const InkWell(child: Text("Support us"))),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const NotificationPage()),
                  child: const Text("Notification")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const SettingPage()),
                  child: const Text("Settings")),
              const Divider(),
              InkWell(
                  onTap: () => Get.to(() => const LoginScreen()),
                  child: const Text("Logout")),
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
                              color: Colors.black.withOpacity(0.8),
                              border:
                                  Border.all(color: Colors.white, width: 0.1.w),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Alert Test",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp),
                                ),
                              ),
                              test == 0
                                  ? const SizedBox()
                                  : FadeTransition(
                                      opacity: _animation,
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    height: 50,
                                                    width: 50.w,
                                                    // color: Colors.red,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.amber)),
                                                    child: const Icon(
                                                      Icons.warning,
                                                      color: Colors.yellow,
                                                      size: 45,
                                                    )),
                                                SizedBox(
                                                  width: 8.w,
                                                ),
                                                const Text(
                                                  "Emergency alert:\nServe\nMarch 4, 4 : 47 PM.",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "National Weather Service:",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                    "SERVE\nTHUNDERSTROM\nWARNING",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                Text(
                                                    "in effect for this area untill\n6:00 PM for",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                Text(
                                                    "DESTRUCTIVE 80mph\nwinds.",
                                                    style: TextStyle(
                                                        color: Colors.white))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 50.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              Center(
                                child: test == 1
                                    ? ElevatedButton(
                                        onPressed: () async {
                                          test = 0;
                                          setState(() {});

                                          player.stop();
                                        },
                                        child: const Text('Stop!'),
                                      )
                                    : ElevatedButton(
                                        onPressed: () async {
                                          test = 1;
                                          setState(() {});
                                          // Trigger a heavy impact vibration
                                          HapticFeedback.heavyImpact();

                                          // Play an alert tone for 1 minute
                                          await player
                                              .setReleaseMode(ReleaseMode.loop);
                                          player.play(AssetSource(
                                              'beep-warning-6387.mp3'));

                                          // Stop the tone after 1 minute
                                          await Future.delayed(
                                              const Duration(seconds: 30));
                                          player.stop();
                                        },
                                        child: const Text('Tap me!'),
                                      ),
                              ),
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
