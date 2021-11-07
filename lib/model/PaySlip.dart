
import 'Employee.dart';
import 'FeedBacks.dart';
import 'PaySlipDetails.dart';

class PaySlip {
  late int id;
  late String payDate;
  late String payPeriodBeginDate;
  late String payPeriodEndDate;
  late int payStatusId;
  late var totalPayrollCost;
  late var totalNetPayroll;
  late int totaltax;
  late int employeeId;
/*  late Employee employee;*/
  late int paySlipDetailId;
/*  late PayStatus payStatus;*/
  late List<FeedBacks> feedBacks;
  PaySlipDetails? paySlipDetails;

  PaySlip(
      { required this.id,
        required this.payDate,
        required this.payPeriodBeginDate,
        required this.payPeriodEndDate,
        required this.payStatusId,
        required this.totalPayrollCost,
        required this.totalNetPayroll,
        required this.totaltax,
        required this.employeeId,
/*        required this.employee,*/
        required this.paySlipDetailId,
        //this.payStatus,
        required this.feedBacks,
        required this.paySlipDetails
      }
        );

  PaySlip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    payDate = json['payDate'];
    payPeriodBeginDate = json['payPeriodBeginDate'];
    payPeriodEndDate = json['payPeriodEndDate'];
    payStatusId = json['payStatusId'];
    totalPayrollCost = json['totalPayrollCost'];
    totalNetPayroll = json['totalNetPayroll'];
    totaltax = json['totaltax'];
    employeeId = json['employeeId'];
    paySlipDetailId = json['paySlipDetailId'];
/*    employee = Employee.fromJson(json['employee']);*/
    /*payStatus = json['payStatus'] != null
        ? new PayStatus.fromJson(json['payStatus'])
        : null;*/
    if (json['feedBacks'] != null) {
      feedBacks = <FeedBacks>[];
      json['feedBacks'].forEach((v) {
        feedBacks.add(new FeedBacks.fromJson(v));
      });
    }
    if (json['paySlipDetails'] != null) {
      paySlipDetails=PaySlipDetails.fromJson(json['paySlipDetails']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['payDate'] = this.payDate;
    data['payPeriodBeginDate'] = this.payPeriodBeginDate;
    data['payPeriodEndDate'] = this.payPeriodEndDate;
    data['payStatusId'] = this.payStatusId;
    data['totalPayrollCost'] = this.totalPayrollCost;
    data['totalNetPayroll'] = this.totalNetPayroll;
    data['totaltax'] = this.totaltax;
    data['employeeId'] = this.employeeId;
    data['paySlipDetailId'] = this.paySlipDetailId;
/*    if (this.employee != null) {
      data['employee'] = this.employee;
    }*/
   /* if (this.payStatus != null) {
      data['payStatus'] = this.payStatus.toJson();
    }*/
    if (this.feedBacks != null) {
      data['feedBacks'] = this.feedBacks.map((v) => v).toList();
    }
    if (this.paySlipDetails != null) {
      data['paySlipDetails'] = this.paySlipDetails;
    }
    return data;
  }
}
