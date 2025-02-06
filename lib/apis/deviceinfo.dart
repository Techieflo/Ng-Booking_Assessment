import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceInfoUtil {
  static Future<String> getDeviceName() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo =
            await deviceInfoPlugin.androidInfo;
        return '${androidInfo.brand} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        return '${iosInfo.name} ${iosInfo.model}';
      }
    } catch (e) {
      print('Failed to get device info: $e');
      return 'Unknown Device';
    }

    return 'Unknown Device';
  }
}
