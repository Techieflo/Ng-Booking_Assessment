// email_request.dart

class EmailRequest {
  final String email;

  EmailRequest(this.email);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
// email_response.dart

// email_response.dart

class EmailResponse {
  EmailResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.meta,
    required this.pagination,
  });

  final bool? status;
  final String? message;
  final Data? data;
  final List<dynamic> meta;
  final List<dynamic> pagination;

  factory EmailResponse.fromJson(Map<String, dynamic> json) {
    return EmailResponse(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      meta: json["meta"] == null
          ? []
          : List<dynamic>.from(json["meta"]!.map((x) => x)),
      pagination: json["pagination"] == null
          ? []
          : List<dynamic>.from(json["pagination"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "meta": meta.map((x) => x).toList(),
        "pagination": pagination.map((x) => x).toList(),
      };
}

class Data {
  Data({
    required this.token,
  });

  final String? token;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
