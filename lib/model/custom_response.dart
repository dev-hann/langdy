const _successCode = "0";
const _failureCode = "1";

class CustomResponse {
  CustomResponse({
    required this.statusCode,
    this.message,
    this.data,
  });
  final String statusCode;
  final String? message;
  final dynamic data;

  bool get isOK {
    return statusCode == _successCode;
  }

  factory CustomResponse.success({
    String? message,
    dynamic data,
  }) {
    return CustomResponse(
      statusCode: _successCode,
      message: message,
      data: data,
    );
  }
  factory CustomResponse.fail({
    required String message,
    dynamic data,
  }) {
    return CustomResponse(
      statusCode: _failureCode,
      message: message,
      data: data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }

  factory CustomResponse.fromMap(Map<String, dynamic> map) {
    return CustomResponse(
      statusCode: map['statusCode'] as String,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] as dynamic,
    );
  }
}
