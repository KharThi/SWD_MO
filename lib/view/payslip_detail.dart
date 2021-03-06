import 'package:flutter/material.dart';
import 'package:test/model/PaySlipDetails.dart';
import 'package:test/resource/payroll_system_provider.dart';
import 'package:test/view/payslip.dart';

import 'feedback.dart';
import 'feedback_history.dart';
import 'home.dart';

class PaySlipDetail extends StatefulWidget {
  //final PaySlipDetails paySlipDetails;
  final int id;

  const PaySlipDetail({Key? key, required this.id}) : super(key: key);

  @override
  _PaySlipDetailState createState() => _PaySlipDetailState(this.id);
}

class _PaySlipDetailState extends State<PaySlipDetail> {
  int id;
  int? empID;

  _PaySlipDetailState(this.id);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.yellow[50],
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.amberAccent],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
        ),
        bottomNavigationBar: Row(
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => FeedbackHistory()
                ));
              },
              child: Container(
                height: 45,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.lime, Colors.amberAccent],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: Icon(Icons.history_outlined),

              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => HomePage()
                ));
              },
              child: Container(
                height: 45,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.limeAccent, Colors.lime],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: Icon(Icons.home_outlined),
              ),
            ),
            new GestureDetector(
                onTap: () {


                },
                child: Container(
                  height: 45,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.limeAccent],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                  child: Icon(Icons.notifications_active_outlined),

                )
            )
          ],
        ),
        body:FutureBuilder<PaySlipDetails>(
          future: PayrollProvider.fetchPaySlipDetailById(this.id),
          builder: (context, snapshot){
            if(snapshot.hasError){
              print('l???i ????y n?? '+snapshot.error.toString());
            }if(snapshot.hasData){
              // paySlipID=snapshot.data!.paySlipId;
              empID=snapshot.data!.employeeId;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            left: 1,
                            right: 1,
                            bottom: 36 + 1,
                          ),
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                              bottomRight: Radius.circular(36),
                            ),
                            gradient: LinearGradient(
                              colors: [Colors.greenAccent, Colors.amberAccent],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '    Hi '+snapshot.data!.employee!.fullname.toString(),
                                style: Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Colors.lime,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'TOTAL',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(210, 0, 0, 0),
                                  child: Text(
                                    "VND "+ snapshot.data!.grossPay.toString(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 70, 0, 5),
                      child: Card(
                        color: Colors.lime[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Working Hours'),
                          subtitle: Text(snapshot.data!.workingHours.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.yellow[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Overtime Working Hours'),
                          subtitle: Text(snapshot.data!.overtimeWorkingHours.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.lime[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Doubletime Working Hours'),
                          subtitle: Text(snapshot.data!.doubletimeWorkingHours.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.yellow[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Hours Off'),
                          subtitle: Text(snapshot.data!.hoursOff.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.lime[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Gross Pay'),
                          subtitle: Text(snapshot.data!.grossPay.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.yellow[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Benefit'),
                          subtitle: Text(snapshot.data!.benefit.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.lime[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Deduction'),
                          subtitle: Text(snapshot.data!.deduction.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.yellow[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Bonus'),
                          subtitle: Text(snapshot.data!.bonus.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.lime[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Tax'),
                          subtitle: Text(snapshot.data!.tax.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.yellow[100],
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('Net Pay'),
                          subtitle: Text(snapshot.data!.netPay.toString()),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );

            }else{
              return Center(child: CircularProgressIndicator(color: Colors.amberAccent,));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(
                builder: (mainContext) => FeebackPage(paySlipID: paySlipID, empID: empID!.toInt(),)));
          },
          child: Icon(Icons.feedback_outlined),
          backgroundColor: Colors.lightGreenAccent,
        ),
      );
  }
}
