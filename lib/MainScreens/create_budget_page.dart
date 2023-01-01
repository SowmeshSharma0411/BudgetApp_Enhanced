import 'package:budgetapp/FireBaseOperations/write_read.dart';
import 'package:budgetapp/json/create_budget_json.dart';
import 'package:budgetapp/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

//More like createTrans page :
class CreateBudgetPage extends StatefulWidget {
  const CreateBudgetPage({super.key});

  @override
  State<CreateBudgetPage> createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  int activeCategory = 0;
  TextEditingController _budgetName = TextEditingController(text: "Shopping");
  TextEditingController _budgetCost = TextEditingController(text: "\$700");
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey!.withOpacity(0.05),
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
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                    color: grey!.withOpacity(0.01),
                    spreadRadius: 10,
                    blurRadius: 3)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, left: 20, right: 20, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New Transaction",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: black),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Choose Category",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5)),
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 150,
                      height: 170,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: activeCategory == index
                                ? primary
                                : Colors.transparent,
                            width: activeCategory == index ? 2 : 0),
                        borderRadius: BorderRadius.circular(12),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: grey!.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 25, bottom: 20, right: 25, top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: grey!.withOpacity(0.15),
                              ),
                              child: Center(
                                  child: Image.asset(
                                categories[index]['icon'],
                                width: 30,
                                height: 30,
                                fit: BoxFit.cover,
                              )),
                            ),
                            Text(categories[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Transaction Name",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: black.withOpacity(0.6)),
                ),
                TextField(
                  controller: _budgetName,
                  cursorColor: black,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Enter Budget Name"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width - 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cost",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: black.withOpacity(0.6)),
                          ),
                          TextField(
                            controller: _budgetCost,
                            cursorColor: black,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: black),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Cost"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(15)),
                      child: ElevatedButton(
                          onPressed: () {
                            final trans = transaction(
                                type: _budgetName.text,
                                amt: int.parse(_budgetCost.text),
                                date: DateTime.parse(_date.text));
                            createTrans(trans);
                          },
                          child: Icon(Icons.arrow_forward, color: white)),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: black.withOpacity(0.6)),
                  ),
                  DateTimeField(
                    controller: _date,
                    cursorColor: black,
                    format: DateFormat("yyyy-MM-dd HH:mm"),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: black),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Select Date"),
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(date, time);
                      } else {
                        return currentValue;
                      }
                    },
                  ),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }

  Future createTrans(transaction trans) async {
    final docTrans = FirebaseFirestore.instance.collection('Transaction').doc();
    trans.id = docTrans.id;

    final json = trans.toJson();
    await docTrans.set(json);
  }
}
