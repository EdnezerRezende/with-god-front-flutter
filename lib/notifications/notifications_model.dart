import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  Local state fields for this page.

  String tokenfcm = '-';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TxtTitulo widget.
  FocusNode? txtTituloFocusNode;
  TextEditingController? txtTituloTextController;
  String? Function(BuildContext, String?)? txtTituloTextControllerValidator;
  // State field(s) for CorpoMensagem widget.
  FocusNode? corpoMensagemFocusNode;
  TextEditingController? corpoMensagemTextController;
  String? Function(BuildContext, String?)? corpoMensagemTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    txtTituloFocusNode?.dispose();
    txtTituloTextController?.dispose();

    corpoMensagemFocusNode?.dispose();
    corpoMensagemTextController?.dispose();
  }
}
