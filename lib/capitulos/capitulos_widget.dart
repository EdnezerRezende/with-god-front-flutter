import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'capitulos_model.dart';
export 'capitulos_model.dart';

class CapitulosWidget extends StatefulWidget {
  const CapitulosWidget({
    super.key,
    int? prmNCapitulos,
    required this.prmNomeLivro,
    int? prmSelectChapter,
    String? prmBookAbbrev,
    int? prmBookId,
    required this.prmBooks,
  })  : prmNCapitulos = prmNCapitulos ?? 0,
        prmSelectChapter = prmSelectChapter ?? 1,
        prmBookAbbrev = prmBookAbbrev ?? 'gn',
        prmBookId = prmBookId ?? 1;

  final int prmNCapitulos;
  final String? prmNomeLivro;
  final int prmSelectChapter;
  final String prmBookAbbrev;
  final int prmBookId;
  final List<BooksStruct>? prmBooks;

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
      _model.capituloSelecionado = widget.prmSelectChapter;
      _model.bookAbbrev = widget.prmBookAbbrev;
      _model.nCapitulos = widget.prmNCapitulos;
      _model.bookId = widget.prmBookId;
      _model.booksResult = widget.prmBooks!.toList().cast<BooksStruct>();
      _model.nomeLivro = widget.prmNomeLivro!;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.resultNextBook =
          await APIBibliaGroup.getAllVersesByChapterCall.call(
        bookAbbrev: valueOrDefault<String>(
          _model.bookAbbrev,
          'gn',
        ),
        chapter: _model.capituloSelecionado,
        version: FFAppState().versionBible,
      );

      _model.listaCapitulos = [1];
      setState(() {});
      _model.versesByBookAndChapter = VersesByBookAndChapterStruct.maybeFromMap(
          (_model.resultNextBook?.jsonBody ?? ''));
      setState(() {});
      while (_model.listaCapitulos.length <
          valueOrDefault<int>(
            _model.nCapitulos,
            1,
          )) {
        _model.addToListaCapitulos(valueOrDefault<int>(
              _model.listaCapitulos.length,
              0,
            ) +
            1);
        setState(() {});
      }
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
    context.watch<FFAppState>();

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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                valueOrDefault<String>(
                  _model.nomeLivro,
                  'Gênesis',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  _model.capituloSelecionado?.toString(),
                  '1',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      fontSize: 30.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
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
                    visible: widget.prmNCapitulos > 1,
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
                                color: _model.capituloSelecionado == itensLvItem
                                    ? FlutterFlowTheme.of(context).accent4
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  )
                                ],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(0.0),
                                ),
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
                                  _model.capituloSelecionado =
                                      valueOrDefault<int>(
                                    itensLvIndex + 1,
                                    1,
                                  );
                                  setState(() {});
                                  _model.resultCallAPIBook =
                                      await APIBibliaGroup
                                          .getAllVersesByChapterCall
                                          .call(
                                    bookAbbrev: valueOrDefault<String>(
                                      _model.bookAbbrev,
                                      'gn',
                                    ),
                                    chapter: _model.capituloSelecionado,
                                  );

                                  _model.versesByBookAndChapter =
                                      VersesByBookAndChapterStruct.maybeFromMap(
                                          (_model.resultCallAPIBook?.jsonBody ??
                                              ''));
                                  setState(() {});
                                  await _model.listViewController?.animateTo(
                                    0,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );

                                  setState(() {});
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'DevotionalsDetalhe',
                            queryParameters: {
                              'prmIsUpdate': serializeParam(
                                false,
                                ParamType.bool,
                              ),
                              'prmBookBible': serializeParam(
                                widget.prmNomeLivro,
                                ParamType.String,
                              ),
                              'prmChapter': serializeParam(
                                valueOrDefault<int>(
                                  _model.capituloSelecionado,
                                  1,
                                ),
                                ParamType.int,
                              ),
                              'prmBookAbbrev': serializeParam(
                                widget.prmBookAbbrev,
                                ParamType.String,
                              ),
                              'prmBookId': serializeParam(
                                widget.prmBookId,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: const TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                              ),
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          '2u8prexn' /* Criar Devocional */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    fontSize: 16.0,
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
                    ],
                  ),
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
                          if (_model.nCapitulos! > 1)
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.capituloSelecionado =
                                    _model.capituloSelecionado! + (-1);
                                setState(() {});
                                if (_model.capituloSelecionado! <
                                    _model.nCapitulos!) {
                                  _model.listaCapitulos = [1];
                                  _model.bookId = _model.bookId! + (-1);
                                  _model.bookAbbrev = valueOrDefault<String>(
                                    _model.booksResult[_model.bookId!].abbrev,
                                    'gn',
                                  );
                                  _model.nCapitulos = valueOrDefault<int>(
                                    _model
                                        .booksResult[_model.bookId!].capitulos,
                                    1,
                                  );
                                  _model.nomeLivro = valueOrDefault<String>(
                                    _model.booksResult[_model.bookId!].nome,
                                    'Gênesis',
                                  );
                                  setState(() {});
                                  while (_model.listaCapitulos.length <
                                      _model.nCapitulos!) {
                                    _model.addToListaCapitulos(
                                        valueOrDefault<int>(
                                              _model.listaCapitulos.length,
                                              0,
                                            ) +
                                            1);
                                    setState(() {});
                                  }
                                  _model.capituloSelecionado =
                                      _model.nCapitulos;
                                  setState(() {});
                                }
                                _model.resultPreviusBookChapter =
                                    await APIBibliaGroup
                                        .getAllVersesByChapterCall
                                        .call(
                                  bookAbbrev: valueOrDefault<String>(
                                    _model.bookAbbrev,
                                    'gn',
                                  ),
                                  chapter: _model.capituloSelecionado,
                                );

                                _model.versesByBookAndChapter =
                                    VersesByBookAndChapterStruct.maybeFromMap(
                                        (_model.resultNextBookChapter
                                                ?.jsonBody ??
                                            ''));
                                setState(() {});
                                await _model.listViewController?.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                                if (_model.capituloSelecionado ==
                                    _model.nCapitulos) {
                                  await _model.lvChaptersScrool?.animateTo(
                                    _model.lvChaptersScrool!.position
                                        .maxScrollExtent,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.ease,
                                  );
                                }

                                setState(() {});
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
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final lVItensVerses = _model
                                          .versesByBookAndChapter?.verses
                                          .toList() ??
                                      [];
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: lVItensVerses.length,
                                    itemBuilder: (context, lVItensVersesIndex) {
                                      final lVItensVersesItem =
                                          lVItensVerses[lVItensVersesIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                lVItensVersesItem.number
                                                    .toString(),
                                                '1',
                                              ),
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
                                            ),
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  lVItensVersesItem.text,
                                                  '-',
                                                ),
                                                textAlign: TextAlign.justify,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
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
                                    controller: _model.listViewController,
                                  );
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.capituloSelecionado =
                                  _model.capituloSelecionado! + 1;
                              setState(() {});
                              if (_model.capituloSelecionado! >
                                  _model.nCapitulos!) {
                                _model.listaCapitulos = [1];
                                _model.bookId = _model.bookId! + 1;
                                _model.bookAbbrev = valueOrDefault<String>(
                                  _model.booksResult[_model.bookId!].abbrev,
                                  'gn',
                                );
                                _model.nCapitulos = valueOrDefault<int>(
                                  _model.booksResult[_model.bookId!].capitulos,
                                  1,
                                );
                                _model.nomeLivro = valueOrDefault<String>(
                                  _model.booksResult[_model.bookId!].nome,
                                  'Gênesis',
                                );
                                setState(() {});
                                while (_model.listaCapitulos.length <
                                    _model.nCapitulos!) {
                                  _model
                                      .addToListaCapitulos(valueOrDefault<int>(
                                    valueOrDefault<int>(
                                          _model.listaCapitulos.length,
                                          0,
                                        ) +
                                        1,
                                    1,
                                  ));
                                  setState(() {});
                                }
                                _model.capituloSelecionado = 1;
                                setState(() {});
                              }
                              _model.resultNextBookChapter =
                                  await APIBibliaGroup.getAllVersesByChapterCall
                                      .call(
                                bookAbbrev: valueOrDefault<String>(
                                  _model.bookAbbrev,
                                  'gn',
                                ),
                                chapter: _model.capituloSelecionado,
                              );

                              _model.versesByBookAndChapter =
                                  VersesByBookAndChapterStruct.maybeFromMap(
                                      (_model.resultNextBookChapter?.jsonBody ??
                                          ''));
                              setState(() {});
                              await _model.listViewController?.animateTo(
                                0,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );
                              if (_model.capituloSelecionado == 1) {
                                await _model.lvChaptersScrool?.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                              }

                              setState(() {});
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
                                ).animateOnPageLoad(
                                    animationsMap['iconOnPageLoadAnimation2']!),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation2']!),
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
                      showsTestAd: false,
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
