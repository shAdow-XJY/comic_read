import 'package:flutter/material.dart';

import '../../view_model/book_model.dart';
import 'mobile_read_page.dart';

/// 移动端章节目录
class MobileChapterPage extends StatelessWidget {
  final BookModel bookModel;

  const MobileChapterPage({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bookModel.bookName),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.separated(
        itemCount: bookModel.chapterList.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("第${index + 1}章  ${bookModel.chapterList[index].chapterName}"),
            onTap: () {
              bookModel.currentChapterIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MobileReadPage(bookModel: bookModel),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
