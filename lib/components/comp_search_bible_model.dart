import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comp_search_bible_widget.dart' show CompSearchBibleWidget;
import 'package:flutter/material.dart';

class CompSearchBibleModel extends FlutterFlowModel<CompSearchBibleWidget> {
  ///  Local state fields for this component.

  List<dynamic> resultListSearch = [];
  void addToResultListSearch(dynamic item) => resultListSearch.add(item);
  void removeFromResultListSearch(dynamic item) =>
      resultListSearch.remove(item);
  void removeAtIndexFromResultListSearch(int index) =>
      resultListSearch.removeAt(index);
  void insertAtIndexInResultListSearch(int index, dynamic item) =>
      resultListSearch.insert(index, item);
  void updateResultListSearchAtIndex(int index, Function(dynamic) updateFn) =>
      resultListSearch[index] = updateFn(resultListSearch[index]);

  int? valueOccurrences = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TxtSearchBible widget.
  FocusNode? txtSearchBibleFocusNode;
  TextEditingController? txtSearchBibleTextController;
  String? Function(BuildContext, String?)?
      txtSearchBibleTextControllerValidator;
  // Stores action output result for [Backend Call - API (getVersesByWord)] action in IconButton widget.
  ApiCallResponse? searchResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtSearchBibleFocusNode?.dispose();
    txtSearchBibleTextController?.dispose();
  }
}
