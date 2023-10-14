part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockuser);
    // return ApiReturnValue(message: "Wrong Email and password");
  }
}