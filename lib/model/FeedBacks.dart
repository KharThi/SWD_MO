
import 'PaySlip.dart';

class FeedBacks {
  late int id;
  late String desciption;
  late int paySlipId;
  late int employeeId;
  late String createDate;
  late String image;
  //late PaySlip? paySlip;

  FeedBacks({required this.id,required this.desciption,required this.paySlipId,required this.employeeId, required this.createDate, required this.image});

  FeedBacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    desciption = json['desciption'];
    paySlipId = json['paySlipId'];
    employeeId = json['employeeId'];
    createDate = json['createDate'];
    image = json['image'];
    //paySlip =
    //(json['paySlip'] != null ? new PaySlip.fromJson(json['paySlip']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['desciption'] = this.desciption;
    data['paySlipId'] = this.paySlipId;
    data['employeeId'] = this.employeeId;
    data['createDate'] = this.createDate;
    data['image'] = this.image;
   // if (this.paySlip != null) {
    //  data['paySlip'] = this.paySlip!.toJson();
   // }
    return data;
  }
}
