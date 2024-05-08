import '/flutter_flow/flutter_flow_util.dart';
import 'notificacao_widget.dart' show NotificacaoWidget;
import 'package:flutter/material.dart';

class NotificacaoModel extends FlutterFlowModel<NotificacaoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
