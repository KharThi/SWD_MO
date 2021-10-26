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
                      title: Text('Your Payslip In '+snapshot.data![index].payDate),
                      subtitle: Text('Total: '+snapshot.data![index].totalPayrollCost.toString()),
                      onTap: () {
                          _navigationToPaySlipDetail(snapshot.data[index].paySlipDetailId);
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
  void _navigationToPaySlipDetail(int id) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return PaySlipDetail(id: id);
    }));
  }

}