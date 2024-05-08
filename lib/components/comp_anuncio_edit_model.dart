import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'comp_anuncio_edit_widget.dart' show CompAnuncioEditWidget;
import 'package:flutter/material.dart';

class CompAnuncioEditModel extends FlutterFlowModel<CompAnuncioEditWidget> {
  ///  Local state fields for this component.

  List<String> imagensAnuncio = [];
  void addToImagensAnuncio(String item) => imagensAnuncio.add(item);
  void removeFromImagensAnuncio(String item) => imagensAnuncio.remove(item);
  void removeAtIndexFromImagensAnuncio(int index) =>
      imagensAnuncio.removeAt(index);
  void insertAtIndexInImagensAnuncio(int index, String item) =>
      imagensAnuncio.insert(index, item);
  void updateImagensAnuncioAtIndex(int index, Function(String) updateFn) =>
      imagensAnuncio[index] = updateFn(imagensAnuncio[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in compAnuncioEdit widget.
  List<AdvertsRow>? retornoAdverts;
  // State field(s) for DpdServico widget.
  String? dpdServicoValue;
  FormFieldController<String>? dpdServicoValueController;
  // State field(s) for DpdPais widget.
  String? dpdPaisValue;
  FormFieldController<String>? dpdPaisValueController;
  // State field(s) for TxtNomeEmpresa widget.
  FocusNode? txtNomeEmpresaFocusNode;
  TextEditingController? txtNomeEmpresaTextController;
  String? Function(BuildContext, String?)?
      txtNomeEmpresaTextControllerValidator;
  String? _txtNomeEmpresaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0zo73dji' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for TxtEndereco widget.
  FocusNode? txtEnderecoFocusNode;
  TextEditingController? txtEnderecoTextController;
  String? Function(BuildContext, String?)? txtEnderecoTextControllerValidator;
  // State field(s) for TxtDescricao widget.
  FocusNode? txtDescricaoFocusNode;
  TextEditingController? txtDescricaoTextController;
  String? Function(BuildContext, String?)? txtDescricaoTextControllerValidator;
  String? _txtDescricaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm9eu25on' /* Field is required */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'v7ct3kgj' /* O Limite mínimo é de 3 caracte... */,
      );
    }
    if (val.length > 300) {
      return FFLocalizations.of(context).getText(
        'xsf3d87v' /* O Limite de campos é de 300 ca... */,
      );
    }

    return null;
  }

  // State field(s) for TxtTelefone widget.
  FocusNode? txtTelefoneFocusNode;
  TextEditingController? txtTelefoneTextController;
  String? Function(BuildContext, String?)? txtTelefoneTextControllerValidator;
  // State field(s) for TxtInstagran widget.
  FocusNode? txtInstagranFocusNode;
  TextEditingController? txtInstagranTextController;
  String? Function(BuildContext, String?)? txtInstagranTextControllerValidator;
  // State field(s) for TxtSite widget.
  FocusNode? txtSiteFocusNode;
  TextEditingController? txtSiteTextController;
  String? Function(BuildContext, String?)? txtSiteTextControllerValidator;
  // State field(s) for TxtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  String? _txtEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '528jt7wp' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  AdvertsRow? retornoInsertAnuncio;

  @override
  void initState(BuildContext context) {
    txtNomeEmpresaTextControllerValidator =
        _txtNomeEmpresaTextControllerValidator;
    txtDescricaoTextControllerValidator = _txtDescricaoTextControllerValidator;
    txtEmailTextControllerValidator = _txtEmailTextControllerValidator;
  }

  @override
  void dispose() {
    txtNomeEmpresaFocusNode?.dispose();
    txtNomeEmpresaTextController?.dispose();

    txtEnderecoFocusNode?.dispose();
    txtEnderecoTextController?.dispose();

    txtDescricaoFocusNode?.dispose();
    txtDescricaoTextController?.dispose();

    txtTelefoneFocusNode?.dispose();
    txtTelefoneTextController?.dispose();

    txtInstagranFocusNode?.dispose();
    txtInstagranTextController?.dispose();

    txtSiteFocusNode?.dispose();
    txtSiteTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();
  }
}
