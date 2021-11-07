
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/resource/google_sign_in.dart';
import 'package:test/resource/payroll_system_provider.dart';
import 'package:test/view/feedback_history.dart';
import 'package:test/view/login.dart';
import 'package:test/view/payslip.dart';
import 'package:test/view/payslip_detail.dart';
import 'package:test/view/privacy_policy.dart';
import 'package:test/view/user_information.dart';

import 'drawer_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.payslip;
  var appbarTitle;

  @override
  Widget build(BuildContext context) {
    var container;
    final user = FirebaseAuth.instance.currentUser;

    // String token;
    //
    // user!.getIdToken().then((result) {
    //   token = result.toString();
    //   while (token.length > 0) {
    //     int initLength = (token.length >= 500 ? 500 : token.length);
    //     print(token.substring(0, initLength));
    //     int endLength = token.length;
    //     token = token.substring(initLength, endLength);
    //   }
    // });

    if (currentPage == DrawerSections.payslip) {
      container = PaySlipPage();
      appbarTitle = 'Hello ' + user!.displayName.toString() + '!';
    } else if (currentPage == DrawerSections.information_details) {
      container = UserInformation();
      appbarTitle = 'YOUR INFORMATION';
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPolicy();
      appbarTitle = 'PRIVACY POLICY';
    }
    return  Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle,
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
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
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
                  builder: (context) => HomePage()));
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
      body: container,
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(
              1, "Information Details", Icons.supervised_user_circle_rounded,
              currentPage == DrawerSections.information_details ? true : false),
          menuItem(2, "Setting", Icons.settings,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(3, "Privacy Policy", Icons.privacy_tip_sharp,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(4, "Log Out", Icons.logout,
              currentPage == DrawerSections.log_out ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    //thêm multi provider dzo chổ này thử
    return Material(
      color: selected ? Colors.black26 : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.information_details;
            } else if (id == 2) {
              currentPage = DrawerSections.settings;
            } else if (id == 3) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 4) {
              //currentPage = DrawerSections.log_out;
              final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
              // _showAlertDialogLogout(context);
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Widget _showAlertDialogLogout(BuildContext context) {
  //   final user = FirebaseAuth.instance.currentUser;
  //   return ChangeNotifierProvider(
  //       create: (context) => GoogleSignInProvider(),
  //       child: Container(
  //         child: ,
  //       ),
  //   );
  // }
}
  enum DrawerSections
  {
  payslip,
  information_details,
  settings,
  privacy_policy,
  log_out,
}
