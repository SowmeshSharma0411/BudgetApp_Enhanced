import 'dart:ffi';

import 'package:budgetapp/json/day_month.dart';
import 'package:budgetapp/theme/colors.dart';
import 'package:budgetapp/widgets/chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  int activeMonth = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey!.withOpacity(0.01),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    DayMonth ob = new DayMonth();
    DateTime _date = DateTime.now();
    // int i = 0;
    // for (i = 1990; i <= 2090; i++) {
    //   for (int c = 0; c < 12; c++)
    //     ob.months.add({"label": i.toString(), "day": ob.Months[c]});
    List expenses = [
      {
        "icon": Icons.arrow_upward,
        "color": blue,
        "label": "Income",
        "cost": "\$6593.75"
      },
      {
        "icon": Icons.arrow_downward,
        "color": red,
        "label": "Expense",
        "cost": '\$6593.75'
      },
    ];
    return SingleChildScrollView(
      child: Column(
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
                  Text(
                    "Statistics",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  HorizontalCalendar(
                    date: _date,
                    initialDate:
                        DateTime.now().subtract(const Duration(days: 365 * 15)),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 55)),
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    selectedColor: primary,
                    showMonth: true,
                    onDateSelected: (date) {
                      if (kDebugMode) {
                        print(date.toString());
                      } //this date is just date.
                    },
                  ),
                  SizedBox(height: 25),
                  //ill have to create my own months calender here : custom.
                  // HorizontalCalendar(
                  //   date: DateTime.now().add(const Duration(days: 1)),
                  //   initialDate:
                  //       DateTime.now().subtract(const Duration(days: 2)),
                  //   textColor: Colors.black,
                  //   backgroundColor: Colors.white,
                  //   selectedColor: Colors.orange,
                  //   showMonth: true,
                  //   onDateSelected: (date) {
                  //     if (kDebugMode) {
                  //       print(date.toString());
                  //     }
                  //   },
                  // ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(ob.months.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              activeMonth = index;
                            });
                          },
                          child: Container(
                            width: (size.width - 50) / 6,
                            child: Column(
                              children: [
                                Text(
                                  ob.months[index]['label'],
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                      color: activeMonth == index
                                          ? primary
                                          : Colors.transparent,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: activeMonth == index
                                              ? primary
                                              : black.withOpacity(0.1))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 7, right: 12, left: 12),
                                    child: Text(
                                      ob.months[index]['day'],
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: activeMonth == index
                                              ? white
                                              : black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: grey!.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Net Balance",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: black.withOpacity(0.3),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$2446.90",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: size.width - 20,
                        height: 150,
                        child: LineChart(
                            mainData()), //bar and pie chart must be shown : //charts_flutter: /fl_chart
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Wrap(
              spacing: 20,
              children: List.generate(expenses.length, (index) {
                return Container(
                  width: (size.width - 60) / 2,
                  height: 170,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: grey!.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3)
                      ]),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: expenses[index]['color'],
                              shape: BoxShape.rectangle),
                          child: Center(
                            child: Icon(
                              expenses[index]['icon'],
                              color: white,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              expenses[index]['label'],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: white.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              expenses[index]['cost'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}

//Starting this after daily page. : last thing.
