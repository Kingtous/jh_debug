import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/jh_config.dart' show jhConfig;
import '../components/JhToast/JhToast.dart';

class JhUtils {
  /// tosat提示
  static toastTips(BuildContext context, String text) {
    JhToast.showToast(context, msg: text);
  }

  /// 复制到系统剪切板
  static copyText(BuildContext context, String textData) async {
    await Clipboard.setData(ClipboardData(text: textData)).catchError((e) {
      JhUtils.toastTips(context, '复制失败');
    });
    JhUtils.toastTips(context, '已复制');
  }

  /// 获取当前调试日志信息str
  static getItemDebugLogStr(Map<String, String> itemData) {
    String logData = itemData['debugLog'];
    String logStackData = itemData['debugStack'];
    if (jhConfig.debugModeFull && logStackData != 'null') {
      logData += '\n$logStackData';
    }
    return logData;
  }
}
