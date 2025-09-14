import 'package:flutter/material.dart';

import '../../../view_model/book_model.dart';
import '../../controller/mobile/mobile_chapter_page.dart';
import '../../controller/mobile/mobile_home.dart';
import '../../controller/mobile/mobile_read_page.dart';

/// 移动端路由表
final mobileRoutes = {
  '/': (context) => const MobileHomePage(),
  '/home': (context) => const MobileHomePage(),
};

/// 移动端动态路由生成器
Route<dynamic>? mobileGenerateRoute(RouteSettings settings) {
  final String? name = settings.name;
  final Object? arguments = settings.arguments;

  switch (name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const MobileHomePage());
    case '/home':
      return MaterialPageRoute(builder: (context) => const MobileHomePage());
    case '/chapterDirectory':
      if (arguments is BookModel) {
        return MaterialPageRoute(
          builder: (context) => MobileChapterPage(bookModel: arguments),
        );
      }
      return _mobileErrorRoute();
    case '/read':
      if (arguments is BookModel) {
        return MaterialPageRoute(
          builder: (context) => MobileReadPage(bookModel: arguments),
        );
      }
      return _mobileErrorRoute();
    default:
      return _mobileErrorRoute();
  }
}

Route<dynamic> _mobileErrorRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      );
    },
  );
}