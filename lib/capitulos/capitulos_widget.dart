import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'capitulos_model.dart';
export 'capitulos_model.dart';

class CapitulosWidget extends StatefulWidget {
  const CapitulosWidget({
    super.key,
    int? nCapitulos,
    required this.nomeLivro,
    int? selectChapter,
    String? bookAbbrev,
  })  : nCapitulos = nCapitulos ?? 0,
        selectChapter = selectChapter ?? 1,
        bookAbbrev = bookAbbrev ?? 'gn';

  final int nCapitulos;
  final String? nomeLivro;
  final int selectChapter;
  final String bookAbbrev;

  @override
  State<CapitulosWidget> createState() => _CapitulosWidgetState();
}

class _CapitulosWidgetState extends State<CapitulosWidget>
    with TickerProviderStateMixin {
  late CapitulosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CapitulosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.listaCapitulos = [];
      });
      while (_model.listaCapitulos.length < widget.nCapitulos) {
        setState(() {
          _model.addToListaCapitulos(valueOrDefault<int>(
                _model.listaCapitulos.length,
                0,
              ) +
              1);
        });
      }
      setState(() {
        _model.capituloSelecionado = widget.selectChapter;
      });
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
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
            buttonSize: 60.0,
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
            valueOrDefault<String>(
              widget.nomeLivro,
              '-',
            ),
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Visibility(
                    visible: widget.nCapitulos > 1,
                    child: Builder(
                      builder: (context) {
                        final itensLv = _model.listaCapitulos.toList();
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          scrollDirection: Axis.horizontal,
                          itemCount: itensLv.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                          itemBuilder: (context, itensLvIndex) {
                            final itensLvItem = itensLv[itensLvIndex];
                            return Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.capituloSelecionado =
                                        itensLvIndex + 1;
                                  });
                                  await _model.listViewController?.animateTo(
                                    0,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        itensLvItem.toString(),
                                        '0',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          controller: _model.lvChaptersScrool,
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Capítulo ${valueOrDefault<String>(
                        _model.capituloSelecionado?.toString(),
                        '1',
                      )}',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Manrope',
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (widget.nCapitulos > 1)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.capituloSelecionado =
                                      _model.capituloSelecionado! + (-1);
                                });
                                await _model.listViewController?.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                height: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: const FaIcon(
                                    FontAwesomeIcons.chevronLeft,
                                    color: Color(0x72919BAB),
                                    size: 32.0,
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation1']!),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation1']!),
                          Expanded(
                            child: FutureBuilder<ApiCallResponse>(
                              future:
                                  APIBibliaGroup.getAllVersesByChapterCall.call(
                                bookAbbrev: valueOrDefault<String>(
                                  widget.bookAbbrev,
                                  'gn',
                                ),
                                chapter: valueOrDefault<int>(
                                  _model.capituloSelecionado,
                                  1,
                                ),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final listViewGetAllVersesByChapterResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final lVItensVerses =
                                        APIBibliaGroup.getAllVersesByChapterCall
                                                .versesByChapter(
                                                  listViewGetAllVersesByChapterResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: lVItensVerses.length,
                                      itemBuilder:
                                          (context, lVItensVersesIndex) {
                                        final lVItensVersesItem =
                                            lVItensVerses[lVItensVersesIndex];
                                        return Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 6.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SelectionArea(
                                                  child: Text(
                                                getJsonField(
                                                  lVItensVersesItem,
                                                  r'''$.number''',
                                                ).toString(),
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              )),
                                              Expanded(
                                                child: SelectionArea(
                                                    child: AutoSizeText(
                                                  getJsonField(
                                                    lVItensVersesItem,
                                                    r'''$.text''',
                                                  ).toString(),
                                                  textAlign: TextAlign.justify,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                )),
                                              ),
                                            ].divide(const SizedBox(width: 12.0)),
                                          ),
                                        );
                                      },
                                      controller: _model.listViewController,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          if (widget.nCapitulos > 1)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.capituloSelecionado =
                                      _model.capituloSelecionado! + 1;
                                });
                                await _model.listViewController?.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                height: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: const FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    color: Color(0x73919BAB),
                                    size: 32.0,
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation2']!),
                                ),
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation2']!),
                        ].divide(const SizedBox(width: 4.0)),
                      ),
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
              ].divide(const SizedBox(height: 16.0)),
            ),
          ),
        ),
      ),
    );
  }
}
