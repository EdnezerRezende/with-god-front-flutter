import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'devotionals_edit_model.dart';
export 'devotionals_edit_model.dart';

class DevotionalsEditWidget extends StatefulWidget {
  const DevotionalsEditWidget({
    super.key,
    this.prmVersesJson,
    this.prmDevotionalId,
    bool? prmIsUpdate,
    String? prmBookBible,
    int? prmChapter,
  })  : prmIsUpdate = prmIsUpdate ?? false,
        prmBookBible = prmBookBible ?? 'Gênesis',
        prmChapter = prmChapter ?? 1;

  final List<dynamic>? prmVersesJson;
  final String? prmDevotionalId;
  final bool prmIsUpdate;
  final String prmBookBible;
  final int prmChapter;

  @override
  State<DevotionalsEditWidget> createState() => _DevotionalsEditWidgetState();
}

class _DevotionalsEditWidgetState extends State<DevotionalsEditWidget> {
  late DevotionalsEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevotionalsEditModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.prmIsUpdate == true) {
        _model.resultadoDetailsDevotional =
            await ViewDevotionalsDetailsTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            widget.prmDevotionalId,
          ),
        );
        await Future.delayed(const Duration(milliseconds: 1000));
        await actions.setTextHtmlEditorEnhanced(
          valueOrDefault<String>(
            _model.resultadoDetailsDevotional?.first.texto,
            'Texto',
          ),
          'editorB',
        );
        await Future.delayed(const Duration(milliseconds: 1000));
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 62.0,
            icon: const FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.white,
              size: 32.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            '${widget.prmBookBible} ${valueOrDefault<String>(
              widget.prmChapter.toString(),
              '1',
            )}',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 400.0,
                        child: custom_widgets.HtmlEditorEnhanced(
                          width: double.infinity,
                          height: 400.0,
                          editorKeyValue: 'editorB',
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            // Obter Valor do Editor
                            _model.returnValueEditorB =
                                await actions.getTextHtmlEditorEnhanced(
                              valueOrDefault<String>(
                                _model.editorPage,
                                'editorB',
                              ),
                            );
                            await DevotionalsTable().update(
                              data: {
                                'texto': _model.returnValueEditorB,
                              },
                              matchingRows: (rows) => rows
                                  .eq(
                                    'id',
                                    widget.prmDevotionalId,
                                  )
                                  .eq(
                                    'user_id',
                                    currentUserUid,
                                  ),
                            );

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            'tfof1o28' /* Salvar Devocional */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterFlowAdBanner(
                    height: 100.0,
                    showsTestAd: true,
                    iOSAdUnitID: 'ca-app-pub-8203324650722374/8939292144',
                    androidAdUnitID: 'ca-app-pub-8203324650722374/1997324010',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
