import 'dart:async';

import 'package:flutter/services.dart';
import 'package:quick_usb/src/common.dart';
import 'package:quick_usb/src/quick_usb_platform_interface.dart';

class QuickUsbAndroid extends QuickUsbPlatform {
  static const MethodChannel _channel = const MethodChannel('quick_usb');

  @override
  Future<bool> init() async {
    return true;
  }

  @override
  Future<void> exit() async {
    return;
  }

  @override
  Future<List<UsbDevice>> getDeviceList() async {
    List<Map<dynamic, dynamic>> list =
        await _channel.invokeListMethod('getDeviceList');
    return list.map((e) => UsbDevice.fromMap(e)).toList();
  }
}