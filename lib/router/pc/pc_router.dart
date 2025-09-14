import 'package:flutter/material.dart';

import '../../../view_model/book_model.dart';
import '../../controller/pc/pc_chapter_page.dart';
import '../../controller/pc/pc_home.dart';
import '../../controller/pc/pc_read_page.dart';
/// 需要引入跳转页面地址

/// 配置路由
final pcRoutes = {
  '/': (context) => const PCHomePage(),
  '/home': (context) => const PCHomePage(),
  // 路由表中的函数不需要处理参数
};

Route<dynamic>? pcGenerateRoute(RouteSettings settings) {
  final String? name = settings.name;
  final Object? arguments = settings.arguments;

  switch (name) {
    case '/':
      return MaterialPageRoute(builder: (context) => const PCHomePage());
    case '/home':
      return MaterialPageRoute(builder: (context) => const PCHomePage());
    case '/chapterDirectory':
      if (arguments is BookModel) {
        return MaterialPageRoute(builder: (context) => PCChapterPage(bookModel: arguments,));
      }
      return _errorRoute();
    case '/read':
      if (arguments is BookModel) {
        return MaterialPageRoute(builder: (context) => PCReadPage(bookModel: arguments,));
      }
      return _errorRoute();
    default:
      return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: const Center(child: Text('Page not found')),
    );
  });
}
