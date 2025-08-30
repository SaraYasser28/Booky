class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({required this.errorModel});
}

class ErrorModel {
  int code;
  String message;

  ErrorModel({required this.code, required this.message});

  factory ErrorModel.fromJson({required Map<String, dynamic> jsonData}) {
    return ErrorModel(
      code: jsonData['code'],
      message: jsonData["errorMessage"],
    );
  }
}
