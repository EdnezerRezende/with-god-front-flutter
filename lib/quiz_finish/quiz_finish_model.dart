import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_finish_widget.dart' show QuizFinishWidget;
import 'package:flutter/material.dart';

class QuizFinishModel extends FlutterFlowModel<QuizFinishWidget> {
  ///  Local state fields for this page.

  int? totalAcertos = 0;

  int? contador = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
