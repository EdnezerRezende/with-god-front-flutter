import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'devotionals_detalhe_model.dart';
export 'devotionals_detalhe_model.dart';

class DevotionalsDetalheWidget extends StatefulWidget {
  const DevotionalsDetalheWidget({
    super.key,
    this.prmVersesJson,
    this.prmDevotionalId,
    bool? prmIsUpdate,
    String? prmBookBible,
    int? prmChapter,
    required this.prmBookAbbrev,
  })  : prmIsUpdate = prmIsUpdate ?? false,
        prmBookBible = prmBookBible ?? 'Gênesis',
        prmChapter = prmChapter ?? 1;

  final int? prmVersesJson;
  final String? prmDevotionalId;
  final bool prmIsUpdate;
  final String prmBookBible;
  final int prmChapter;
  final String? prmBookAbbrev;

  @override
  State<DevotionalsDetalheWidget> createState() =>
      _DevotionalsDetalheWidgetState();
}

class _DevotionalsDetalheWidgetState extends State<DevotionalsDetalheWidget> {
  late DevotionalsDetalheModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevotionalsDetalheModel());

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
            '-',
          ),
          _model.editorPage,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 350.0,
                          child: custom_widgets.HtmlEditorEnhanced(
                            width: double.infinity,
                            height: 350.0,
                            editorKeyValue: 'editorB',
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 8.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: APIBibliaGroup
                                      .getAllVersesByChapterCall
                                      .call(
                                    bookAbbrev: widget.prmBookAbbrev,
                                    chapter: widget.prmChapter,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final listViewGetAllVersesByChapterResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final lVItensVerses = APIBibliaGroup
                                                .getAllVersesByChapterCall
                                                .versesByChapter(
                                                  listViewGetAllVersesByChapterResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: lVItensVerses.length,
                                          itemBuilder:
                                              (context, lVItensVersesIndex) {
                                            final lVItensVersesItem =
                                                lVItensVerses[
                                                    lVItensVersesIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 6.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      lVItensVersesItem,
                                                      r'''$.number''',
                                                    ).toString(),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      getJsonField(
                                                        lVItensVersesItem,
                                                        r'''$.text''',
                                                      ).toString(),
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 12.0)),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 8.0, 8.0, 8.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.getDevotionalEdit =
                                  await actions.getTextHtmlEditorEnhanced(
                                _model.editorPage,
                              );
                              await DevotionalsTable().update(
                                data: {
                                  'texto': _model.getDevotionalEdit,
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
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
