import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'comp_anuncio_edit_model.dart';
export 'comp_anuncio_edit_model.dart';

class CompAnuncioEditWidget extends StatefulWidget {
  const CompAnuncioEditWidget({
    super.key,
    this.prmIdAdvert,
    this.prmImagesPath,
  });

  final String? prmIdAdvert;
  final List<String>? prmImagesPath;

  @override
  State<CompAnuncioEditWidget> createState() => _CompAnuncioEditWidgetState();
}

class _CompAnuncioEditWidgetState extends State<CompAnuncioEditWidget> {
  late CompAnuncioEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompAnuncioEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.prmIdAdvert != null && widget.prmIdAdvert != '') {
        _model.retornoAdverts = await AdvertsTable().queryRows(
          queryFn: (q) => q.eq(
            'id',
            widget.prmIdAdvert,
          ),
        );
        // SetNomeEmpresa
        setState(() {
          _model.txtNomeEmpresaTextController?.text = valueOrDefault<String>(
            _model.retornoAdverts?.first.nomeEmpresa,
            '-',
          );
        });
        // SetEndereco
        setState(() {
          _model.txtEnderecoTextController?.text = valueOrDefault<String>(
            _model.retornoAdverts?.first.endereco,
            '-',
          );
        });
        // SetDescricao
        setState(() {
          _model.txtDescricaoTextController?.text = valueOrDefault<String>(
            _model.retornoAdverts?.first.descricao,
            '-',
          );
        });
        // SetTelefone
        setState(() {
          _model.txtTelefoneTextController?.text = valueOrDefault<String>(
            _model.retornoAdverts?.first.telefone,
            '-',
          );
        });
        // SetInstagran
        setState(() {
          _model.txtInstagranTextController?.text = valueOrDefault<String>(
            _model.retornoAdverts?.first.intagranLink,
            '-',
          );
        });
        // SetSite
        setState(() {
          _model.txtSiteTextController?.text = valueOrDefault<String>(
            _model.retornoAdverts?.first.paginaWebLink,
            '-',
          );
        });
        // SetEmail
        setState(() {
          _model.txtEmailTextController?.text = valueOrDefault<String>(
            _model.retornoAdverts?.first.email,
            '-',
          );
        });
        // SetServico
        setState(() {
          _model.dpdServicoValueController?.value = valueOrDefault<String>(
            _model.retornoAdverts?.first.segmento,
            '-',
          );
        });
        // SetPais
        setState(() {
          _model.dpdPaisValueController?.value = valueOrDefault<String>(
            _model.retornoAdverts?.first.pais,
            '-',
          );
        });
      }
    });

    _model.txtNomeEmpresaTextController ??= TextEditingController();
    _model.txtNomeEmpresaFocusNode ??= FocusNode();

    _model.txtEnderecoTextController ??= TextEditingController();
    _model.txtEnderecoFocusNode ??= FocusNode();

    _model.txtDescricaoTextController ??= TextEditingController();
    _model.txtDescricaoFocusNode ??= FocusNode();

    _model.txtTelefoneTextController ??= TextEditingController();
    _model.txtTelefoneFocusNode ??= FocusNode();

    _model.txtInstagranTextController ??= TextEditingController();
    _model.txtInstagranFocusNode ??= FocusNode();

    _model.txtSiteTextController ??= TextEditingController();
    _model.txtSiteFocusNode ??= FocusNode();

    _model.txtEmailTextController ??= TextEditingController();
    _model.txtEmailFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlutterFlowDropDown<String>(
                  controller: _model.dpdServicoValueController ??=
                      FormFieldController<String>(
                    _model.dpdServicoValue ??= '',
                  ),
                  options: List<String>.from(
                      ['Salão', 'Igreja', 'Ferramentas', 'Outros']),
                  optionLabels: [
                    FFLocalizations.of(context).getText(
                      'wahtedh3' /* Salão */,
                    ),
                    FFLocalizations.of(context).getText(
                      'cv67fomm' /* Igreja */,
                    ),
                    FFLocalizations.of(context).getText(
                      'ntt80rs3' /* Ferramentas */,
                    ),
                    FFLocalizations.of(context).getText(
                      'cecl4116' /* Outros */,
                    )
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dpdServicoValue = val),
                  width: double.infinity,
                  height: 56.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    '03qis1y5' /* Selecione tipo Serviço */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                FlutterFlowDropDown<String>(
                  controller: _model.dpdPaisValueController ??=
                      FormFieldController<String>(
                    _model.dpdPaisValue ??= '1',
                  ),
                  options: List<String>.from(['1', '2', '3']),
                  optionLabels: [
                    FFLocalizations.of(context).getText(
                      'tnxm1sj6' /* Brasil */,
                    ),
                    FFLocalizations.of(context).getText(
                      'sumah71p' /* EUA */,
                    ),
                    FFLocalizations.of(context).getText(
                      'ztipeg9v' /* México */,
                    )
                  ],
                  onChanged: (val) => setState(() => _model.dpdPaisValue = val),
                  width: double.infinity,
                  height: 56.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'uihy1t66' /* País */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).alternate,
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                TextFormField(
                  controller: _model.txtNomeEmpresaTextController,
                  focusNode: _model.txtNomeEmpresaFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'pwnm09x0' /* Empresa */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  validator: _model.txtNomeEmpresaTextControllerValidator
                      .asValidator(context),
                ),
                TextFormField(
                  controller: _model.txtEnderecoTextController,
                  focusNode: _model.txtEnderecoFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'wdtdh0m4' /* Endereço */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  validator: _model.txtEnderecoTextControllerValidator
                      .asValidator(context),
                ),
                TextFormField(
                  controller: _model.txtDescricaoTextController,
                  focusNode: _model.txtDescricaoFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      '6iblev6g' /* Descrição */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  maxLength: 300,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  validator: _model.txtDescricaoTextControllerValidator
                      .asValidator(context),
                ),
                TextFormField(
                  controller: _model.txtTelefoneTextController,
                  focusNode: _model.txtTelefoneFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'laluaco8' /* Telefone */,
                    ),
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  keyboardType: TextInputType.phone,
                  validator: _model.txtTelefoneTextControllerValidator
                      .asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                ),
                TextFormField(
                  controller: _model.txtInstagranTextController,
                  focusNode: _model.txtInstagranFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'h9l96fr5' /* Instagran */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  validator: _model.txtInstagranTextControllerValidator
                      .asValidator(context),
                ),
                TextFormField(
                  controller: _model.txtSiteTextController,
                  focusNode: _model.txtSiteFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      'u5ma6p1x' /* Site */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  keyboardType: TextInputType.url,
                  validator: _model.txtSiteTextControllerValidator
                      .asValidator(context),
                ),
                TextFormField(
                  controller: _model.txtEmailTextController,
                  focusNode: _model.txtEmailFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    hintText: FFLocalizations.of(context).getText(
                      '3rnv553j' /* Email */,
                    ),
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Manrope',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _model.txtEmailTextControllerValidator
                      .asValidator(context),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) {
                        final lVImagens = _model.imagensAnuncio.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: lVImagens.length,
                          itemBuilder: (context, lVImagensIndex) {
                            final lVImagensItem = lVImagens[lVImagensIndex];
                            return Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        lVImagensItem,
                                        '-',
                                      ),
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await deleteSupabaseFileFromPublicUrl(
                                          valueOrDefault<String>(
                                        lVImagensItem,
                                        '-',
                                      ));
                                      setState(() {
                                        _model.removeFromImagensAnuncio(
                                            valueOrDefault<String>(
                                          lVImagensItem,
                                          '-',
                                        ));
                                      });
                                    },
                                    child: FaIcon(
                                      FontAwesomeIcons.trashAlt,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              storageFolderPath: 'adverts',
                              maxWidth: 100.00,
                              maxHeight: 100.00,
                              imageQuality: 100,
                              allowPhoto: true,
                              includeDimensions: true,
                              includeBlurHash: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = await uploadSupabaseStorageFiles(
                                  bucketName: 'imagens',
                                  selectedFiles: selectedMedia,
                                );
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }

                            setState(() {
                              _model
                                  .addToImagensAnuncio(_model.uploadedFileUrl);
                            });
                          },
                          text: FFLocalizations.of(context).getText(
                            'i18ciwov' /* Inserir Imagens */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Manrope',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                  ].divide(const SizedBox(height: 8.0)),
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            if (_model.dpdServicoValue == null) {
                              return;
                            }
                            if (_model.dpdPaisValue == null) {
                              return;
                            }
                            if ((_model.uploadedLocalFile.bytes ?? [])
                                    .isEmpty) {
                              return;
                            }
                            _model.retornoInsertAnuncio =
                                await AdvertsTable().insert({
                              'pais': _model.dpdPaisValue,
                              'descricao':
                                  _model.txtDescricaoTextController.text,
                              'intagranLink':
                                  _model.txtInstagranTextController.text,
                              'nomeEmpresa':
                                  _model.txtNomeEmpresaTextController.text,
                              'paginaWebLink':
                                  _model.txtSiteTextController.text,
                              'telefone': _model.txtTelefoneTextController.text,
                              'email': _model.txtEmailTextController.text,
                              'endereco': _model.txtEnderecoTextController.text,
                              'segmento': valueOrDefault<String>(
                                _model.dpdServicoValue,
                                '4',
                              ),
                              'user_id': valueOrDefault<String>(
                                currentUserUid,
                                '-',
                              ),
                              'fotos': _model.imagensAnuncio,
                            });
                            if (_model.retornoInsertAnuncio?.id != null &&
                                _model.retornoInsertAnuncio?.id != '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Anúncio inserido com sucesso',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              setState(() {
                                _model.dpdServicoValueController?.reset();
                                _model.dpdPaisValueController?.reset();
                              });
                              setState(() {
                                _model.txtNomeEmpresaTextController?.clear();
                                _model.txtEnderecoTextController?.clear();
                                _model.txtDescricaoTextController?.clear();
                                _model.txtTelefoneTextController?.clear();
                                _model.txtInstagranTextController?.clear();
                                _model.txtSiteTextController?.clear();
                                _model.txtEmailTextController?.clear();
                              });
                              setState(() {
                                _model.imagensAnuncio = [];
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Erro ao inserir o anúncio, tente novamente mais tarde!',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }

                            setState(() {});
                          },
                          text: FFLocalizations.of(context).getText(
                            '7tc5wskx' /* Salvar */,
                          ),
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).success,
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
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ].divide(const SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
