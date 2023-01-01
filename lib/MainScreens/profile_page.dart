import 'package:budgetapp/json/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../pages/google_signin_out.dart';
import '../theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _email = TextEditingController(text: email);
  TextEditingController _dateOfBirth = TextEditingController(text: dateOfBirth);
  TextEditingController _password = TextEditingController(text: password);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey!.withOpacity(0.1),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: grey!.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3)
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, left: 20, right: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      MaterialButton(
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogout();
                            FirebaseAuth.instance.signOut();
                          },
                          color: Colors.deepPurple,
                          child: Icon(
                            Icons.power_settings_new,
                            size: 25,
                          )), //instead add the logout button
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Container(
                        width: (size.width - 40) * 0.4,
                        child: Container(
                          child: Stack(
                            children: [
                              RotatedBox(
                                quarterTurns: -2,
                                child: CircularPercentIndicator(
                                  circularStrokeCap: CircularStrokeCap.round,
                                  backgroundColor: grey!.withOpacity(0.3),
                                  radius: 70.0,
                                  lineWidth: 6.0,
                                  percent: 0.53,
                                  progressColor: primary,
                                ),
                              ),
                              Positioned(
                                top: 7,
                                left: 7.2,
                                child: Container(
                                  width: 127,
                                  height: 127,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(profileUrl),
                                          fit: BoxFit.fill)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: (size.width - 40) * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: black),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Credit Score : $credit",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: black.withOpacity(0.4)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: grey!.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 25, bottom: 25, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HDFC Bank",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "\$2440.50",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: white)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Update",
                                style: TextStyle(color: white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600, color: grey),
                ),
                TextField(
                  controller: _email,
                  cursorColor: black,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17, color: black),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
                SizedBox(height: 20),
                Text(
                  "Date Of Birth",
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600, color: grey),
                ),
                TextField(
                  controller: _dateOfBirth,
                  cursorColor: black,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17, color: black),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
                SizedBox(height: 20),
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600, color: grey),
                ),
                TextField(
                  controller: _password,
                  obscureText: true,
                  cursorColor: black,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17, color: black),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//Update Button : Updates the hdfc account : a small pop up box to set account balance.