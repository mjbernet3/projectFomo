import 'package:flutter/material.dart';

/*
    Returned from services in order to make it easier to determine what
    errors occur when communicating with Firebase services
 */
class Response {
  final Status status;
  final String message;
  final dynamic data;

  Response({@required this.status, this.message, this.data});
}

enum Status {
  SUCCESS,
  FAILURE,
}
