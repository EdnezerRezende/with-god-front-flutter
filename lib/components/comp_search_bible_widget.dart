import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'comp_search_bible_model.dart';
export 'comp_search_bible_model.dart';

class CompSearchBibleWidget extends StatefulWidget {
  const CompSearchBibleWidget({
    super.key,
    required this.prmBooks,
  });

  final List<BooksStruct>? prmBooks;

  @override
  State<CompSearchBibleWidget> createState() => _CompSearchBibleWidgetState();
}

class _CompSearchBibleWidgetState extends State<CompSearchBibleWidget> {
  late CompSearchBibleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompSearchBibleModel());

    _model.txtSearchBibleTextController ??= TextEditingController();
    _model.txtSearchBibleFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 800.0,
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: TextFormField(
                      controller: _model.txtSearchBibleTextController,
                      focusNode: _model.txtSearchBibleFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.txtSearchBibleTextController',
                        const Duration(milliseconds: 2000),
                        () async {
                          setState(() {
                            _model.resultListSearch = [];
                            _model.valueOccurrences = 0;
                          });
                        },
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: false,
                        labelStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        alignLabelWithHint: false,
                        hintText: FFLocalizations.of(context).getText(
                          'j2kq6gwv' /* Pesquisar */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelLarge
                            .override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).accent3,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.all(14.0),
                        suffixIcon: _model
                                .txtSearchBibleTextController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.txtSearchBibleTextController?.clear();
                                  setState(() {
                                    _model.resultListSearch = [];
                                    _model.valueOccurrences = 0;
                                  });
                                  setState(() {});
                                },
                                child: const Icon(
                                  Icons.clear,
                                  size: 32.0,
                                ),
                              )
                            : null,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                          ),
                      validator: _model.txtSearchBibleTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderRadius: 0.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  icon: FaIcon(
                    FontAwesomeIcons.search,
                    color: FlutterFlowTheme.of(context).alternate,
                    size: 32.0,
                  ),
                  showLoadingIndicator: true,
                  onPressed: () async {
                    _model.searchResult =
                        await APIBibliaGroup.getVersesByWordCall.call(
                      word: _model.txtSearchBibleTextController.text,
                      version: FFAppState().versionBible,
                    );
                    setState(() {
                      _model.resultListSearch = getJsonField(
                        (_model.searchResult?.jsonBody ?? ''),
                        r'''$.verses''',
                        true,
                      )!
                          .toList()
                          .cast<dynamic>();
                      _model.valueOccurrences = getJsonField(
                        (_model.searchResult?.jsonBody ?? ''),
                        r'''$.occurrence''',
                      );
                    });

                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          if ((_model.searchResult != null) &&
              (_model.resultListSearch.isNotEmpty))
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
              child: Text(
                'Ocorrências: ${valueOrDefault<String>(
                  _model.valueOccurrences?.toString(),
                  '0',
                )}',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    final lvItensSearch = _model.resultListSearch.toList();
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: lvItensSearch.length,
                      itemBuilder: (context, lvItensSearchIndex) {
                        final lvItensSearchItem =
                            lvItensSearch[lvItensSearchIndex];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 8.0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              curve: Curves.elasticOut,
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'Capitulos',
                                      queryParameters: {
                                        'prmNCapitulos': serializeParam(
                                          getJsonField(
                                            lvItensSearchItem,
                                            r'''$.book.chapters''',
                                          ),
                                          ParamType.int,
                                        ),
                                        'prmNomeLivro': serializeParam(
                                          getJsonField(
                                            lvItensSearchItem,
                                            r'''$.book.name''',
                                          ).toString(),
                                          ParamType.String,
                                        ),
                                        'prmSelectChapter': serializeParam(
                                          getJsonField(
                                            lvItensSearchItem,
                                            r'''$.chapter''',
                                          ),
                                          ParamType.int,
                                        ),
                                        'prmBookAbbrev': serializeParam(
                                          valueOrDefault<String>(
                                            getJsonField(
                                              lvItensSearchItem,
                                              r'''$.book.abbrev.pt''',
                                            )?.toString(),
                                            'gn',
                                          ),
                                          ParamType.String,
                                        ),
                                        'prmBooks': serializeParam(
                                          widget.prmBooks,
                                          ParamType.DataStruct,
                                          true,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.leftToRight,
                                        ),
                                      },
                                    );
                                  },
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              getJsonField(
                                                lvItensSearchItem,
                                                r'''$.book.name''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              getJsonField(
                                                lvItensSearchItem,
                                                r'''$.chapter''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qrj72ycw' /* | Versículo: */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              getJsonField(
                                                lvItensSearchItem,
                                                r'''$.number''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 4.0)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Text(
                                            getJsonField(
                                              lvItensSearchItem,
                                              r'''$.text''',
                                            ).toString(),
                                            textAlign: TextAlign.justify,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ].divide(const SizedBox(height: 8.0)),
      ),
    );
  }
}
