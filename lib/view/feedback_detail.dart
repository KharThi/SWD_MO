import 'package:flutter/material.dart';
import 'package:test/model/FeedBacks.dart';
import 'package:test/resource/payroll_system_provider.dart';

import 'feedback_history.dart';

final description = TextEditingController();
int paySlipId=0;
int empId=0;
String image = '';
var date = DateTime.now();

class FeedbackDetail extends StatelessWidget {
  const FeedbackDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: Text('FEEDBACK DETAIL',
            style: TextStyle(fontSize: 20, fontFamily: "Times New Roman")),
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
      body:SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<FeedBacks>(
                future: PayrollProvider.fetchFeedbackDetailById(fbId),
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    print('lỗi ở fb detail '+ snapshot.error.toString());
                  }
                  if(snapshot.hasData){
                    image = snapshot.data!.image;
                    paySlipId = snapshot.data!.paySlipId;
                    empId = snapshot.data!.employeeId;
                    print(empId);
                    return Column(
                      children: [
                        Column(
                          children: [
                            TextField(
                              maxLines: 10,
                              controller: description..text = snapshot.data!.desciption.toString(),
                              decoration: InputDecoration(
                                hintText: snapshot.data!.desciption,
                                hintStyle: TextStyle(
                                  fontSize: 13.0,
                                  color: Color(0xFFA6A6A6),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFE5E5E5),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 200,
                                width: 200,
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    image != '' ? Image.network(image, width: 70, height: 70)
                                        :  IconButton(onPressed: (){

                                    }, icon: Icon(Icons.add_a_photo_outlined))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 378,
                              child: FlatButton(
                                onPressed: () {
                                  try{
                                      Future<String> result =PayrollProvider.updateFeedback(new FeedBacks(id: fbId,
                                          desciption: description.text,
                                          paySlipId: paySlipId,
                                          employeeId: empId,
                                          createDate: date.toString(),
                                          image: image));
                                      result.then((value) => {
                                        Navigator.push(context, new MaterialPageRoute(
                                            builder: (context) => FeedbackHistory()))
                                      });
                                  }catch(e){
                                    print(e);
                                  }
                                  Navigator.pop(context) ;
                                },
                                child: Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                color: Colors.lime[200],
                                padding: EdgeInsets.all(16.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(color: Colors.amberAccent));
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
