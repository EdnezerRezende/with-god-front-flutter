import '/components/comp_forgott_password_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for compForgottPassword component.
  late CompForgottPasswordModel compForgottPasswordModel;

  @override
  void initState(BuildContext context) {
    compForgottPasswordModel =
        createModel(context, () => CompForgottPasswordModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    compForgottPasswordModel.dispose();
  }
}
