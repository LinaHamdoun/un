

import 'package:dio/dio.dart';
import 'package:untitled/common/const/failure.dart';
import 'package:untitled/common/const/typedef.dart';

mixin HandlingApiManager {
  Future <T> wrapHandlingApi <T> ({
   required Future<Response> Function () tryCall,
   required FormJson <T> jsonConvert}) async
{
  final response = await tryCall ();
  if (response.statusCode ==200)
    {
      return jsonConvert (response.data);
    }
  else if (response.statusCode == 401)
    {
      throw UnauthenticatedFailure
        (message: response.data['message'],);
    }

  else if (response.statusCode ==403)
    {
      throw UserBlockedFailure(message: response.data['message']);
    }
  else {
    throw ServerFailure(message: response.data['message'] ,
        statusCode: response.statusCode);
  }
    }
}