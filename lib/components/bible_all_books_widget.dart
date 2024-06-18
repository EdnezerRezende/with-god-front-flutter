import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'bible_all_books_model.dart';
export 'bible_all_books_model.dart';

class BibleAllBooksWidget extends StatefulWidget {
  const BibleAllBooksWidget({
    super.key,
    this.listBibles,
    String? prmGroupId,
    this.prmBooksJson,
    this.prmBooksDataType,
  }) : prmGroupId = prmGroupId ?? '1,2,3,4,5,6,7,8';

  final List<BooksStruct>? listBibles;
  final String prmGroupId;
  final List<dynamic>? prmBooksJson;
  final List<BooksStruct>? prmBooksDataType;

  @override
  State<BibleAllBooksWidget> createState() => _BibleAllBooksWidgetState();
}

class _BibleAllBooksWidgetState extends State<BibleAllBooksWidget>
    with TickerProviderStateMixin {
  late BibleAllBooksModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BibleAllBooksModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.varGroupId = valueOrDefault<String>(
        widget.prmGroupId,
        '9',
      );
      _model.updatePage(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 140.0.ms,
            duration: 600.0.ms,
            begin: 0.04,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    constraints: const BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: FutureBuilder<List<BibleGroupRow>>(
                      future: BibleGroupTable().queryRows(
                        queryFn: (q) => q.order('order', ascending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: SpinKitChasingDots(
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 40.0,
                              ),
                            ),
                          );
                        }
                        List<BibleGroupRow> lVContainerGroupBibleGroupRowList =
                            snapshot.data!;
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: lVContainerGroupBibleGroupRowList.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 8.0),
                          itemBuilder: (context, lVContainerGroupIndex) {
                            final lVContainerGroupBibleGroupRow =
                                lVContainerGroupBibleGroupRowList[
                                    lVContainerGroupIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.varGroupId = valueOrDefault<String>(
                                  lVContainerGroupBibleGroupRow.id.toString(),
                                  '1,2,3,4,5,6,7,8',
                                );
                                _model.updatePage(() {});
                                await _model.gridContainerBible?.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                width: 80.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: lVContainerGroupBibleGroupRow.id ==
                                              functions.convertStringForInteger(
                                                  functions
                                                      .convertStringForInteger(
                                                          _model.varGroupId)
                                                      .toString())
                                          ? FlutterFlowTheme.of(context)
                                              .selecionado
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
                                child: Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            lVContainerGroupBibleGroupRow.grupo,
                                            '--',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          controller: _model.lVContainerGroup,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Container(
                width: 430.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(
                    builder: (context) {
                      final lvItensBooksGroup = functions
                              .filterListBooks(
                                  widget.prmBooksDataType?.toList(),
                                  _model.varGroupId)
                              ?.toList() ??
                          [];
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: lvItensBooksGroup.length,
                        itemBuilder: (context, lvItensBooksGroupIndex) {
                          final lvItensBooksGroupItem =
                              lvItensBooksGroup[lvItensBooksGroupIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'Capitulos',
                                queryParameters: {
                                  'prmNCapitulos': serializeParam(
                                    valueOrDefault<int>(
                                      lvItensBooksGroupItem.capitulos,
                                      1,
                                    ),
                                    ParamType.int,
                                  ),
                                  'prmNomeLivro': serializeParam(
                                    valueOrDefault<String>(
                                      lvItensBooksGroupItem.nome,
                                      'gn',
                                    ),
                                    ParamType.String,
                                  ),
                                  'prmSelectChapter': serializeParam(
                                    1,
                                    ParamType.int,
                                  ),
                                  'prmBookAbbrev': serializeParam(
                                    valueOrDefault<String>(
                                      lvItensBooksGroupItem.abbrev,
                                      'gn',
                                    ),
                                    ParamType.String,
                                  ),
                                  'prmBookId': serializeParam(
                                    valueOrDefault<int>(
                                      lvItensBooksGroupItem.idLivro,
                                      1,
                                    ),
                                    ParamType.int,
                                  ),
                                  'prmBooks': serializeParam(
                                    widget.listBibles,
                                    ParamType.DataStruct,
                                    isList: true,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
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
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      lvItensBooksGroupItem.nome,
                                      '-',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      functions.convertToUppercase(
                                          valueOrDefault<String>(
                                        lvItensBooksGroupItem.abbrev,
                                        '-',
                                      )),
                                      '--',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 8.0)),
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!);
                        },
                        controller: _model.gridContainerBible,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
