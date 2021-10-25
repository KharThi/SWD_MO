import 'package:flutter/material.dart';
import 'package:test/model/Employee.dart';
import 'package:test/resource/payroll_system_provider.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          color: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
                'Proxyclick SA, having its registered office at 1150 Brussels, '
               ' rue Saint-Hubert 17, registered in the Belgian Crossroads Bank for Enterprises under number 0863.261.693 and any '
               ' of its affiliates (hereinafter “Proxyclick”, “we”, “our”, “us”), is the data controller for the processing of your personal '
               ' data and PII collected via the Website and other communication channels (such as email or calls), and for the processing carried out '
               ' when you subscribe to and/or use our Services and so so provide us with information (e.g. when creating your account). Thus, Proxyclick '
               ' will only be the data controller for the processing of personal data and PII for its own purposes, such as the processing of personal data'
               ' of our (potential) customers in relation to sales, product feedback, service delivery, invoicing, customer relationship management and direct'
                'marketing.If you are a User, other than the Administrator User, of our Services (e.g. you are an employee or a visitor of one of our Clients),'
                'our Client will be the data controller and Proxyclick will be acting as its Client’s data processor. In such case, the Client is the one '
                'assuming responsibility for the processing of personal data through our Services. To learn more about the data processing operations of our '
                'Clients and to enforce your rights related to their processing operations please consult the relevant privacy policies of the relevant Clients"',
              style: TextStyle(fontSize: 20,),
            )
          ),
        ),
      ),
    );
  }
}
