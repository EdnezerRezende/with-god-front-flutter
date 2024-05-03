import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'devotionals_edit_widget.dart' show DevotionalsEditWidget;
import 'package:flutter/material.dart';

class DevotionalsEditModel extends FlutterFlowModel<DevotionalsEditWidget> {
  ///  Local state fields for this page.

  String editorPage = 'editorB';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in DevotionalsEdit widget.
  List<ViewDevotionalsDetailsRow>? resultadoDetailsDevotional;
  // Stores action output result for [Custom Action - getTextHtmlEditorEnhanced] action in Button widget.
  String? returnValueEditorB;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
