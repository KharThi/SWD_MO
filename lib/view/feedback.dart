import 'package:flutter/material.dart';

class FeebackPage extends StatefulWidget {
  const FeebackPage({Key? key}) : super(key: key);

  @override
  _FeebackPageState createState() => _FeebackPageState();
}

class _FeebackPageState extends State<FeebackPage> {
  List<bool> isTypeSelected = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FEEDBACK',
            style: TextStyle(fontSize: 20, fontFamily: "Times New Roman")),
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
      body: Container(
          child:  Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Please select the type of the feedback",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 25.0),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Overtime working trouble", isSelected: isTypeSelected[0]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[0] = !isTypeSelected[0];
                    });
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Day off trouble", isSelected: isTypeSelected[1]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[1] = !isTypeSelected[1];
                    });
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Working hours trouble", isSelected: isTypeSelected[2]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[2] = !isTypeSelected[2];
                    });
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Other issues", isSelected: isTypeSelected[3]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[3] = !isTypeSelected[3];
                    });
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Suggestions", isSelected: isTypeSelected[4]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[4] = !isTypeSelected[4];
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                buildFeedbackForm(),
                SizedBox(height: 20.0),
                Spacer(),
                Row(
                  children: [
                    SizedBox(
                      width: 378,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.grey,
                        padding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ],
                )
              ],
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
              Navigator.pop(context);
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
                Navigator.pop(context);
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
    );
  }
  buildFeedbackForm() {
    return Container(
      height: 300,
      child: Stack(
        children: [
          TextField(
            maxLines: 50,
            decoration: InputDecoration(
              hintText: "Please briefly describe the issue",
              hintStyle: TextStyle(
                fontSize: 13.0,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE5E5E5),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Color(0xFFA6A6A6),
                  ),
                ),
              ),
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFE5E5E5),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFA5A5A5),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Upload screenshot (optional)",
                    style: TextStyle(
                      color: Color(0xFFC5C5C5),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCheckItem({required String title, required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.check_circle : Icons.circle,
            color: isSelected ? Colors.black26 : Colors.grey,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.grey),
          ),
        ],
      ),
    );
  }
}
