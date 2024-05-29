import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/carousel_images_widget.dart';
import '/components/comp_anuncio_edit_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
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

    _model.txtSearchTextController ??= TextEditingController();
    _model.txtSearchFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryText,
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
                                  controller: _model.txtSearchTextController,
                                  focusNode: _model.txtSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.txtSearchTextController',
                                    const Duration(milliseconds: 2000),
                                    () => setState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '9nqj20zj' /* Pesquisar */,
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
                                        .secondaryBackground,
                                    suffixIcon: _model.txtSearchTextController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.txtSearchTextController
                                                  ?.clear();
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.clear,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 22,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primary,
                                  validator: _model
                                      .txtSearchTextControllerValidator
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
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          unselectedLabelStyle: const TextStyle(),
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 400.0,
                                      height: 450.0,
                                      decoration: const BoxDecoration(),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(SupabaseAPIsGroup
                                                      .selectAdvertsCall
                                                      .call(
                                                    searchString: _model
                                                        .txtSearchTextController
                                                        .text,
                                                    accessUserToken:
                                                        currentJwtToken,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewAllAdvertsSelectAdvertsResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final lVAllAdvertsSearch =
                                                  (listViewAllAdvertsSelectAdvertsResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<AdvertsStruct?>(
                                                                      AdvertsStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  AdvertsStruct?>)
                                                          .withoutNulls
                                                          .toList() ??
                                                      [];
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    lVAllAdvertsSearch.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 8.0),
                                                itemBuilder: (context,
                                                    lVAllAdvertsSearchIndex) {
                                                  final lVAllAdvertsSearchItem =
                                                      lVAllAdvertsSearch[
                                                          lVAllAdvertsSearchIndex];
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                36.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                36.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              if (lVAllAdvertsSearchItem
                                                                      .userId ==
                                                                  currentUserUid)
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await AdvertsTable()
                                                                        .delete(
                                                                      matchingRows:
                                                                          (rows) =>
                                                                              rows.eq(
                                                                        'id',
                                                                        valueOrDefault<
                                                                            String>(
                                                                          lVAllAdvertsSearchItem
                                                                              .id,
                                                                          '-',
                                                                        ),
                                                                      ),
                                                                    );
                                                                    setState(() =>
                                                                        _model.apiRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForApiRequestCompleted();

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .trashAlt,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 36.0,
                                                                  ),
                                                                ),
                                                              if (lVAllAdvertsSearchItem
                                                                      .userId ==
                                                                  currentUserUid)
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.idAdverts =
                                                                          valueOrDefault<
                                                                              String>(
                                                                        lVAllAdvertsSearchItem
                                                                            .id,
                                                                        '-',
                                                                      );
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      _model
                                                                          .tabBarController!
                                                                          .animateTo(
                                                                        min(
                                                                            _model.tabBarController!.length -
                                                                                1,
                                                                            _model.tabBarController!.index +
                                                                                1),
                                                                        duration:
                                                                            const Duration(milliseconds: 300),
                                                                        curve: Curves
                                                                            .ease,
                                                                      );
                                                                    });

                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            2000));
                                                                    setState(
                                                                        () {
                                                                      _model.imagesPathPage = lVAllAdvertsSearchItem
                                                                          .fotos
                                                                          .toList()
                                                                          .cast<
                                                                              String>();
                                                                    });
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .edit,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 36.0,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    8.0),
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
                                                                    'Keyjpd_${lVAllAdvertsSearchIndex}_of_${lVAllAdvertsSearch.length}'),
                                                                prmImages:
                                                                    lVAllAdvertsSearchItem
                                                                        .fotos,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        36.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Container(
                                                              color: const Color(
                                                                  0x00000000),
                                                              child:
                                                                  ExpandableNotifier(
                                                                initialExpanded:
                                                                    false,
                                                                child:
                                                                    ExpandablePanel(
                                                                  header:
                                                                      Container(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          4.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              lVAllAdvertsSearchItem.nomeEmpresa,
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              lVAllAdvertsSearchItem.segmento,
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  collapsed:
                                                                      Container(
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(36.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                lVAllAdvertsSearchItem.descricao,
                                                                                '-',
                                                                              ),
                                                                              textAlign: TextAlign.justify,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  expanded:
                                                                      Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (valueOrDefault<String>(
                                                                                lVAllAdvertsSearchItem.telefone,
                                                                                '1',
                                                                              ) !=
                                                                              '')
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              4.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await launchUrl(Uri(
                                                                                scheme: 'tel',
                                                                                path: valueOrDefault<String>(
                                                                                  lVAllAdvertsSearchItem.telefone,
                                                                                  '1',
                                                                                ),
                                                                              ));
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 0.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.phoneVolume,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      lVAllAdvertsSearchItem.telefone,
                                                                                      '1',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (valueOrDefault<String>(
                                                                                lVAllAdvertsSearchItem.intagranLink,
                                                                                '1',
                                                                              ) !=
                                                                              '')
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              4.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await launchURL(valueOrDefault<String>(
                                                                                lVAllAdvertsSearchItem.intagranLink,
                                                                                '1',
                                                                              ));
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(6.0, 4.0, 0.0, 0.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.instagram,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      lVAllAdvertsSearchItem.intagranLink,
                                                                                      '1',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (valueOrDefault<String>(
                                                                                lVAllAdvertsSearchItem.paginaWebLink,
                                                                                '1',
                                                                              ) !=
                                                                              '')
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              4.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await launchURL(valueOrDefault<String>(
                                                                                lVAllAdvertsSearchItem.paginaWebLink,
                                                                                '-',
                                                                              ));
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.globe,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      lVAllAdvertsSearchItem.paginaWebLink,
                                                                                      '1',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (valueOrDefault<String>(
                                                                                lVAllAdvertsSearchItem.endereco,
                                                                                '1',
                                                                              ) !=
                                                                              '')
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              4.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 4.0, 4.0),
                                                                                child: FaIcon(
                                                                                  FontAwesomeIcons.building,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                  child: SelectionArea(
                                                                                      child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      lVAllAdvertsSearchItem.endereco,
                                                                                      '1',
                                                                                    ),
                                                                                    textAlign: TextAlign.justify,
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  )),
                                                                                ),
                                                                              ),
                                                                            ].divide(const SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                      if (valueOrDefault<String>(
                                                                                lVAllAdvertsSearchItem.email,
                                                                                '1',
                                                                              ) !=
                                                                              '')
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              4.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                                                                                child: Icon(
                                                                                  Icons.alternate_email,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                  child: SelectionArea(
                                                                                      child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      lVAllAdvertsSearchItem.email,
                                                                                      '1',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Manrope',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  )),
                                                                                ),
                                                                              ),
                                                                            ].divide(const SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            6.0)),
                                                                  ),
                                                                  theme:
                                                                      ExpandableThemeData(
                                                                    tapHeaderToExpand:
                                                                        true,
                                                                    tapBodyToExpand:
                                                                        true,
                                                                    tapBodyToCollapse:
                                                                        true,
                                                                    headerAlignment:
                                                                        ExpandablePanelHeaderAlignment
                                                                            .top,
                                                                    hasIcon:
                                                                        true,
                                                                    expandIcon:
                                                                        FontAwesomeIcons
                                                                            .chevronDown,
                                                                    collapseIcon:
                                                                        FontAwesomeIcons
                                                                            .chevronUp,
                                                                    iconColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
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
      ),
    );
  }
}
