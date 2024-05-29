import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/comp_anuncio_edit_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'anuncios_widget.dart' show AnunciosWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class AnunciosModel extends FlutterFlowModel<AnunciosWidget> {
  ///  Local state fields for this page.

  String? idAdverts;

  List<String> imagesPathPage = ['https://picsum.photos/seed/722/600'];
  void addToImagesPathPage(String item) => imagesPathPage.add(item);
  void removeFromImagesPathPage(String item) => imagesPathPage.remove(item);
  void removeAtIndexFromImagesPathPage(int index) =>
      imagesPathPage.removeAt(index);
  void insertAtIndexInImagesPathPage(int index, String item) =>
      imagesPathPage.insert(index, item);
  void updateImagesPathPageAtIndex(int index, Function(String) updateFn) =>
      imagesPathPage[index] = updateFn(imagesPathPage[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TxtSearch widget.
  FocusNode? txtSearchFocusNode;
  TextEditingController? txtSearchTextController;
  String? Function(BuildContext, String?)? txtSearchTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Delete Row(s)] action in Icon widget.
  List<AdvertsRow>? retornoExclusao;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for compAnuncioEdit component.
  late CompAnuncioEditModel compAnuncioEditModel;

  @override
  void initState(BuildContext context) {
    compAnuncioEditModel = createModel(context, () => CompAnuncioEditModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    txtSearchFocusNode?.dispose();
    txtSearchTextController?.dispose();

    tabBarController?.dispose();
    compAnuncioEditModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
