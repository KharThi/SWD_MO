import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test/model/FeedBacks.dart';
import 'package:test/resource/payroll_system_provider.dart';
import 'package:test/view/home.dart';

import 'feedback_history.dart';

class FeebackPage extends StatefulWidget {
  final int paySlipID;
  final int empID;
  const FeebackPage({Key? key, required this.paySlipID, required this.empID}) : super(key: key);

  @override
  _FeebackPageState createState() => _FeebackPageState(this.paySlipID, this.empID);
}

class _FeebackPageState extends State<FeebackPage> {
  int paySlipID;
  int empID;
  List<bool> isTypeSelected = [false, false, false, false, false];
  String isTitle='';
  final description = TextEditingController();
  var date = DateTime.now();
  String currentDate = '';
  List<File> _image = [];
  final _picker = ImagePicker();
  CollectionReference? imgRef;
  firebase_storage.Reference? ref;
  double val = 0;
  int isSelected=0;
  int num1 = 1;
  int num2 = 2;
  int num3 = 3;
  int num4 = 4;
  int num5 = 5;

  _FeebackPageState(this.paySlipID, this.empID);

  chooseImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image.add(File(pickedFile!.path));
    });
  }
  Future uploadImage() async {
    int i = 1;
    for(var img in _image) {
      val = i / _image.length;
      if (img != null) {
        //Upload to Firebase
        ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('images/${Path.basename(img.path)}');

        await ref!.putFile(img).whenComplete(() async {
          await ref!.getDownloadURL().then((value) {
            imgRef!.add({'url': value});
            i++;
          });
        });

      } else {
        print('No Path Received');
      }
    }
  }
  @override
  void initState() {
    super.initState();
    imgRef = FirebaseFirestore.instance.collection('imageURLs');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: Text('FEEDBACK',
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
                    color: Color(0xFFA5A5A5),
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
                    isSelected = num1;
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Day off trouble", isSelected: isTypeSelected[1]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[1] = !isTypeSelected[1];
                    });
                    isSelected = num2;
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Working hours trouble", isSelected: isTypeSelected[2]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[2] = !isTypeSelected[2];
                    });
                    isSelected = num3;
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Other issues", isSelected: isTypeSelected[3]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[3] = !isTypeSelected[3];
                    });
                    isSelected = num4;
                  },
                ),
                GestureDetector(
                  child: buildCheckItem(
                      title: "Suggestions", isSelected: isTypeSelected[4]),
                  onTap: () {
                    setState(() {
                      isTypeSelected[4] = !isTypeSelected[4];
                    });
                    isSelected = num5;
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
                        onPressed: () {
                          isSelected == 1 ? isTitle = 'Overtime working trouble'
                              : isSelected == 2 ? isTitle = 'Day off trouble'
                              : isSelected == 3 ? isTitle = 'Working hours trouble'
                              : isSelected == 4 ? isTitle = 'Other issues'
                              : isSelected == 5 ? isTitle = 'Suggestions' : '';
                          try{
                            String? img;
                            currentDate = '${date.day}-${date.month}-${date.year}';
                            uploadImage().whenComplete((){
                              Stream<QuerySnapshot<Map<String, dynamic>>> snapshot = FirebaseFirestore.instance.collection('imageURLs').snapshots();
                              snapshot.forEach((element) {
                                img = element.docs[0].get('url');
                                // element.docs.forEach((e) {
                                //   img.add(e.get('url'));
                                // });
                                print('ngày đây nè '+ currentDate);
                                Future<String> result=PayrollProvider.createFeedback(new FeedBacks(id: 0,
                                    desciption: 'isTitle++description.text',
                                    paySlipId: 4,
                                    employeeId: 2,
                                    createDate: "7-11-2021",
                                    image: "https://i.pinimg.com/736x/5e/79/b6/5e79b699cc020bad76dfdbb0297bae8f.jpg"));
                                result.then((value) => {
                                  print(value)
                                  // Navigator.pop(context)
                                });
                              });
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
                )
              ],
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
    );
  }
  buildFeedbackForm() {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              maxLines: 10,
              controller: description,
              decoration: InputDecoration(
                hintText: "Please briefly describe the issue",
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
                child: GridView.builder(
                    itemCount: _image.length + 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Center(
                        child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => chooseImage()),
                      )
                          : Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(_image[index - 1]),
                                fit: BoxFit.cover)),
                      );
                    }),
              ),
            )
          ],
        ),
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
            color: isSelected ? Colors.greenAccent : Colors.amber[200],
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.greenAccent : Colors.amber[200]
            ),
          ),
        ],
      ),
    );
  }
}
