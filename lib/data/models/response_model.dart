import '../../domain/domain.dart';

class ResponseModel {
  ResponseModel({required this.statusCode, this.body});
  final int statusCode;
  final Map<String, dynamic>? body;

  bool get isOk => statusCode >= 200 && statusCode < 300;

  ResponseEntity toEntity() => ResponseEntity(
        body: body,
      );
}
