import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'capitulos_widget.dart' show CapitulosWidget;
import 'package:flutter/material.dart';

class CapitulosModel extends FlutterFlowModel<CapitulosWidget> {
  ///  Local state fields for this page.

  List<int> listaCapitulos = [1];
  void addToListaCapitulos(int item) => listaCapitulos.add(item);
  void removeFromListaCapitulos(int item) => listaCapitulos.remove(item);
  void removeAtIndexFromListaCapitulos(int index) =>
      listaCapitulos.removeAt(index);
  void insertAtIndexInListaCapitulos(int index, int item) =>
      listaCapitulos.insert(index, item);
  void updateListaCapitulosAtIndex(int index, Function(int) updateFn) =>
      listaCapitulos[index] = updateFn(listaCapitulos[index]);

  int? capituloSelecionado = 1;

  List<BooksStruct> booksResult = [];
  void addToBooksResult(BooksStruct item) => booksResult.add(item);
  void removeFromBooksResult(BooksStruct item) => booksResult.remove(item);
  void removeAtIndexFromBooksResult(int index) => booksResult.removeAt(index);
  void insertAtIndexInBooksResult(int index, BooksStruct item) =>
      booksResult.insert(index, item);
  void updateBooksResultAtIndex(int index, Function(BooksStruct) updateFn) =>
      booksResult[index] = updateFn(booksResult[index]);

  VersesByBookAndChapterStruct? versesByBookAndChapter;
  void updateVersesByBookAndChapterStruct(
          Function(VersesByBookAndChapterStruct) updateFn) =>
      updateFn(versesByBookAndChapter ??= VersesByBookAndChapterStruct());

  String bookAbbrev = 'gn';

  int? nCapitulos = 1;

  int? bookId = 1;

  String nomeLivro = 'Gênesis';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getAllVersesByChapter)] action in Capitulos widget.
  ApiCallResponse? resultNextBook;
  // State field(s) for LvChaptersScrool widget.
  ScrollController? lvChaptersScrool;
  // Stores action output result for [Backend Call - API (getAllVersesByChapter)] action in Column widget.
  ApiCallResponse? resultCallAPIBook;
  // Stores action output result for [Backend Call - API (getAllVersesByChapter)] action in Container widget.
  ApiCallResponse? resultPreviusBookChapter;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - API (getAllVersesByChapter)] action in Container widget.
  ApiCallResponse? resultNextBookChapter;

  @override
  void initState(BuildContext context) {
    lvChaptersScrool = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    lvChaptersScrool?.dispose();
    listViewController?.dispose();
  }
}
