import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServiceFailure extends Failure{
  ServiceFailure(String errorMessage) : super(errorMessage);

  factory ServiceFailure.fromDioError(DioError dioError){
    switch (dioError.type){
      
      case DioErrorType.connectTimeout:
       return ServiceFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServiceFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServiceFailure('Receive timeout with ApiServer');
      case DioErrorType.response:
        return ServiceFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServiceFailure('Request to ApiServer was canceld');
      case DioErrorType.other:
         if (dioError.message.contains('SocketException')) {
          return ServiceFailure('No Internet Connection');
        }
        return ServiceFailure('Unexpected Error, Please try again!');
        default:
        return ServiceFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServiceFailure.fromResponse(int statusCode, dynamic response){
    if(statusCode==400||statusCode==401||statusCode==403){
      return ServiceFailure(response["error"]["message"]);
    }
    else if(statusCode ==404){
      return ServiceFailure("Your request not found Error 404 !, Please try later!");
    }
    else if(statusCode ==500){
      return ServiceFailure("Internal Server error, Please try later");
    }
    else{
      return ServiceFailure("Opps There was an Error, Please try again");
    }
  }
}