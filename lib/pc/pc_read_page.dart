import 'package:flutter/material.dart';

import '../view_model/book_model.dart';

class PCReadPage extends StatefulWidget {
  final BookModel bookModel;

  const PCReadPage({
    super.key,
    required this.bookModel
  });

  @override
  State<PCReadPage> createState() => _PCReadPageState();
}

class _PCReadPageState extends State<PCReadPage> {
  /// 页面切换初始化
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int currentButtonIndex = -1;
  bool showSettingArea = false;

  double _imageHeight = 0.0; // 初始化图片高度

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.bookModel.chapterList.elementAt(widget.bookModel.currentChapterIndex).chapterName),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // 打开右侧 Drawer
              scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(widget.bookModel.bookName),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("chapter ${index + 1}. ${widget.bookModel.chapterList.elementAt(index).chapterName}"),
                    onTap: () {
                      setState(() {
                        widget.bookModel.currentChapterIndex = index;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    color: Theme.of(context).primaryColor.withOpacity(0.3), // 使用浅色
                  );
                },
                itemCount: widget.bookModel.chapterList.length,
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(widget.bookModel.bookName),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          // 打开左侧 Drawer
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Image.network(
                          widget.bookModel.chapterList.elementAt(widget.bookModel.currentChapterIndex).chapterContent,
                          key: GlobalKey(), // 添加 GlobalKey
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              // 加载完成后获取图片高度
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                final RenderBox renderBox =
                                context.findRenderObject() as RenderBox;
                                setState(() {
                                  _imageHeight = renderBox.size.height;
                                });
                              });
                            }
                            return loadingProgress == null
                                ? child
                                : const Center(child: CircularProgressIndicator());
                          },
                        );
                      },
                    ),
                    // SizedBox(height: _imageHeight), // 根据图片高度调整间距
                    Container(
                      padding: const EdgeInsets.all(16),
                      child: Text('这里是底部的内容。'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
