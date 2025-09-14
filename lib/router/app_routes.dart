import 'package:flutter/material.dart';

import 'mobile/mobile_router.dart';
import 'pc/pc_router.dart';


/// 统一路由入口
class AppRoutes {
  /// 根据屏幕宽度判断是 PC 还是 Mobile
  static bool isPcScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600; // 自定义阈值，600px 以上认为是 PC
  }

  /// 静态 routes 映射（默认指向 home）
  static Map<String, WidgetBuilder> routes(BuildContext context) {
    if (isPcScreen(context)) {
      return pcRoutes; // pc_routes.dart 里的 routes
    } else {
      return mobileRoutes; // mobile_routes.dart 里的 mobileRoutes
    }
  }

  /// 动态路由生成
  static Route<dynamic>? generateRoute(
      BuildContext context, RouteSettings settings) {
    if (isPcScreen(context)) {
      return pcGenerateRoute(settings);
    } else {
      return mobileGenerateRoute(settings);
    }
  }
}