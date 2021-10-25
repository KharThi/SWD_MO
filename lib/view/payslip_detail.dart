import 'package:flutter/material.dart';
import 'package:test/model/PaySlipDetails.dart';
import 'package:test/resource/payroll_system_provider.dart';

import 'home.dart';

class PaySlipDetail extends StatefulWidget {
  //final PaySlipDetails paySlipDetails;
  final int id;

  const PaySlipDetail({Key? key, required this.id}) : super(key: key);

  @override
  _PaySlipDetailState createState() => _PaySlipDetailState(this.id);
}

class _PaySlipDetailState extends State<PaySlipDetail> {
  //PaySlipDetails paySlipDetails;
  int id;
  //late final Size size;

  _PaySlipDetailState(this.id);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.grey],
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

              },
              child: Container(
                height: 45,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black26, Colors.black12],
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
                  //cho nay nen back lai chu kh tao widget homepage moi
                    builder: (mainContext) => HomePage()));
              },
              child: Container(
                height: 45,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.grey, Colors.black12],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                child: Icon(Icons.home_outlined),
              ),
            ),
            new GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return PaySlipDetail(id: 3);
                  }));
                },
                child: Container(
                  height: 45,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black, Colors.grey],
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
              print('lỗi đây nè '+snapshot.error.toString());
            }if(snapshot.hasData){
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
                              colors: [Colors.black, Colors.grey],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Hi Uishopy!',
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
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 70, 0, 5),
                      child: Card(
                        color: Colors.white,
                        elevation: 2.0,
                        child: ListTile(
                          title: Text(snapshot.data!.id.toString()),
                          subtitle: Text('snapshot.data![index].email'),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.white,
                        elevation: 2.0,
                        child: ListTile(
                          title: Text(snapshot.data!.employee!.fullname.toString()),
                          subtitle: Text('snapshot.data![index].email'),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.white,
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('snapshot.data![index].name'),
                          subtitle: Text('snapshot.data![index].email'),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Card(
                        color: Colors.white,
                        elevation: 2.0,
                        child: ListTile(
                          title: Text('snapshot.data![index].name'),
                          subtitle: Text('snapshot.data![index].email'),
                          onTap: () {

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );

            }else{
              return Container();
            }
          },
        )
      );
  }
}
