import 'package:equatable/equatable.dart';
import 'package:langdy/model/custom_response.dart';

class CustomError extends Equatable {
  const CustomError({
    required this.errorType,
    required this.message,
  });
  final Type errorType;
  final String message;

  // TODO: make custom message by error type
  factory CustomError.fromObject(Object e) {
    if (e is CustomError) {
      return e;
    }
    if (e is Error) {
      print(e.stackTrace);
    }
    return CustomError(
      errorType: e.runtimeType,
      message: e.toString(),
    );
  }
  factory CustomError.fromResponse(CustomResponse response) {
    return CustomError(
      errorType: CustomResponse,
      message: response.message ?? "",
    );
  }

  @override
  List<Object?> get props => [
        errorType,
        message,
      ];
}
