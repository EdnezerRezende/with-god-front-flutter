import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/comp_change_password_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.retornoUsuarioLogado = await UsuariosTable().queryRows(
        queryFn: (q) => q.eq(
          'uuid',
          currentUserUid,
        ),
      );
      setState(() {
        FFAppState().permissionBiometria =
            _model.retornoUsuarioLogado!.first.isBiometrics!;
        FFAppState().TokenBibleAPI = valueOrDefault<String>(
          _model.retornoUsuarioLogado?.first.tokenBible,
          '-',
        );
        FFAppState().token = valueOrDefault<String>(
          _model.retornoUsuarioLogado?.first.fcmtoken,
          '-',
        );
      });
      _model.resultadoVersionsBible =
          await APIBibliaGroup.getVersionsBibleCall.call(
        authorizationToken: FFAppState().TokenBibleAPI,
      );
      _model.resultadoNotificacoesHome = await NotNotificacaoTable().queryRows(
        queryFn: (q) => q.eq(
          'fcmtoken',
          valueOrDefault<String>(
            FFAppState().token,
            '-',
          ),
        ),
      );
      setState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(115.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              width: 320.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'lrhurybw' /* Account Options */,
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.close_rounded,
                                  color: Color(0xFF57636C),
                                  size: 32.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 8.0, 12.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    storageFolderPath: 'fotos',
                                    maxWidth: 36.00,
                                    maxHeight: 36.00,
                                    imageQuality: 100,
                                    allowPhoto: true,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls =
                                          await uploadSupabaseStorageFiles(
                                        bucketName: 'imagens',
                                        selectedFiles: selectedMedia,
                                      );
                                    } finally {
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl =
                                            downloadUrls.first;
                                      });
                                    } else {
                                      setState(() {});
                                      return;
                                    }
                                  }

                                  await UsuariosTable().update(
                                    data: {
                                      'foto': valueOrDefault<String>(
                                        _model.uploadedFileUrl,
                                        'https://alkmufrxuvlyujpofkir.supabase.co/storage/v1/object/public/imagens/foto_pessoa.png?t=2024-05-08T14%3A25%3A22.866Z',
                                      ),
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'uuid',
                                      currentUserUid,
                                    ),
                                  );
                                  setState(() {
                                    FFAppState().fotoUserLogado =
                                        _model.uploadedFileUrl;
                                  });
                                  setState(
                                      () => _model.requestCompleter = null);
                                  await _model.waitForRequestCompleted();
                                },
                                child: Container(
                                  width: 70.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    _model.retornoUsuarioLogado
                                                        ?.first.foto,
                                                    'https://alkmufrxuvlyujpofkir.supabase.co/storage/v1/object/public/imagens/foto_pessoa.png?t=2024-05-08T14%3A25%3A22.866Z',
                                                  ),
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    1.94, -4.83),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 32.0, 0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.camera,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                currentUserEmail,
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: const Color(0xFF4B39EF),
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 8.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '3vl3qbyg' /* Pontuação: 100 */,
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
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFE0E3E7),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ujadworu' /* Linguagem da Bíblia */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Container(
                                height: 40.0,
                                decoration: const BoxDecoration(),
                                child: Visibility(
                                  visible:
                                      _model.resultadoVersionsBible != null,
                                  child: Builder(
                                    builder: (context) {
                                      final lVVersionBible =
                                          APIBibliaGroup.getVersionsBibleCall
                                                  .version(
                                                    (_model.resultadoVersionsBible
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.toList() ??
                                              [];
                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: lVVersionBible.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 8.0),
                                        itemBuilder:
                                            (context, lVVersionBibleIndex) {
                                          final lVVersionBibleItem =
                                              lVVersionBible[
                                                  lVVersionBibleIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().versionBible =
                                                    valueOrDefault<String>(
                                                  lVVersionBibleItem,
                                                  'nvi',
                                                );
                                              });
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000));
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              width: 50.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(16.0),
                                                  topLeft:
                                                      Radius.circular(16.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    functions
                                                        .convertToUppercase(
                                                            valueOrDefault<
                                                                String>(
                                                      lVVersionBibleItem,
                                                      '-',
                                                    )),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFE0E3E7),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 4.0),
                        child: MouseRegion(
                          opaque: false,
                          cursor: SystemMouseCursors.basic ?? MouseCursor.defer,
                          onEnter: ((event) async {
                            setState(() => _model.mouseRegionHovered1 = true);
                          }),
                          onExit: ((event) async {
                            setState(() => _model.mouseRegionHovered1 = false);
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.mouseRegionHovered1
                                  ? const Color(0xFFF1F4F8)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: Color(0xFF14181B),
                                      size: 20.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'pd3rsbpb' /* Settings */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              color: const Color(0xFF14181B),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 4.0),
                        child: MouseRegion(
                          opaque: false,
                          cursor: SystemMouseCursors.basic ?? MouseCursor.defer,
                          onEnter: ((event) async {
                            setState(() => _model.mouseRegionHovered2 = true);
                          }),
                          onExit: ((event) async {
                            setState(() => _model.mouseRegionHovered2 = false);
                          }),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: 300.0,
                                        child: CompChangePasswordWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.mouseRegionHovered2
                                    ? const Color(0xFFF1F4F8)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.password_sharp,
                                        color: Color(0xFF14181B),
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '2cehfu5a' /* Change Password */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFF14181B),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F4F8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setDarkModeSetting(
                                          context, ThemeMode.light);
                                    },
                                    child: Container(
                                      width: 115.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.light
                                            ? Colors.white
                                            : const Color(0xFFF1F4F8),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? const Color(0xFFE0E3E7)
                                              : const Color(0xFFF1F4F8),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.wb_sunny_rounded,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? const Color(0xFF14181B)
                                                    : const Color(0xFF57636C),
                                            size: 16.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'adiabzz4' /* Light Mode */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.light
                                                            ? const Color(0xFF14181B)
                                                            : const Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setDarkModeSetting(
                                          context, ThemeMode.dark);
                                    },
                                    child: Container(
                                      width: 115.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : const Color(0xFFF1F4F8),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xFFE0E3E7)
                                              : const Color(0xFFF1F4F8),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.nightlight_round,
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? const Color(0xFF14181B)
                                                    : const Color(0xFF57636C),
                                            size: 16.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'f9wfb7v2' /* Dark Mode */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? const Color(0xFF14181B)
                                                            : const Color(0xFF57636C),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'containerOnActionTriggerAnimation']!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFE0E3E7),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: MouseRegion(
                          opaque: false,
                          cursor: SystemMouseCursors.click ?? MouseCursor.defer,
                          onEnter: ((event) async {
                            setState(() => _model.mouseRegionHovered3 = true);
                          }),
                          onExit: ((event) async {
                            setState(() => _model.mouseRegionHovered3 = false);
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _model.mouseRegionHovered3
                                  ? const Color(0xFFF1F4F8)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  await authManager.signOut();
                                  GoRouter.of(context).clearRedirectLocation();

                                  context.goNamedAuth(
                                      'LoginPage', context.mounted);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.login_rounded,
                                        color: Color(0xFF14181B),
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '0wbxm6m8' /* Log out */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: const Color(0xFF14181B),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Container(
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          child: Container(
                            width: 60.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                width: 2.0,
                              ),
                            ),
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      FFAppState().fotoUserLogado,
                                      'https://alkmufrxuvlyujpofkir.supabase.co/storage/v1/object/public/imagens/foto_pessoa.png?t=2024-05-08T14%3A25%3A22.866Z',
                                    ),
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 32.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'yv3m9q1m' /* Home */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Notificacao');
                        },
                        child: Stack(
                          children: [
                            badges.Badge(
                              badgeContent: Text(
                                _model.resultadoNotificacoesHome!.length
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              showBadge:
                                  _model.resultadoNotificacoesHome!.isNotEmpty,
                              shape: badges.BadgeShape.circle,
                              badgeColor: FlutterFlowTheme.of(context).primary,
                              elevation: 4.0,
                              position: badges.BadgePosition.topStart(),
                              animationType: badges.BadgeAnimationType.scale,
                              toAnimate: true,
                              child: Icon(
                                Icons.notifications_none,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 36.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        decoration: const BoxDecoration(),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'ra2xp5kg' /* With God Devotionals */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 300.0,
                            height: 400.0,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FutureBuilder<List<OptionsCardMenuRow>>(
                                future: (_model.requestCompleter ??=
                                        Completer<List<OptionsCardMenuRow>>()
                                          ..complete(
                                              OptionsCardMenuTable().queryRows(
                                            queryFn: (q) => q.eq(
                                              'isShow',
                                              true,
                                            ),
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          size: 40.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<OptionsCardMenuRow>
                                      gridViewOptionsCardMenuRowList =
                                      snapshot.data!;
                                  return GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 1.0,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        gridViewOptionsCardMenuRowList.length,
                                    itemBuilder: (context, gridViewIndex) {
                                      final gridViewOptionsCardMenuRow =
                                          gridViewOptionsCardMenuRowList[
                                              gridViewIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (gridViewOptionsCardMenuRow
                                                    .pageUrl ==
                                                'bible') {
                                              context.pushNamed(
                                                'Biblia',
                                                queryParameters: {
                                                  'groupId': serializeParam(
                                                    '1,2,3,4,5,6,7,8',
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            } else {
                                              if (gridViewOptionsCardMenuRow
                                                      .pageUrl ==
                                                  'devotionals') {
                                                context.pushNamed(
                                                  'DevotionalList',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .rightToLeft,
                                                    ),
                                                  },
                                                );
                                              } else {
                                                if (gridViewOptionsCardMenuRow
                                                        .pageUrl ==
                                                    'anuncios') {
                                                  context.pushNamed(
                                                    'Anuncios',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  context.pushNamed(
                                                    'Quiz',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                }
                                              }
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(16.0),
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      if (gridViewOptionsCardMenuRow
                                                              .pageUrl ==
                                                          'devotionals')
                                                        Icon(
                                                          Icons.book,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 64.0,
                                                        ),
                                                      if (gridViewOptionsCardMenuRow
                                                              .pageUrl ==
                                                          'bible')
                                                        Icon(
                                                          Icons.menu_book,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 64.0,
                                                        ),
                                                      if (gridViewOptionsCardMenuRow
                                                              .pageUrl ==
                                                          'anuncios')
                                                        Icon(
                                                          Icons.dvr,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 64.0,
                                                        ),
                                                      if (gridViewOptionsCardMenuRow
                                                              .pageUrl ==
                                                          'quiz')
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .unity,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 64.0,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    functions.convertToUppercase(
                                                        gridViewOptionsCardMenuRow
                                                            .nome),
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlutterFlowAdBanner(
                          height: 90.0,
                          showsTestAd: true,
                          iOSAdUnitID: 'ca-app-pub-8203324650722374/8939292144',
                          androidAdUnitID:
                              'ca-app-pub-8203324650722374/1997324010',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
