import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TwilioService {
  final String _accountSid = dotenv.env['TWILIO_ACCOUNT_SID'] ?? '';
  final String _authToken = dotenv.env['TWILIO_AUTH_TOKEN'] ?? '';
  final String _phoneNumber = dotenv.env['TWILIO_PHONE_NUMBER'] ?? '';
  
  Future<bool> sendSMS({
    required String to,
    required String message,
  }) async {
    try {
      final url = Uri.parse(
        'https://api.twilio.com/2010-04-01/Accounts/$_accountSid/Messages.json',
      );
      
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Basic ${base64Encode(utf8.encode('$_accountSid:$_authToken'))}',
        },
        body: {
          'From': _phoneNumber,
          'To': '+91$to',
          'Body': message,
        },
      );
      
      return response.statusCode == 201;
    } catch (e) {
      print('Error sending SMS: $e');
      return false;
    }
  }
  
  Future<bool> sendJobNotification({
    required String workerPhone,
    required String jobType,
    required String location,
    required String wage,
  }) async {
    final message = 'New job available: $jobType at $location. Wage: ₹$wage/day. Open Dehadi app to apply.';
    return await sendSMS(to: workerPhone, message: message);
  }
}