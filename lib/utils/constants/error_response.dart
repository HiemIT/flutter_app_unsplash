class ErrorResponse implements Exception {
  final int? code;
  final String? log;
  final String? statusCode;
  final String? message;

  ErrorResponse({
    this.code,
    this.log,
    this.statusCode,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'],
      code: json['code'],
      log: json['log'],
      statusCode: json['statusCode'],
    );
  }

  @override
  String toString() {
    return message!;
  }
}
