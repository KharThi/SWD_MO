import 'package:flutter/material.dart';
import 'package:test/model/PaySlip.dart';
import 'package:test/model/PaySlipDetails.dart';
import 'package:test/resource/payroll_system_provider.dart';
import 'package:test/view/home.dart';
import 'package:test/view/payslip_detail.dart';
import 'user_information.dart';

class PaySlipPage extends StatefulWidget {
  const PaySlipPage({Key? key}) : super(key: key);

  @override
  _PaySlipPageState createState() => _PaySlipPageState();
}

class _PaySlipPageState extends State<PaySlipPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: FutureBuilder(
            future: PayrollProvider.fetchPaySlips(1),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasError){
                print('Lỗi này nè: '+snapshot.error.toString());
              }
              if (!snapshot.hasData) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      title: Text(snapshot.data![index].id.toString()),
                      subtitle: Text(snapshot.data![index].payDate),
                      onTap: () {

                      },
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              );
            },
          ),
        )
    );
  }
  void _navigationToPaySlipDetail(PaySlipDetails paySlipDetails) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return PaySlipDetail(id: 3);
    }));
  }

}





















/*Column(
            children: <Widget>[
              Expanded(child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) =>
                     Container(
                       color: _selectedIndex != null && _selectedIndex == index
                           ? Colors.blueGrey
                           : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20 * 0.75),
                        child:
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      _onSelected(index),
                                      Navigator.push(context, new MaterialPageRoute(
                                          builder: (context) => UserInformation()))
                                    },
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.email),
                                        Text("From...", style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500
                                        ),
                                        ),
                                        SizedBox(height: 8),

                                        Opacity(
                                          opacity: 0.64,
                                          child: Text(
                                            "Your payslip details in ... month",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                       ),
                     )
                    ),
            ]
        )*/