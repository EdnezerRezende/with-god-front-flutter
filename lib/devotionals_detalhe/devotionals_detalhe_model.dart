import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'devotionals_detalhe_widget.dart' show DevotionalsDetalheWidget;
import 'package:flutter/material.dart';

class DevotionalsDetalheModel
    extends FlutterFlowModel<DevotionalsDetalheWidget> {
  ///  Local state fields for this page.

  String editorPage = 'editorB';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in DevotionalsDetalhe widget.
  List<ViewDevotionalsDetailsRow>? resultadoDetailsDevotional;
  // Stores action output result for [Custom Action - getTextHtmlEditorEnhanced] action in Button widget.
  String? getDevotionalEdit;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
