import '/flutter_flow/flutter_flow_util.dart';
import 'devotional_list_widget.dart' show DevotionalListWidget;
import 'package:flutter/material.dart';

class DevotionalListModel extends FlutterFlowModel<DevotionalListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
