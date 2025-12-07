import 'file_info.dart';

class FileResponse {
  final String message;
  final int statusCode;
  final List<FileInfo> dataList;

  FileResponse({
    required this.message,
    required this.statusCode,
    required this.dataList,
  });

  factory FileResponse.fromJson(Map<String, dynamic> json) {
    return FileResponse(
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      dataList: (json['dataList'] as List<dynamic>? ?? [])
          .map((e) => FileInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'statusCode': statusCode,
      'dataList': dataList.map((e) => e.toJson()).toList(),
    };
  }
}
