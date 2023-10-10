
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_page_model.dart';
export 'new_page_model.dart';

class NewPageWidget extends StatefulWidget {
  const NewPageWidget({Key? key}) : super(key: key);

  @override
  _NewPageWidgetState createState() => _NewPageWidgetState();
}

class _NewPageWidgetState extends State<NewPageWidget> {
  late NewPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewPageModel());

    _model.textController ??= TextEditingController();
    _model.textController ??= TextEditingController();
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
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32, 32, 32, 32),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Inicio de Sesión',
                    style: FlutterTheme.of(context).displaySmall,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: TextFormField(
                      controller: _model.textController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Correo Electrónico',
                        hintStyle: FlutterTheme.of(context).bodyLarge,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      style: FlutterTheme.of(context).bodyLarge,
                      validator:
                      _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: TextFormField(
                      controller: _model.textController,
                      obscureText: !_model.passwordVisibility,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        hintStyle: FlutterTheme.of(context).bodyLarge,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterTheme.of(context).alternate,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                                () => _model.passwordVisibility =
                            !_model.passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            _model.passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: FlutterTheme.of(context).secondaryText,
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterTheme.of(context).bodyLarge,
                      validator:
                      _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Boton pressed ...');
                      },
                      text: 'Iniciar Sesión',
                      options: FFButtonOptions(
                        width: 370,
                        height: 44,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterTheme.of(context).primary,
                        textStyle:
                        FlutterTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.white,
                        ),
                        elevation: 3,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Boton pressed ...');
                      },
                      text: 'Restablecer Contraseña',
                      options: FFButtonOptions(
                        width: 370,
                        height: 44,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterTheme.of(context).secondaryBackground,
                        textStyle:
                        FlutterTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 0,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Text(
                      'Al iniciar sesión, aceptas los',
                      style: FlutterTheme.of(context).bodySmall,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Términos y Condiciones',
                        style: FlutterTheme.of(context).bodySmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterTheme.of(context).primary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                        child: Text(
                          'y',
                          style: FlutterTheme.of(context).bodySmall,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'Política de Privacidad',
                          style:
                          FlutterTheme.of(context).bodySmall.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: FlutterTheme.of(context).primary,
                          ),
                        ),
                      ),
                    ],
                  ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Olvidó su contraseña?',
                      style: FlutterTheme.of(context).bodySmall.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: FlutterTheme.of(context).primaryText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Text(
                        'Restablecer Contraseña',
                        style: FlutterTheme.of(context).bodySmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterTheme.of(context).primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                      value: _model.value ??= true,
                      onChanged: (newValue) async {
                        setState(() => _model.value = newValue!);
                      },
                      activeColor: FlutterTheme.of(context).primaryText,
                      activeTrackColor:
                      FlutterTheme.of(context).secondaryText,
                      inactiveTrackColor:
                      FlutterTheme.of(context).primaryBackground,
                      inactiveThumbColor:
                      FlutterTheme.of(context).secondaryText,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 6),
                      child: Text(
                        'Acepto los Términos y Condiciones',
                        style: FlutteTheme.of(context).bodySmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: FlutterTheme.of(context).primaryText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Boton press ...');
                  },
                  text: 'Iniciar Sesión con Google',
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    size: 20,
                  ),
                  options: FFButtonOptions(
                    width: 200,
                    height: 50,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdTheme.of(context).secondaryBackground,
                    textStyle:
                    FlutterTheme.of(context).titleMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: FlutterTheme.of(context).primaryText,
                    ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: FlutterTheme.of(context).primaryBackground,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Boton press...');
                  },
                  text: 'Iniciar Sesión con Apple',
                  icon: FaIcon(
                    FontAwesomeIcons.apple,
                    size: 20,
                  ),
                  options: FFButtonOptions(
                    width: 200,
                    height: 50,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterTheme.of(context).secondaryBackground,
                    textStyle:
                    FlutterTheme.of(context).titleMedium.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: FlutterTheme.of(context).primaryText,
                    ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: FlutterTheme.of(context).primaryBackground,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Container(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Text(
                    'Al iniciar sesión, aceptas los Términos y Condiciones',
                    style: FlutterTheme.of(context).bodySmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: FlutterTheme.of(context).primaryText,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.security_rounded,
                              color: FlutterTheme.of(context).primaryText,
                              size: 24,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Text(
                                  'Captcha',
                                  style: FlutterTheme.of(context)
                                      .bodySmall
                                      .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.90, 0.00),
                                child: Icon(
                                  Icons.refresh_rounded,
                                  color:
                                  FlutterTheme.of(context).primaryText,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
