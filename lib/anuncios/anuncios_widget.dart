import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/carousel_images_widget.dart';
import '/components/comp_anuncio_edit_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'anuncios_model.dart';
export 'anuncios_model.dart';

class AnunciosWidget extends StatefulWidget {
  const AnunciosWidget({super.key});

  @override
  State<AnunciosWidget> createState() => _AnunciosWidgetState();
}

class _AnunciosWidgetState extends State<AnunciosWidget>
    with TickerProviderStateMixin {
  late AnunciosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnunciosModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
              '0j0gjpq2' /* Anúncios */,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        offset: const Offset(
                          0.0,
                          1.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 200.0,
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    '89s7ymrf' /* Search listings... */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primary,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          icon: Icon(
                            Icons.tune_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelSmall.override(
                                  fontFamily: 'Manrope',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w100,
                                ),
                        unselectedLabelStyle: const TextStyle(),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        padding: const EdgeInsets.all(4.0),
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'bygnmbu0' /* Publicações */,
                            ),
                            icon: const FaIcon(
                              FontAwesomeIcons.tools,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              '7g50mavo' /* Inserir */,
                            ),
                            icon: const FaIcon(
                              FontAwesomeIcons.plusSquare,
                            ),
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<List<AdvertsRow>>(
                                    future: (_model.requestCompleter ??=
                                            Completer<List<AdvertsRow>>()
                                              ..complete(
                                                  AdvertsTable().queryRows(
                                                queryFn: (q) => q.order('pais',
                                                    ascending: true),
                                              )))
                                        .future,
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child: SpinKitChasingDots(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 40.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<AdvertsRow> listViewAdvertsRowList =
                                          snapshot.data!;
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewAdvertsRowList.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 16.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewAdvertsRow =
                                              listViewAdvertsRowList[
                                                  listViewIndex];
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(36.0),
                                                topLeft: Radius.circular(36.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      if (listViewAdvertsRow
                                                              .userId ==
                                                          currentUserUid)
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await AdvertsTable()
                                                                .delete(
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'id',
                                                                listViewAdvertsRow
                                                                    .id,
                                                              ),
                                                            );
                                                            setState(() => _model
                                                                    .requestCompleter =
                                                                null);
                                                            await _model
                                                                .waitForRequestCompleted();

                                                            setState(() {});
                                                          },
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .trashAlt,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 36.0,
                                                          ),
                                                        ),
                                                      if (listViewAdvertsRow
                                                              .userId ==
                                                          currentUserUid)
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              _model.idAdverts =
                                                                  listViewAdvertsRow
                                                                      .id;
                                                            });
                                                            setState(() {
                                                              _model
                                                                  .tabBarController!
                                                                  .animateTo(
                                                                min(
                                                                    _model.tabBarController!
                                                                            .length -
                                                                        1,
                                                                    _model.tabBarController!
                                                                            .index +
                                                                        1),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            });

                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        2000));
                                                            setState(() {
                                                              _model.idAdverts =
                                                                  null;
                                                              _model.imagesPathPage =
                                                                  listViewAdvertsRow
                                                                      .fotos
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                            });
                                                          },
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .edit,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 36.0,
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      height: 140.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          CarouselImagesWidget(
                                                        key: Key(
                                                            'Keyjpd_${listViewIndex}_of_${listViewAdvertsRowList.length}'),
                                                        prmImages:
                                                            listViewAdvertsRow
                                                                .fotos,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 4.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewAdvertsRow
                                                                .nomeEmpresa,
                                                            '-',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewAdvertsRow
                                                                .segmento,
                                                            '-',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (listViewAdvertsRow
                                                              .telefone !=
                                                          null &&
                                                      listViewAdvertsRow
                                                              .telefone !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .phoneVolume,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewAdvertsRow
                                                                    .telefone,
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            )),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  if (listViewAdvertsRow
                                                              .intagranLink !=
                                                          null &&
                                                      listViewAdvertsRow
                                                              .intagranLink !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  4.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await launchUrl(Uri(
                                                            scheme: 'tel',
                                                            path: '1111111',
                                                          ));
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .instagram,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listViewAdvertsRow
                                                                      .intagranLink,
                                                                  '-',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              )),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  if (listViewAdvertsRow
                                                              .paginaWebLink !=
                                                          null &&
                                                      listViewAdvertsRow
                                                              .paginaWebLink !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    4.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .globe,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewAdvertsRow
                                                                    .paginaWebLink,
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            )),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  if (listViewAdvertsRow
                                                              .endereco !=
                                                          null &&
                                                      listViewAdvertsRow
                                                              .endereco !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        4.0,
                                                                        4.0,
                                                                        4.0),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .building,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewAdvertsRow
                                                                    .endereco,
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            )),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  if (listViewAdvertsRow
                                                              .email !=
                                                          null &&
                                                      listViewAdvertsRow
                                                              .email !=
                                                          '')
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  4.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4.0,
                                                                        4.0,
                                                                        4.0,
                                                                        4.0),
                                                            child: Icon(
                                                              Icons
                                                                  .alternate_email,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewAdvertsRow
                                                                    .email,
                                                                '-',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            )),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.compAnuncioEditModel,
                            updateCallback: () => setState(() {}),
                            child: CompAnuncioEditWidget(
                              prmIdAdvert: _model.idAdverts,
                              prmImagesPath: _model.imagesPathPage,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
