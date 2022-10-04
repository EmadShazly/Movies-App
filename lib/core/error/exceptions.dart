import 'package:osama2/core/network/error_message_model.dart';
// Remote Data Base
class ServerException implements Exception
{
final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}
// Local  Data base

class LocalDataBaseException implements Exception
{
final  String message;

  LocalDataBaseException({required this.message});
}