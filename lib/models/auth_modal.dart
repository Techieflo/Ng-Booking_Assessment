class UserInfo {
  final String fullName;
  final String email;
  final String phoneNumber;

  UserInfo(
      {required this.fullName, required this.email, required this.phoneNumber});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
    };
  }
}

class UserRequest {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;

  UserRequest(
      {required this.fullName,
      required this.email,
      required this.phoneNumber,
      required this.password});

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
    };
  }
}

class UserResponse {
  final String message;
  final UserInfo userInfo;

  UserResponse({required this.message, required this.userInfo});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      message: json['message'],
      userInfo: UserInfo.fromJson(json['userInfo']),
    );
  }
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}

class LoginResponse {
  final bool success;
  final String token;
  final UserInfo userInfo;

  LoginResponse(
      {required this.success, required this.token, required this.userInfo});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      token: json['token'],
      userInfo: UserInfo.fromJson(json['userInfo']),
    );
  }
}

//for errors
class ErrorResponse {
  final String message;
  final int statusCode;

  ErrorResponse({required this.message, required this.statusCode});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'] ?? 'An unknown error occurred',
      statusCode: json['statusCode'] ?? 500,
    );
  }
}

//modal for reset password:
class ResetPasswordResponse {
  final String message;
  final bool success;
  final String? token;

  ResetPasswordResponse(
      {required this.message, required this.success, this.token});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      message: json['message'],
      success: json['success'],
      token: json['token'],
    );
  }
}
