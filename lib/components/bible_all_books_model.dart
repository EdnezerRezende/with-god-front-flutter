import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bible_all_books_widget.dart' show BibleAllBooksWidget;
import 'package:flutter/material.dart';

class BibleAllBooksModel extends FlutterFlowModel<BibleAllBooksWidget> {
  ///  Local state fields for this component.

  List<BooksStruct> varBooksDataType = [];
  void addToVarBooksDataType(BooksStruct item) => varBooksDataType.add(item);
  void removeFromVarBooksDataType(BooksStruct item) =>
      varBooksDataType.remove(item);
  void removeAtIndexFromVarBooksDataType(int index) =>
      varBooksDataType.removeAt(index);
  void insertAtIndexInVarBooksDataType(int index, BooksStruct item) =>
      varBooksDataType.insert(index, item);
  void updateVarBooksDataTypeAtIndex(
          int index, Function(BooksStruct) updateFn) =>
      varBooksDataType[index] = updateFn(varBooksDataType[index]);

  List<dynamic> varBooksJson = [];
  void addToVarBooksJson(dynamic item) => varBooksJson.add(item);
  void removeFromVarBooksJson(dynamic item) => varBooksJson.remove(item);
  void removeAtIndexFromVarBooksJson(int index) => varBooksJson.removeAt(index);
  void insertAtIndexInVarBooksJson(int index, dynamic item) =>
      varBooksJson.insert(index, item);
  void updateVarBooksJsonAtIndex(int index, Function(dynamic) updateFn) =>
      varBooksJson[index] = updateFn(varBooksJson[index]);

  String varGroupId = '9';

  ///  State fields for stateful widgets in this component.

  // State field(s) for LVContainerGroup widget.
  ScrollController? lVContainerGroup;
  // State field(s) for GridContainerBible widget.
  ScrollController? gridContainerBible;

  @override
  void initState(BuildContext context) {
    lVContainerGroup = ScrollController();
    gridContainerBible = ScrollController();
  }

  @override
  void dispose() {
    lVContainerGroup?.dispose();
    gridContainerBible?.dispose();
  }
}
