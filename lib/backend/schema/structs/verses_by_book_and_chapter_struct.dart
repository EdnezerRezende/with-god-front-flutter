// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VersesByBookAndChapterStruct extends BaseStruct {
  VersesByBookAndChapterStruct({
    BookStruct? book,
    ChapterStruct? chapter,
    List<VersesStruct>? verses,
  })  : _book = book,
        _chapter = chapter,
        _verses = verses;

  // "book" field.
  BookStruct? _book;
  BookStruct get book => _book ?? BookStruct();
  set book(BookStruct? val) => _book = val;
  void updateBook(Function(BookStruct) updateFn) =>
      updateFn(_book ??= BookStruct());
  bool hasBook() => _book != null;

  // "chapter" field.
  ChapterStruct? _chapter;
  ChapterStruct get chapter => _chapter ?? ChapterStruct();
  set chapter(ChapterStruct? val) => _chapter = val;
  void updateChapter(Function(ChapterStruct) updateFn) =>
      updateFn(_chapter ??= ChapterStruct());
  bool hasChapter() => _chapter != null;

  // "verses" field.
  List<VersesStruct>? _verses;
  List<VersesStruct> get verses => _verses ?? const [];
  set verses(List<VersesStruct>? val) => _verses = val;
  void updateVerses(Function(List<VersesStruct>) updateFn) =>
      updateFn(_verses ??= []);
  bool hasVerses() => _verses != null;

  static VersesByBookAndChapterStruct fromMap(Map<String, dynamic> data) =>
      VersesByBookAndChapterStruct(
        book: BookStruct.maybeFromMap(data['book']),
        chapter: ChapterStruct.maybeFromMap(data['chapter']),
        verses: getStructList(
          data['verses'],
          VersesStruct.fromMap,
        ),
      );

  static VersesByBookAndChapterStruct? maybeFromMap(dynamic data) => data is Map
      ? VersesByBookAndChapterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'book': _book?.toMap(),
        'chapter': _chapter?.toMap(),
        'verses': _verses?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'book': serializeParam(
          _book,
          ParamType.DataStruct,
        ),
        'chapter': serializeParam(
          _chapter,
          ParamType.DataStruct,
        ),
        'verses': serializeParam(
          _verses,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static VersesByBookAndChapterStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      VersesByBookAndChapterStruct(
        book: deserializeStructParam(
          data['book'],
          ParamType.DataStruct,
          false,
          structBuilder: BookStruct.fromSerializableMap,
        ),
        chapter: deserializeStructParam(
          data['chapter'],
          ParamType.DataStruct,
          false,
          structBuilder: ChapterStruct.fromSerializableMap,
        ),
        verses: deserializeStructParam<VersesStruct>(
          data['verses'],
          ParamType.DataStruct,
          true,
          structBuilder: VersesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VersesByBookAndChapterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VersesByBookAndChapterStruct &&
        book == other.book &&
        chapter == other.chapter &&
        listEquality.equals(verses, other.verses);
  }

  @override
  int get hashCode => const ListEquality().hash([book, chapter, verses]);
}

VersesByBookAndChapterStruct createVersesByBookAndChapterStruct({
  BookStruct? book,
  ChapterStruct? chapter,
}) =>
    VersesByBookAndChapterStruct(
      book: book ?? BookStruct(),
      chapter: chapter ?? ChapterStruct(),
    );
