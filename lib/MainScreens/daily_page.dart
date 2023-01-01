import 'package:budgetapp/FireBaseOperations/write_read.dart';
import 'package:budgetapp/json/daily_json.dart';
import 'package:budgetapp/json/day_month.dart';
import 'package:budgetapp/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({super.key});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 3;
  DateTime _date = DateTime.now();
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
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                  color: grey!.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 3)
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, bottom: 25, right: 20, left: 20),
              child: Column(
                children: [
                  const Text(
                    "Daily Transaction",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                  const SizedBox(height: 12),
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
                  // Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: List.generate(days.length, (index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             activeDay = index;
                  //           });
                  //         },
                  //         child: Container(
                  //           width: (size.width - 40) / 7,
                  //           child: Column(
                  //             children: [
                  //               Text(
                  //                 days[index]['label'],
                  //                 style: TextStyle(fontSize: 10),
                  //               ),
                  //               SizedBox(height: 10),
                  //               Container(
                  //                 width: 30,
                  //                 height: 30,
                  //                 decoration: BoxDecoration(
                  //                     color: activeDay == index
                  //                         ? primary
                  //                         : Colors.transparent,
                  //                     shape: BoxShape.circle,
                  //                     border: Border.all(
                  //                         color: activeDay == index
                  //                             ? primary
                  //                             : black.withOpacity(0.1))),
                  //                 child: Center(
                  //                   child: Text(
                  //                     days[index]['day'],
                  //                     style: TextStyle(
                  //                         fontSize: 10,
                  //                         fontWeight: FontWeight.w600,
                  //                         color: activeDay == index
                  //                             ? white
                  //                             : black),
                  //                   ),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     }))
                ],
              ),
            ),
          ),
          //SizedBox(height: 12),
          DailyTrans(_date),
          // StreamBuilder(
          //   stream: readTrans(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       return Text('Something went Wrong! ${snapshot.error}');
          //     } else if (snapshot.hasData) {
          //       final tran = snapshot.data!;
          //       return ListView(
          //         scrollDirection: Axis.vertical,
          //         shrinkWrap: true,
          //         children: tran.map(buildTrans).toList(),
          //       );
          //     } else {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
          // Padding(
          //     padding: const EdgeInsets.only(left: 20, right: 20),
          //     child: Column(
          //       children: List.generate(daily.length, (index) {
          //         return Column(
          //           children: [
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   width: (size.width - 40) * 0.7,
          //                   child: Row(
          //                     children: [
          //                       Container(
          //                         width: 50,
          //                         height: 50,
          //                         decoration: BoxDecoration(
          //                             color: grey!.withOpacity(0.4),
          //                             shape: BoxShape.circle),
          //                         child: Center(
          //                           child: Image.asset(
          //                             daily[index]['icon'],
          //                             //color: Colors.deepPurple,
          //                             width: 30,
          //                             height: 30,
          //                           ),
          //                         ),
          //                       ),
          //                       SizedBox(width: 15),
          //                       Container(
          //                         width: (size.width - 90) * 0.5,
          //                         child: Column(
          //                           mainAxisAlignment: MainAxisAlignment.center,
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           children: [
          //                             Text(
          //                               daily[index]['name'],
          //                               style: TextStyle(
          //                                   fontSize: 15,
          //                                   color: black,
          //                                   fontWeight: FontWeight.w500),
          //                             ),
          //                             SizedBox(height: 5),
          //                             Text(
          //                               daily[index]['date'],
          //                               style: TextStyle(
          //                                 fontSize: 12,
          //                                 color: black,
          //                                 fontWeight: FontWeight.w400,
          //                               ),
          //                             )
          //                           ],
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //                 Container(
          //                   width: (size.width - 40) * 0.3,
          //                   child: Row(
          //                     mainAxisAlignment: MainAxisAlignment.end,
          //                     children: [
          //                       Text(
          //                         daily[index]['price'],
          //                         style: TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.w600,
          //                             color: primary),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 65, top: 8),
          //               child: Divider(thickness: 0.8),
          //             )
          //           ],
          //         );
          //       }),
          //     )),
          //Others must not be included here :
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Text("Total",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: black.withOpacity(0.4))),
                ),
                Spacer(),
                Text("\$1780.00",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget DailyTrans(DateTime _date) {
    return StreamBuilder(
      stream: readTrans(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went Wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final tran = snapshot.data!;
          final time = DateTime.parse(tran[0].date.toString());
          return ListView(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: tran.map(buildTrans).toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Stream<List<transaction>> readTrans() => FirebaseFirestore.instance
      .collection('Transaction')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => transaction.fromJson(doc.data()))
          .toList());

  Widget buildTrans(transaction trans) {
    String t = trans.type.toString();
    int index = 0;
    while (index < daily.length) {
      if ((daily[index++]['name'].compareTo(t)) == 0) break;
    }
    index--;
    DateTime d = trans.date;
    // print(d);
    // print(_date);
    // if (d == _date) {
    return Card(
      elevation: 4,
      child: (ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: grey!.withOpacity(0.5), shape: BoxShape.circle),
          child: ClipOval(
            //borderRadius: BorderRadius.circular(30),
            child: SizedBox.fromSize(
              size: Size.fromRadius(18),
              child: Image.asset(
                daily[index]['icon'],
                fit: BoxFit.cover,
                //color: Colors.deepPurple,
                width: 25,
                height: 25,
              ),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${trans.type}',
                style: TextStyle(fontWeight: FontWeight.w500)),
            Text('${trans.amt}')
          ],
        ),
        subtitle: Text(trans.date.toString().substring(0, 16),
            style: TextStyle(fontWeight: FontWeight.w500)),
        //have to disp : cost .
      )),
    );
    // } else {
    //   return Text("");
    // }
  }
}


//Redesign entirely : Each of those list items. with the color scheme which was chosen : + u gotta add the pics fr each : this will be a task.
//On selecting the horizontal calender date : we must display the trans on that day only : +the prev design of all the things : must also be kept in mind. 
//Later i can add  : edit/delete feature fr this  shit.
