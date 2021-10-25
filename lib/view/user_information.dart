import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/model/Employee.dart';
import 'package:test/resource/payroll_system_provider.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final user = FirebaseAuth.instance.currentUser;
  late var gender;
  late String email=user!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              labelInfor('General Information', Icons.info_outline),
              Padding(
               padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
               child: Card(
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
                           return Container(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(height: 15),
                                 Text(
                                   ' StaffID: '+'${snapshot.data!.id}',
                                   style: TextStyle(fontSize: 22, color: Colors.black),
                                 ),
                                 SizedBox(height: 15),
                                 Text(
                                   ' Fullname: '+ "${snapshot.data!.fullname}",
                                   style: TextStyle(fontSize: 22, color: Colors.black),
                                 ),
                                 SizedBox(height: 15),
                                 Text(
                                   ' First Day At Work: '+"${snapshot.data!.firstDayAtWork}",
                                   style: TextStyle(fontSize: 22, color: Colors.black),
                                 ),
                                 SizedBox(height: 15),
                                 Text(
                                   ' Company: '+"${snapshot.data!.company.name}",
                                   style: TextStyle(fontSize: 22, color: Colors.black),
                                 ),
                                 SizedBox(height: 15),
                                 Text(
                                   ' Department: '+"${snapshot.data!.department.name}",
                                   style: TextStyle(fontSize: 22, color: Colors.black),
                                 ),
                                 SizedBox(height: 15),
                                 Text(
                                   ' Gender: '+ gender,
                                   style: TextStyle(fontSize: 22, color: Colors.black),
                                 ),
                                 SizedBox(height: 15),
                                 Text(
                                   ' Current Job: '+'DEVE',
                                   style: TextStyle(fontSize: 22, color: Colors.black),
                                 ),
                                 SizedBox(height: 15),
                               ],
                             ),
                           );
                         }else
                         {
                           return Center();
                         }
                       }
                   ),
                 )
               ),
             ),
              labelInfor('Contact Information', Icons.mail_outline),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 15),
                                    Text(
                                      ' Adress: '+'${snapshot.data!.company.address}',
                                      style: TextStyle(fontSize: 22, color: Colors.black),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      ' Phone: '+'${snapshot.data!.phoneNumber}',
                                      style: TextStyle(fontSize: 22, color: Colors.black),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      ' Email: '+'${snapshot.data!.workEmailAddress}',
                                      style: TextStyle(fontSize: 22, color: Colors.black),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                ),
                              );
                            }else
                            {
                              return Center();
                            }
                          }
                      ),
                    )
                ),
              )
            ],
          ),
      ),
    );
  }
Widget labelInfor(String title, IconData iconData)
{
  return Material(
    child: Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: Icon(
              iconData,
              size: 32,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}
