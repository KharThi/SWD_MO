import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/model/Employee.dart';
import 'package:test/resource/payroll_system_provider.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}
int empID = 0;

class _UserInformationState extends State<UserInformation> {
  final user = FirebaseAuth.instance.currentUser;
  late var gender;
  late String email=user!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                labelInfor('General Information', Icons.info_outline),
                Padding(
                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: FutureBuilder<Employee>(
                       future: PayrollProvider.fetchEmployeeByEmail(email),
                       builder: (context, snapshot)
                       {
                         if(snapshot.hasError) {
                           print(snapshot.error);
                         }
                         if(snapshot.hasData)
                         {
                           gender = (snapshot.data!.gender)?'Male':'Female';
                           empID = snapshot.data!.id;
                           return Container(
                             child: Column(
                              children: [
                                buildText('Your ID'),
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.green, width: 1),
                                    ),
                                    hintText: '${snapshot.data!.id}',
                                      hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                  ),
                                  readOnly: true,
                                ),
                                buildText('Fullname'),
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.green, width: 1),
                                    ),
                                      hintText: '${snapshot.data!.fullname}',
                                      hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                  ),
                                  readOnly: true,
                                ),
                                buildText('First Day At Work'),
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.green, width: 1),
                                    ),
                                      hintText: '${snapshot.data!.firstDayAtWork}',
                                      hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                  ),
                                  readOnly: true,
                                ),
                                buildText('Company'),
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.green, width: 1),
                                    ),
                                      hintText: '${snapshot.data!.company.name}',
                                      hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                  ),
                                  readOnly: true,
                                ),
                                buildText('Department'),
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.green, width: 1),
                                    ),
                                      hintText: '${snapshot.data!.department.name}',
                                      hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                  ),
                                  readOnly: true,
                                ),
                                buildText('Gender'),
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.green, width: 1),
                                    ),
                                      hintText: gender,
                                      hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                  ),
                                  readOnly: true,
                                ),
                                buildText('Current Job'),
                                TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.black, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(color: Colors.green, width: 1),
                                    ),
                                      hintText: 'Dev0',
                                      hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                  ),
                                  readOnly: true,
                                ),
                              ],
                             ),
                           );
                         }else
                         {
                           return Center(child: CircularProgressIndicator(color: Colors.lime));
                         }
                       }
                   ),
                 ),
               ),
                labelInfor('Contact Information', Icons.mail_outline),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder<Employee>(
                        future: PayrollProvider.fetchEmployeeByEmail(email),
                        builder: (context, snapshot)
                        {
                          if(snapshot.hasError)
                            print(snapshot.error);
                          if(snapshot.hasData)
                          {
                            return Container(
                              child: Column(
                                children: [
                                  buildText('Address'),
                                  TextField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.black, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.green, width: 1),
                                      ),
                                        hintText: '${snapshot.data!.address}',
                                        hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                    ),
                                    readOnly: true,
                                  ),
                                  buildText('Phone'),
                                  TextField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.black, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.green, width: 1),
                                      ),
                                        hintText: '${snapshot.data!.phoneNumber}',
                                        hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                    ),
                                    readOnly: true,
                                  ),
                                  buildText(' Email'),
                                  TextField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.black, width: 1),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.green, width: 1),
                                      ),
                                        hintText: '${snapshot.data!.workEmailAddress}',
                                        hintStyle: TextStyle(fontFamily: 'Times New Roman',color: Colors.lightGreen[800])
                                    ),
                                    readOnly: true,
                                  ),
                                ]
                              ),
                            );
                          }else
                          {
                            return Center(child: CircularProgressIndicator(color: Colors.lime));
                          }
                        }
                    ),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
Widget labelInfor(String title, IconData iconData)
{
  return Material(
    color: Colors.yellow[50],
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              iconData,
              size: 32,
              color: Colors.lightGreen[800],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.lightGreen[800],
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Times New Roman'
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget buildText(String text) => Container(
    margin: EdgeInsets.fromLTRB(0, 24, 0, 8),
    child: Text(
      text,
      style: TextStyle(fontSize: 20,fontFamily: 'Times New Roman',color: Colors.lightGreen[800]),
      textAlign: TextAlign.left,
    ),
  );
}
