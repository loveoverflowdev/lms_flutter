class ApiResponse {
  ApiResponse({
    this.statusCode,
    this.status,
    this.data,
  });

  final int? statusCode;
  final String? status;
  final dynamic data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
      statusCode: json.containsKey("code") ? json["code"] : 0,
      data: json.containsKey("data") ? json["data"] : null,
      status: json.containsKey("status") ? json["status"] : null);

  Map<String, dynamic> toJson() => {
        "code": statusCode,
        "data": data,
        "status": status,
      };

  @override
  String toString() {
    return 'ApiResponse{statusCode: $statusCode, status: $status, data: $data}';
  }
}
