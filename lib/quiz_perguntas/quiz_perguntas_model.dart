import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'quiz_perguntas_widget.dart' show QuizPerguntasWidget;
import 'package:flutter/material.dart';

class QuizPerguntasModel extends FlutterFlowModel<QuizPerguntasWidget> {
  ///  Local state fields for this page.

  List<DataStruct> listaPerguntas = [];
  void addToListaPerguntas(DataStruct item) => listaPerguntas.add(item);
  void removeFromListaPerguntas(DataStruct item) => listaPerguntas.remove(item);
  void removeAtIndexFromListaPerguntas(int index) =>
      listaPerguntas.removeAt(index);
  void insertAtIndexInListaPerguntas(int index, DataStruct item) =>
      listaPerguntas.insert(index, item);
  void updateListaPerguntasAtIndex(int index, Function(DataStruct) updateFn) =>
      listaPerguntas[index] = updateFn(listaPerguntas[index]);

  DataStruct? pergutaAtual;
  void updatePergutaAtualStruct(Function(DataStruct) updateFn) =>
      updateFn(pergutaAtual ??= DataStruct());

  int? indiceAtual = 0;

  List<String> letras = ['A', 'B', 'C', 'D'];
  void addToLetras(String item) => letras.add(item);
  void removeFromLetras(String item) => letras.remove(item);
  void removeAtIndexFromLetras(int index) => letras.removeAt(index);
  void insertAtIndexInLetras(int index, String item) =>
      letras.insert(index, item);
  void updateLetrasAtIndex(int index, Function(String) updateFn) =>
      letras[index] = updateFn(letras[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getQuiz)] action in QuizPerguntas widget.
  ApiCallResponse? apiResultohe;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 30000;
  int timerMilliseconds = 30000;
  String timerValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    timerController.dispose();
  }
}
