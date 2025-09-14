import 'package:flutter/material.dart';

class Util
{
  static Widget buildImage(String path) {
    if (path.startsWith('http')) {
      // 网络图片
      return Image.network(
        path,
        key: GlobalKey(),
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (_, __, ___) =>
        const Center(child: Icon(Icons.broken_image, size: 40)),
      );
    } else {
      // 本地 asset 图片
      return Image.asset(
        path,
        key: GlobalKey(),
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) =>
        const Center(child: Icon(Icons.broken_image, size: 40)),
      );
    }
  }
}