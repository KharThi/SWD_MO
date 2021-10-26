import 'Employee.dart';

class PaySlipDetails {
  late int id;
  late int paySlipId;
  late int employeeId;
  late int workingHours;
  late int overtimeWorkingHours;
  late int doubletimeWorkingHours;
  late int hoursOff;
  late int grossPay;
  late double benefit;
  late int deduction;
  late int bonus;
  late int tax;
  late int netPay;
  Employee? employee;
  //late PaySlip paySlip;

  PaySlipDetails(
      {required this.id,
        required this.paySlipId,
        required this.employeeId,
        required this.workingHours,
        required this.overtimeWorkingHours,
        required this.doubletimeWorkingHours,
        required this.hoursOff,
        required this.grossPay,
        required this.benefit,
        required this.deduction,
        required this.bonus,
        required this.tax,
        required this.netPay,
        required this.employee,
        //this.paySlip
      });
  PaySlipDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paySlipId = json['paySlipId'];
    employeeId = json['employeeId'];
    workingHours = json['workingHours'];
    overtimeWorkingHours = json['overtimeWorkingHours'];
    doubletimeWorkingHours = json['doubletimeWorkingHours'];
    hoursOff = json['hoursOff'];
    grossPay = json['grossPay'];
    benefit = json['benefit'];
    deduction = json['deduction'];
    bonus = json['bonus'];
    tax = json['tax'];
    netPay = json['netPay'];
/*    employee = (json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null)!;*/
    if (json['employee'] != null) {
      employee=Employee.fromJson(json['employee']);
    }
    /*paySlip =
    json['paySlip'] != null ? new PaySlip.fromJson(json['paySlip']) : null;*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paySlipId'] = this.paySlipId;
    data['employeeId'] = this.employeeId;
    data['workingHours'] = this.workingHours;
    data['overtimeWorkingHours'] = this.overtimeWorkingHours;
    data['doubletimeWorkingHours'] = this.doubletimeWorkingHours;
    data['hoursOff'] = this.hoursOff;
    data['grossPay'] = this.grossPay;
    data['benefit'] = this.benefit;
    data['deduction'] = this.deduction;
    data['bonus'] = this.bonus;
    data['tax'] = this.tax;
    data['netPay'] = this.netPay;
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    /*if (this.paySlip != null) {
      data['paySlip'] = this.paySlip.toJson();
    }*/
    return data;
  }
}