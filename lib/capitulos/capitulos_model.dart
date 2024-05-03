import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'capitulos_widget.dart' show CapitulosWidget;
import 'package:flutter/material.dart';

class CapitulosModel extends FlutterFlowModel<CapitulosWidget> {
  ///  Local state fields for this page.

  List<int> listaCapitulos = [];
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for LvChaptersScrool widget.
  ScrollController? lvChaptersScrool;
  // State field(s) for ListView widget.
  ScrollController? listViewController;

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
