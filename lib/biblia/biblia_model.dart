import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/bible_all_books_widget.dart';
import '/components/comp_search_bible_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'biblia_widget.dart' show BibliaWidget;
import 'package:flutter/material.dart';

class BibliaModel extends FlutterFlowModel<BibliaWidget> {
  ///  Local state fields for this page.

  List<dynamic> varBooksPageBibleJson = [];
  void addToVarBooksPageBibleJson(dynamic item) =>
      varBooksPageBibleJson.add(item);
  void removeFromVarBooksPageBibleJson(dynamic item) =>
      varBooksPageBibleJson.remove(item);
  void removeAtIndexFromVarBooksPageBibleJson(int index) =>
      varBooksPageBibleJson.removeAt(index);
  void insertAtIndexInVarBooksPageBibleJson(int index, dynamic item) =>
      varBooksPageBibleJson.insert(index, item);
  void updateVarBooksPageBibleJsonAtIndex(
          int index, Function(dynamic) updateFn) =>
      varBooksPageBibleJson[index] = updateFn(varBooksPageBibleJson[index]);

  List<BooksStruct> varBooksPageBibleDataType = [];
  void addToVarBooksPageBibleDataType(BooksStruct item) =>
      varBooksPageBibleDataType.add(item);
  void removeFromVarBooksPageBibleDataType(BooksStruct item) =>
      varBooksPageBibleDataType.remove(item);
  void removeAtIndexFromVarBooksPageBibleDataType(int index) =>
      varBooksPageBibleDataType.removeAt(index);
  void insertAtIndexInVarBooksPageBibleDataType(int index, BooksStruct item) =>
      varBooksPageBibleDataType.insert(index, item);
  void updateVarBooksPageBibleDataTypeAtIndex(
          int index, Function(BooksStruct) updateFn) =>
      varBooksPageBibleDataType[index] =
          updateFn(varBooksPageBibleDataType[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (SelectBooksByGroups)] action in Biblia widget.
  ApiCallResponse? apiResultaldosBibleCopy;
  // State field(s) for SegmentosBiblia widget.
  TabController? segmentosBibliaController;
  int get segmentosBibliaCurrentIndex =>
      segmentosBibliaController != null ? segmentosBibliaController!.index : 0;

  // Model for BibleAllBooks component.
  late BibleAllBooksModel bibleAllBooksModel;
  // Model for CompSearchBible component.
  late CompSearchBibleModel compSearchBibleModel;

  @override
  void initState(BuildContext context) {
    bibleAllBooksModel = createModel(context, () => BibleAllBooksModel());
    compSearchBibleModel = createModel(context, () => CompSearchBibleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    segmentosBibliaController?.dispose();
    bibleAllBooksModel.dispose();
    compSearchBibleModel.dispose();
  }
}
