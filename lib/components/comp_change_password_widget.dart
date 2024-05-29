import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'comp_change_password_model.dart';
export 'comp_change_password_model.dart';

class CompChangePasswordWidget extends StatefulWidget {
  const CompChangePasswordWidget({super.key});

  @override
  State<CompChangePasswordWidget> createState() =>
      _CompChangePasswordWidgetState();
}

class _CompChangePasswordWidgetState extends State<CompChangePasswordWidget> {
  late CompChangePasswordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompChangePasswordModel());

    _model.newPasswordTextController ??= TextEditingController();
    _model.newPasswordFocusNode ??= FocusNode();

    _model.confirmNewPasswordTextController ??= TextEditingController();
    _model.confirmNewPasswordFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Container(
        width: double.infinity,
        height: 300.0,
        constraints: const BoxConstraints(
          maxWidth: 500.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'hza9lua8' /* Change Password */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: TextFormField(
                controller: _model.newPasswordTextController,
                focusNode: _model.newPasswordFocusNode,
                autofocus: false,
                obscureText: !_model.newPasswordVisibility,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    'ip78k43x' /* New Password */,
                  ),
                  hintText: FFLocalizations.of(context).getText(
                    'd78348p3' /* Enter your new password */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => _model.newPasswordVisibility =
                          !_model.newPasswordVisibility,
                    ),
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      _model.newPasswordVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 22.0,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                    ),
                validator: _model.newPasswordTextControllerValidator
                    .asValidator(context),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: TextFormField(
                controller: _model.confirmNewPasswordTextController,
                focusNode: _model.confirmNewPasswordFocusNode,
                autofocus: false,
                obscureText: !_model.confirmNewPasswordVisibility,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    '5vr0otdz' /* Confirm Password */,
                  ),
                  hintText: FFLocalizations.of(context).getText(
                    '68if3ja3' /* Confirm your new password */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: InkWell(
                    onTap: () => setState(
                      () => _model.confirmNewPasswordVisibility =
                          !_model.confirmNewPasswordVisibility,
                    ),
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      _model.confirmNewPasswordVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 22.0,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                    ),
                validator: _model.confirmNewPasswordTextControllerValidator
                    .asValidator(context),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (_model.newPasswordTextController.text ==
                      _model.confirmNewPasswordTextController.text) {
                    _model.apiResult06p =
                        await SupabaseAPIsGroup.recuperarSenhaCall.call(
                      email: currentUserEmail,
                      password: _model.newPasswordTextController.text,
                      accessUserToken: currentJwtToken,
                    );
                    if ((_model.apiResult06p?.succeeded ?? true)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Senha Alterada com sucesso',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Ocorreu um erro',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Necessário que as senhas sejam as mesmas',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }

                  setState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  'hotlqt0m' /* Atualizar Senha */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 55.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 2.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).secondaryText,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
