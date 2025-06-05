import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure{}

class FirestoreFailure implements Failure{
  final String? message;
  FirestoreFailure([this.message]);
}

class FirebaseAuthFailure implements Failure{
  final FirebaseAuthException exception;

  FirebaseAuthFailure(this.exception);
}

class ServerFailure implements Failure {
  final ServerFailureCode code;
  ServerFailure(this.code);
}

enum ServerFailureCode{
  uknownNumber,
  sendError,
  serverError,
  parseResponseError,
}