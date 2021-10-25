import 'package:test/model/Department.dart';
import 'package:test/model/PaySlipDetails.dart';

import 'Company.dart';

class Employee {

 late int id;
 late int companyId;
 late int departmentId;
 late String fullname;
 late bool gender;
 late String firstDayAtWork;
 late String workEmailAddress;
 late String personalEmailAddress;
 late int salary;
 late bool salaryType;
 late int citizenIdentification;
 late String address;
 late int phoneNumber;
 late int taxCode;
 late int bankNumber;
 late bool paymentType;
 late Company company;
 late Department department;
 late List<PaySlipDetails> paySlipDetails;



  Employee(
      {required this.id,
        required this.companyId,
        required this.departmentId,
        required this.fullname,
        required this.gender,
        required this.firstDayAtWork,
        required this.workEmailAddress,
        required this.personalEmailAddress,
        required this.salary,
        required this.salaryType,
        required this.citizenIdentification,
        required this.address,
        required this.phoneNumber,
        required this.taxCode,
        required this.bankNumber,
        required this.paymentType,
        required this.company,
        required this.department,
        required this.paySlipDetails});

 Employee.fromJson(Map<String, dynamic> json) {
   id = json['id'];
   companyId = json['companyId'];
   departmentId = json['departmentId'];
   fullname = json['fullname'];
   gender = json['gender'];
   firstDayAtWork = json['firstDayAtWork'];
   workEmailAddress = json['workEmailAddress'];
   personalEmailAddress = json['personalEmailAddress'];
   salary = json['salary'];
   salaryType = json['salaryType'];
   citizenIdentification = json['citizenIdentification'];
   address = json['address'];
   phoneNumber = json['phoneNumber'];
   taxCode = json['taxCode'];
   bankNumber = json['bankNumber'];
   paymentType = json['paymentType'];
   company = Company.fromJson(json['company']);
   department = Department.fromJson(json['department']);
  /* if (json['paySlipDetails'] != null) {
     paySlipDetails = <PaySlipDetails>[];
     json['paySlipDetails'].forEach((v) {
       paySlipDetails.add(new PaySlipDetails());
     }*/

   }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['departmentId'] = this.departmentId;
    data['fullname'] = this.fullname;
    data['gender'] = this.gender;
    data['firstDayAtWork'] = this.firstDayAtWork;
    data['workEmailAddress'] = this.workEmailAddress;
    data['personalEmailAddress'] = this.personalEmailAddress;
    data['salary'] = this.salary;
    data['salaryType'] = this.salaryType;
    data['citizenIdentification'] = this.citizenIdentification;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['taxCode'] = this.taxCode;
    data['bankNumber'] = this.bankNumber;
    data['paymentType'] = this.paymentType;
    data['company'] = this.company;
    data['department'] = this.department;
    /*if (this.paySlipDetails != null) {
      data['paySlipDetails'] =
          this.paySlipDetails.map((v) => v!.toJson()).toList();
    }*/
    return data;
  }
}
