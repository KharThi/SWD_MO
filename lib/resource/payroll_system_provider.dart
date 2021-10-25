
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:test/model/Employee.dart';
import 'package:test/model/PaySlip.dart';
import 'package:test/model/PaySlipDetails.dart';
import 'package:test/model/TokenResponse.dart';

class PayrollProvider {
  //static const String url='https://jsonplaceholder.typicode.com/users';
  static const String mainUrl='http://3.139.237.0/api';
  static const String _getEmployeebyId='/employees/find';
  static const String _getEmployeebyEmail='/employees/findByEmail/';
  static const String _getPaySlipByEmpId='/payslips/findByEmpID/';
  static const String _getPaySlipDetailById='/payslipdetails/find';


  static Map<String, String> _header = {
    HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*', // Required for CORS support to work
    'Access-Control-Allow-Headers': 'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
    "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
  };
  static Future<TokenResponse> loginAuth(String token) async {

    final response = await http.get(
        Uri.parse('$mainUrl?token='+token),
    );
    if (response.statusCode == 200) {
      return TokenResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Lỗi gùi ${response.statusCode}');
    }
  }
   static Future<Employee> fetchEmployeeById(int id) async {

     final response = await http.get(
                Uri.parse('$mainUrl'+'$_getEmployeebyId'+'/$id'),
                headers: {
                  HttpHeaders.authorizationHeader: '',
                  'Content-Type': 'application/json',
                  'Charset': 'utf-8',
                  'Accept': 'application/json',
                  'Access-Control-Allow-Origin': '*', // Required for CORS support to work
                  'Access-Control-Allow-Headers': 'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
                  'Access-Control-Allow-Methods': 'POST, OPTIONS',
                  "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
                }
     );
    if (response.statusCode == 200) {
     return Employee.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Lỗi gùi ${response.statusCode}');
    }
  }
  static Future<Employee> fetchEmployeeByEmail(String email) async {

    final response = await http.get(
        Uri.parse('$mainUrl'+'$_getEmployeebyEmail'+email),
        headers: {
          HttpHeaders.authorizationHeader: '',
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*', // Required for CORS support to work
          'Access-Control-Allow-Headers': 'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
          'Access-Control-Allow-Methods': 'POST, OPTIONS',
          "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        }
    );
    if (response.statusCode == 200) {
      return Employee.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Lỗi gùi ${response.statusCode}');
    }
  }
  static Future<List<PaySlip>> fetchPaySlips(int id) async {
    final response = await http.get(
        Uri.parse('$mainUrl'+'$_getPaySlipByEmpId'+'$id'),
        headers: {
          HttpHeaders.authorizationHeader: '',
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*', // Required for CORS support to work
          'Access-Control-Allow-Headers': 'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
          'Access-Control-Allow-Methods': 'POST, OPTIONS',
          "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        }
    );
    if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        List<PaySlip> payslips=[];
        for(var u in jsonData)
          {
            PaySlip paySlip = PaySlip.fromJson(u);
            payslips.add(paySlip);
          }
        if(payslips != null){
          return payslips;
        }
        return payslips;
    } else {
      throw Exception(
          'Lỗi gùi ${response.statusCode}');
    }
  }
  static Future<PaySlipDetails> fetchPaySlipDetailById(int id) async {

    final response = await http.get(
        Uri.parse('$mainUrl'+'$_getPaySlipDetailById'+'/$id'),
        headers: {
          HttpHeaders.authorizationHeader: '',
          'Content-Type': 'application/json',
          'Charset': 'utf-8',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*', // Required for CORS support to work
          'Access-Control-Allow-Headers': 'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
          'Access-Control-Allow-Methods': 'POST, OPTIONS',
          "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
        }
    );
    if (response.statusCode == 200) {
      return PaySlipDetails.fromJson(json.decode(response.body));
    } else {
      throw Exception(
          'Lỗi gùi ${response.statusCode}');
    }
  }
}
// 'http://3.139.237.0/api/accounts/login?token='
/*Iterable listResponse = json.decode(response.body);
      List<PaySlip> payslips = List<PaySlip>.from(
          listResponse.map((payslip) => PaySlip.fromJson(payslip)));
      return payslips;*/