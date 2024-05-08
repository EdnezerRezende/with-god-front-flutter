import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/comp_sing_up_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool resultado = false;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsuariosRow>? retornoUsuario;
  // Stores action output result for [Backend Call - API (loginAndUpdateTokenByEmail)] action in Button widget.
  ApiCallResponse? retornoBibliaLogin;
  // Model for compSingUp component.
  late CompSingUpModel compSingUpModel;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    compSingUpModel = createModel(context, () => CompSingUpModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    compSingUpModel.dispose();
  }
}
