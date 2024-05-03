import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'devotional_list_model.dart';
export 'devotional_list_model.dart';

class DevotionalListWidget extends StatefulWidget {
  const DevotionalListWidget({super.key});

  @override
  State<DevotionalListWidget> createState() => _DevotionalListWidgetState();
}

class _DevotionalListWidgetState extends State<DevotionalListWidget> {
  late DevotionalListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevotionalListModel());
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
            FFLocalizations.of(context).getText(
              'm0xgwvyf' /* Devocionais */,
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
            decoration: const BoxDecoration(),
            child: FutureBuilder<List<ViewDevotionalsListRow>>(
              future: ViewDevotionalsListTable().queryRows(
                queryFn: (q) => q.eq(
                  'user_id',
                  currentUserUid,
                ),
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
                List<ViewDevotionalsListRow>
                    listViewViewDevotionalsListRowList = snapshot.data!;
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewViewDevotionalsListRowList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewViewDevotionalsListRow =
                        listViewViewDevotionalsListRowList[listViewIndex];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            listViewViewDevotionalsListRow
                                                .bookNome,
                                            '-',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            listViewViewDevotionalsListRow
                                                .chapter
                                                ?.toString(),
                                            '1',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          'dd/MM/yyyy',
                                          functions.stringToDate(
                                              valueOrDefault<String>(
                                            listViewViewDevotionalsListRow
                                                .createdAt
                                                ?.toString(),
                                            '0',
                                          )),
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '-',
                                      ),
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
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).accent1,
                                icon: FaIcon(
                                  FontAwesomeIcons.edit,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed(
                                    'DevotionalsDetalhe',
                                    queryParameters: {
                                      'prmDevotionalId': serializeParam(
                                        valueOrDefault<String>(
                                          listViewViewDevotionalsListRow.id,
                                          '0',
                                        ),
                                        ParamType.String,
                                      ),
                                      'prmIsUpdate': serializeParam(
                                        true,
                                        ParamType.bool,
                                      ),
                                      'prmBookBible': serializeParam(
                                        listViewViewDevotionalsListRow.bookNome,
                                        ParamType.String,
                                      ),
                                      'prmChapter': serializeParam(
                                        listViewViewDevotionalsListRow.chapter,
                                        ParamType.int,
                                      ),
                                      'prmBookAbbrev': serializeParam(
                                        listViewViewDevotionalsListRow.abbrev,
                                        ParamType.String,
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
                                },
                              ),
                            ],
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
    );
  }
}
