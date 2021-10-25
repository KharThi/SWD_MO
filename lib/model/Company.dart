
import 'package:test/model/Department.dart';
import 'package:test/model/Employee.dart';

class Company {
  late int id;
  late String name;
  late String address;
  late String taxCode;
  late List<Employee> employees;
  late List<String> industries;
  late List<String> legalStructures;
  late List<String> managePayrolls;
  late List<String> paySchedules;

  Company(
      { required this.id,
        required this.name,
        required this.address,
        required this.taxCode,
        required this.employees,
        required this.industries,
        required this.legalStructures,
        required this.managePayrolls,
        required this.paySchedules});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    taxCode = json['taxCode'];
    if (json['employees'] != null) {
      employees = <Employee>[];
      json['employees'].forEach((v) {
        employees.add(new Employee.fromJson(v));
      });
    }
    if (json['industries'] != null) {
      industries = <String>[];
      json['industries'].forEach((v) {
        industries.add(new String.fromCharCode(0));
      });
    }
    if (json['legalStructures'] != null) {
      legalStructures = <String>[];
      json['legalStructures'].forEach((v) {
        legalStructures.add(new String.fromCharCode(0));
      });
    }
    if (json['managePayrolls'] != null) {
      managePayrolls = <String>[];
      json['managePayrolls'].forEach((v) {
        managePayrolls.add(new String.fromCharCode(0));
      });
    }
    if (json['paySchedules'] != null) {
      paySchedules = <String>[];
      json['paySchedules'].forEach((v) {
        paySchedules.add(new String.fromCharCode(0));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['taxCode'] = this.taxCode;
    if (this.employees != null) {
      data['employees'] = this.employees.map((v) => v.toJson()).toList();
    }
    if (this.industries != null) {
      data['industries'] = this.industries.map((v) => v.toString()).toList();
    }
    if (this.legalStructures != null) {
      data['legalStructures'] =
          this.legalStructures.map((v) => v.toString()).toList();
    }
    if (this.managePayrolls != null) {
      data['managePayrolls'] =
          this.managePayrolls.map((v) => v.toString()).toList();
    }
    if (this.paySchedules != null) {
      data['paySchedules'] = this.paySchedules.map((v) => v.toString()).toList();
    }
    return data;
  }
}