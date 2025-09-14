import 'package:comic_read/controller/common/util.dart';
import 'package:flutter/material.dart';

import '../../view_model/book_model.dart';

/// 移动端阅读页面
class MobileReadPage extends StatefulWidget {
  final BookModel bookModel;

  const MobileReadPage({super.key, required this.bookModel});

  @override
  State<MobileReadPage> createState() => _MobileReadPageState();
}

class _MobileReadPageState extends State<MobileReadPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final currentChapter = widget.bookModel.chapterList[widget.bookModel.currentChapterIndex];

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(currentChapter.chapterName),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: widget.bookModel.chapterList.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("第${index + 1}章  ${widget.bookModel.chapterList[index].chapterName}"),
              selected: index == widget.bookModel.currentChapterIndex,
              onTap: () {
                setState(() {
                  widget.bookModel.currentChapterIndex = index;
                });
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Util.buildImage(currentChapter.chapterContent),
            const SizedBox(height: 16),
            const Text("—— 本章完 ——", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}