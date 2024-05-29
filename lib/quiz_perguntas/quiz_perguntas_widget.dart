import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'quiz_perguntas_model.dart';
export 'quiz_perguntas_model.dart';

class QuizPerguntasWidget extends StatefulWidget {
  const QuizPerguntasWidget({
    super.key,
    String? prmLevel,
    int? prmLevelValue,
  })  : prmLevel = prmLevel ?? 'Fácil',
        prmLevelValue = prmLevelValue ?? 1;

  final String prmLevel;
  final int prmLevelValue;

  @override
  State<QuizPerguntasWidget> createState() => _QuizPerguntasWidgetState();
}

class _QuizPerguntasWidgetState extends State<QuizPerguntasWidget> {
  late QuizPerguntasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizPerguntasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultohe = await ShowDoCristaoGroup.getQuizCall.call(
        level: widget.prmLevelValue,
      );
      // AtualizaListaPerguntas
      setState(() {
        _model.listaPerguntas = (getJsonField(
          (_model.apiResultohe?.jsonBody ?? ''),
          r'''$.data''',
          true,
        )!
                .toList()
                .map<DataStruct?>(DataStruct.maybeFromMap)
                .toList() as Iterable<DataStruct?>)
            .withoutNulls
            .toList()
            .cast<DataStruct>();
        _model.indiceAtual = 0;
        _model.pergutaAtual = _model.listaPerguntas[_model.indiceAtual!];
      });
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
            valueOrDefault<String>(
              widget.prmLevel,
              'Fácil',
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
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          'Pergunta ${valueOrDefault<String>(
                            ((_model.indiceAtual!) + 1).toString(),
                            '1',
                          )} / ${valueOrDefault<String>(
                            _model.listaPerguntas.length.toString(),
                            '1',
                          )}',
                          'Carregando...',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 36.0,
                          ),
                          FlutterFlowTimer(
                            initialTime: _model.timerInitialTimeMs,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(
                              value,
                              hours: false,
                              minute: false,
                              milliSecond: false,
                            ),
                            controller: _model.timerController,
                            updateStateInterval: const Duration(milliseconds: 1000),
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerMilliseconds = value;
                              _model.timerValue = displayTime;
                              if (shouldUpdate) setState(() {});
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ].divide(const SizedBox(width: 16.0)),
                  ),
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: const BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            valueOrDefault<String>(
                              _model.pergutaAtual?.pergunta,
                              '-',
                            ),
                            textAlign: TextAlign.justify,
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      final lVopcoes =
                          _model.pergutaAtual?.alternativas.toList() ?? [];
                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: lVopcoes.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                        itemBuilder: (context, lVopcoesIndex) {
                          final lVopcoesItem = lVopcoes[lVopcoesIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.updateListaPerguntasAtIndex(
                                  _model.indiceAtual!,
                                  (e) => e
                                    ..idRespostaEscolhida = valueOrDefault<int>(
                                      lVopcoesItem.idResposta,
                                      1,
                                    )
                                    ..selecaoCorreta = _model
                                            .pergutaAtual?.idRespostaCorreta ==
                                        lVopcoesItem.idResposta,
                                );
                              });
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Container(
                                height: 65.0,
                                decoration: BoxDecoration(
                                  color: lVopcoesItem.idResposta ==
                                          _model
                                              .listaPerguntas[
                                                  _model.indiceAtual!]
                                              .idRespostaEscolhida
                                      ? FlutterFlowTheme.of(context).selecionado
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 14.0,
                                      color: (FFAppState().quizConcluido ==
                                                  true) &&
                                              (_model.pergutaAtual
                                                      ?.idRespostaCorreta ==
                                                  lVopcoesItem.idResposta)
                                          ? FlutterFlowTheme.of(context).success
                                          : const Color(0x00000000),
                                      offset: const Offset(
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
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0x00212B36),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                _model
                                                    .letras[valueOrDefault<int>(
                                                  lVopcoesIndex,
                                                  0,
                                                )],
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100.0,
                                        child: VerticalDivider(
                                          thickness: 1.0,
                                          indent: 8.0,
                                          endIndent: 8.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      Expanded(
                                        child: AutoSizeText(
                                          valueOrDefault<String>(
                                            lVopcoesItem.texto,
                                            '-',
                                          ),
                                          textAlign: TextAlign.justify,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      if (FFAppState().quizConcluido)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (_model.pergutaAtual
                                                    ?.idRespostaCorreta ==
                                                lVopcoesItem.idResposta)
                                              Icon(
                                                Icons.check,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                size: 36.0,
                                              ),
                                            if (_model.pergutaAtual
                                                    ?.idRespostaCorreta !=
                                                lVopcoesItem.idResposta)
                                              Icon(
                                                Icons.close,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                size: 36.0,
                                              ),
                                          ],
                                        ),
                                    ].divide(const SizedBox(width: 4.0)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  if (FFAppState().quizConcluido == true)
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                _model.listaPerguntas[_model.indiceAtual!]
                                            .selecaoCorreta ==
                                        true
                                    ? 'Correta. Ref.: ${valueOrDefault<String>(
                                        _model.pergutaAtual?.referencia,
                                        '-',
                                      )}'
                                    : 'Errada. Ref.: ${valueOrDefault<String>(
                                        _model.pergutaAtual?.referencia,
                                        '-',
                                      )}',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: (_model.indiceAtual == 0)
                              ? null
                              : () async {
                                  // IncrementarProximaPergunta
                                  setState(() {
                                    _model.indiceAtual =
                                        _model.indiceAtual! + -1;
                                    _model.pergutaAtual = _model
                                        .listaPerguntas[_model.indiceAtual!];
                                  });
                                },
                          text: FFLocalizations.of(context).getText(
                            'a1atpu1e' /* Anterior */,
                          ),
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledTextColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: (_model.indiceAtual! >
                                  valueOrDefault<int>(
                                    _model.listaPerguntas.length,
                                    1,
                                  ))
                              ? null
                              : () async {
                                  if (_model.listaPerguntas[_model.indiceAtual!]
                                          .idRespostaEscolhida >
                                      0) {
                                    if (_model.listaPerguntas.length ==
                                        valueOrDefault<int>(
                                          (_model.indiceAtual!) + 1,
                                          1,
                                        )) {
                                      context.pushNamed(
                                        'QuizFinish',
                                        queryParameters: {
                                          'prmRespostas': serializeParam(
                                            _model.listaPerguntas
                                                .map((e) => e.selecaoCorreta)
                                                .toList(),
                                            ParamType.bool,
                                            true,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );

                                      setState(() {
                                        _model.indiceAtual = 0;
                                      });
                                    } else {
                                      // IncrementarProximaPergunta
                                      setState(() {
                                        _model.indiceAtual =
                                            _model.indiceAtual! + 1;
                                        _model.pergutaAtual =
                                            _model.listaPerguntas[
                                                _model.indiceAtual!];
                                      });
                                      _model.timerController.onResetTimer();

                                      _model.timerController.onStartTimer();
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: const Text('Atenção'),
                                          content: const Text('Escolha uma opção'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: const Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                          text: valueOrDefault<String>(
                            _model.listaPerguntas.length ==
                                    valueOrDefault<int>(
                                      (_model.indiceAtual!) + 1,
                                      1,
                                    )
                                ? 'Finalizar'
                                : 'Próximo',
                            'Próximo',
                          ),
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).selecionado,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 8.0)),
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlutterFlowAdBanner(
                        height: 100.0,
                        showsTestAd: true,
                        iOSAdUnitID: 'ca-app-pub-8203324650722374/8939292144',
                        androidAdUnitID:
                            'ca-app-pub-8203324650722374/1997324010',
                      ),
                    ],
                  ),
                ].divide(const SizedBox(height: 16.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
