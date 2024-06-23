import '../view_model/book_model.dart';

final BookModel model1 = BookModel(
  bookId: '1',
  bookName: 'bookName 1',
  imageUrl: '',
  attachments: [
    BookAttachments(
      platform: '',
      website: '',
    ),
  ],
  chapterList: [
    BookChapter(
        chapterId: '0',
        chapterName: 'chapterName 1',
        chapterContent: 'https://16871852.s21i.faiusr.com/2/ABUIABACGAAgpqCOhAYolpuYjgEwlAo40Q8.jpg'),
    BookChapter(
        chapterId: '1',
        chapterName: 'chapterName 2',
        chapterContent: 'https://16871852.s21i.faiusr.com/2/ABUIABACGAAgpaCOhAYoxs-96gUwlAo40Q8.jpg'),
  ],
);
