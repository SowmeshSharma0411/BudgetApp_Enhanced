//Error handling code for login and logout isnt written.

import 'dart:ffi';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budgetapp/MainScreens/budget_page.dart';
import 'package:budgetapp/MainScreens/create_budget_page.dart';
import 'package:budgetapp/MainScreens/daily_page.dart';
import 'package:budgetapp/MainScreens/profile_page.dart';
import 'package:budgetapp/MainScreens/status_page.dart';
import 'package:budgetapp/pages/google_signin_out.dart';
import 'package:budgetapp/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'pages/register_page.dart';
import 'pages/login_page.dart';
import 'pages/google_signin_out.dart';
import 'package:budgetapp/MainScreens/daily_page.dart';
import 'package:budgetapp/MainScreens/status_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SafeArea(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      body: getbody(),
      //Text('Signed In as ' + user.email!),
      //       MaterialButton(
      //           onPressed: () {
      //             final provider =
      //                 Provider.of<GoogleSignInProvider>(context, listen: false);
      //             provider.googleLogout();
      //             FirebaseAuth.instance.signOut();
      //           },
      //           color: Colors.deepPurple,
      //           child: //Text('Sign Out'),
      //               Icon(
      //             Icons.power_settings_new,
      //             size: 25,
      //           ))
      //     ],
      //   ),
      // ),
      bottomNavigationBar: getFooter(),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setTabs(4);
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getbody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DailyPage(),
        StatusPage(),
        BudgetPage(),
        ProfilePage(),
        CreateBudgetPage(),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      //change package if u can.
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.md_person,
    ];
    return AnimatedBottomNavigationBar(
        icons: iconItems,
        activeColor: primary,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
//Will implement logout in another page : profile page.
