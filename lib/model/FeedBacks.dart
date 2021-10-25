
import 'PaySlip.dart';

class FeedBacks {
  late int id;
  late String desciption;
  late int paySlipId;
  late PaySlip paySlip;

  FeedBacks({required this.id, required this.desciption, required this.paySlipId, required this.paySlip});

  FeedBacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    desciption = json['desciption'];
    paySlipId = json['paySlipId'];
    paySlip =
    (json['paySlip'] != null ? new PaySlip.fromJson(json['paySlip']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['desciption'] = this.desciption;
    data['paySlipId'] = this.paySlipId;
    if (this.paySlip != null) {
      data['paySlip'] = this.paySlip.toJson();
    }
    return data;
  }
}
