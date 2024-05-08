import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/bible_all_books_widget.dart';
import '/components/comp_search_bible_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'biblia_model.dart';
export 'biblia_model.dart';

class BibliaWidget extends StatefulWidget {
  const BibliaWidget({
    super.key,
    String? groupId,
  }) : groupId = groupId ?? '9';

  final String groupId;

  @override
  State<BibliaWidget> createState() => _BibliaWidgetState();
}

class _BibliaWidgetState extends State<BibliaWidget>
    with TickerProviderStateMixin {
  late BibliaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BibliaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultaldosBibleCopy =
          await SupabaseAPIsGroup.selectBooksByGroupsCall.call(
        groupId: valueOrDefault<String>(
          widget.groupId,
          '1,2,3,4,5,6,7,8',
        ),
        accessUserToken: currentJwtToken,
      );
      setState(() {
        _model.varBooksPageBibleJson =
            (_model.apiResultaldosBibleCopy?.jsonBody ?? '')
                .toList()
                .cast<dynamic>();
        _model.varBooksPageBibleDataType = _model.varBooksPageBibleJson
            .map((e) => BooksStruct.maybeFromMap(e))
            .withoutNulls
            .toList()
            .toList()
            .cast<BooksStruct>();
      });
      setState(() {
        FFAppState().books = _model.varBooksPageBibleJson
            .map((e) => BooksStruct.maybeFromMap(e))
            .withoutNulls
            .toList()
            .toList()
            .cast<BooksStruct>();
      });
    });

    _model.segmentosBibliaController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'tabBarOnPageLoadAnimation': AnimationInfo(
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
              'uye01on6' /* Bíblia */,
            ),
            textAlign: TextAlign.center,
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
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: const Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                                unselectedLabelStyle: const TextStyle(),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).alternate,
                                tabs: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.bookOpen,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'ypokceuh' /* Books */,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Icon(
                                          Icons.manage_search_sharp,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          't8m43l2q' /* Pesquisa */,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                controller: _model.segmentosBibliaController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.segmentosBibliaController,
                                children: [
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => wrapWithModel(
                                      model: _model.bibleAllBooksModel,
                                      updateCallback: () => setState(() {}),
                                      child: BibleAllBooksWidget(
                                        listBibles: FFAppState().books,
                                        prmGroupId: '9',
                                        prmBooksJson:
                                            _model.varBooksPageBibleJson,
                                        prmBooksDataType:
                                            _model.varBooksPageBibleDataType,
                                      ),
                                    ),
                                  ),
                                  KeepAliveWidgetWrapper(
                                    builder: (context) => wrapWithModel(
                                      model: _model.compSearchBibleModel,
                                      updateCallback: () => setState(() {}),
                                      child: CompSearchBibleWidget(
                                        prmBooks: FFAppState().books,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['tabBarOnPageLoadAnimation']!),
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
