class DashboardResponse {
  bool status;
  String message;
  String? secret;

  DashboardResponse({
    required this.status,
    required this.message,
    this.secret,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
      status: json['status'],
      message: json['message'],
      secret: json['data']['secret'],
    );
  }
}
