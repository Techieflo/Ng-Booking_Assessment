class RegisterRequest {
  String fullName;
  String username;
  String email;
  String country;
  String password;
  String deviceName;

  RegisterRequest({
    required this.fullName,
    required this.username,
    required this.email,
    required this.country,
    required this.password,
    required this.deviceName,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'username': username,
      'email': email,
      'country': country,
      'password': password,
      'device_name': deviceName,
    };
  }
}

class RegisterResponse {
  bool status;
  String message;
  dynamic data;

  RegisterResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}
