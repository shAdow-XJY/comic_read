import '../view_model/book_model.dart';

final BookModel model2 = BookModel(
  bookId: '2',
  bookName: 'bookName 2',
  imageUrl: '',
  attachments: [
    BookAttachments(
      platform: '',
      website: '',
    ),
  ],
  chapterList: List.generate(
    14,
    (index) => BookChapter(
      chapterId: '$index',
      chapterName: 'chapterName ${index + 1}',
      chapterContent: 'assets/books/book2/${index + 1}.jpg',
    ),
  ),
);
