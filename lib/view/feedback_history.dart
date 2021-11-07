import 'package:flutter/material.dart';
import 'package:test/resource/payroll_system_provider.dart';
import 'package:test/view/feedback_detail.dart';
import 'package:test/view/home.dart';
import 'package:test/view/user_information.dart';

class FeedbackHistory extends StatefulWidget {
  const FeedbackHistory({Key? key}) : super(key: key);

  @override
  _FeedbackHistoryState createState() => _FeedbackHistoryState();
}
late int fbId;

class _FeedbackHistoryState extends State<FeedbackHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: Text('HISTORY',
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
      body: Container(
        child: FutureBuilder(
          future: PayrollProvider.fetchFeedback(2),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasError){
              print('Lỗi này ở historypage: '+snapshot.error.toString());
            }
            if (!snapshot.hasData) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(color: Colors.amberAccent),
                ),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                fbId = snapshot.data[index].id;
                return Card(
                  color: Colors.yellow[100],
                  elevation: 2.0,
                  child: ListTile(
                    title: Text(snapshot.data![index].desciption),
                    subtitle: Text(snapshot.data![index].createDate),
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => FeedbackDetail()
                      ));
                    },
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                );
              },
            );
          },
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
    );
  }
}
