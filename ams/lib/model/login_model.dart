class LoginRequestModel {
  String email;
  String password;
  int appVersionCode;
  String deviceModel;
  String osVersion;

  LoginRequestModel({
    this.email,
    this.password,
    this.appVersionCode,
    this.deviceModel,
    this.osVersion,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      // "P_MOBIAPS_ID": "31",
      "email": email.trim(),
      "password": password.trim(),
      // "P_MA_VERSION": appVersionCode.toString() ?? '',
      // "P_MDEV_MODEL": deviceModel ?? '',
      // "P_OS_VERSION": osVersion ?? '',
      // "P_FCM_REG_ID": '',
    };

    return map;
  }
}
