
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/resource/google_sign_in.dart';
import 'package:test/resource/payroll_system_provider.dart';
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
  Widget build(BuildContext mainContext) {
    var container;
    final user = FirebaseAuth.instance.currentUser;

    String token;

    user!.getIdToken().then((result) {
      token = result.toString();
      while (token.length > 0) {
        int initLength = (token.length >= 500 ? 500 : token.length);
        print(token.substring(0, initLength));
        int endLength = token.length;
        token = token.substring(initLength, endLength);
      }
    });

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
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle,
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

            },
            child: Container(
              height: 45,
              width: MediaQuery
                  .of(mainContext)
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
                    .of(mainContext)
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

  void _showAlertDialogLogout() {
    final user = FirebaseAuth.instance.currentUser;
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            CupertinoAlertDialog(
              title: Text('Confirm To Logout!'),
              content: Text(
                  'Do you want to logout, '+user!.displayName.toString()+'?'
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text('No'),
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text('Yes'),
                  textStyle: TextStyle(color: Colors.red),
                  isDefaultAction: true,
                  onPressed: () {
                    final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.logout();
                  },
                ),
              ],
            ),
    );
  }
}
  enum DrawerSections
  {
  payslip,
  information_details,
  settings,
  privacy_policy,
  log_out,
}

