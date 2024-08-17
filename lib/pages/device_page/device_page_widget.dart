import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/widgets/display_received_data/display_received_data_widget.dart';
import '/widgets/strength_indicator/strength_indicator_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'device_page_model.dart';
export 'device_page_model.dart';

class DevicePageWidget extends StatefulWidget {
  const DevicePageWidget({
    super.key,
    required this.deviceName,
    required this.deviceId,
    required this.deviceRssi,
    required this.hasWriteCharacteristic,
  });

  final String? deviceName;
  final String? deviceId;
  final int? deviceRssi;
  final bool? hasWriteCharacteristic;

  @override
  State<DevicePageWidget> createState() => _DevicePageWidgetState();
}

class _DevicePageWidgetState extends State<DevicePageWidget> {
  late DevicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevicePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentRssi = widget.deviceRssi;
      setState(() {});
      _model.rssiUpdateTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 2000),
        callback: (timer) async {
          _model.updatedRssi = await actions.getRssi(
            BTDeviceStruct(),
          );
          _model.currentRssi = _model.updatedRssi;
          setState(() {});
        },
        startImmediately: true,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF031837),
        appBar: AppBar(
          backgroundColor: const Color(0xFF031837),
          automaticallyImplyLeading: true,
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.deviceName,
                        'deviceName',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                          ),
                    ),
                    if (_model.currentRssi != null)
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.strengthIndicatorModel,
                          updateCallback: () => setState(() {}),
                          child: const StrengthIndicatorWidget(),
                        ),
                      ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.deviceId,
                      'deviceld',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 100.0, 0.0),
                child: Container(
                  width: 16.0,
                  height: 54.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF031837),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  buttonSize: 45.0,
                  icon: Icon(
                    Icons.bluetooth_disabled_rounded,
                    color: FlutterFlowTheme.of(context).error,
                    size: 28.0,
                  ),
                  onPressed: () async {
                    await actions.disconnectDevice(
                      BTDeviceStruct(
                        name: widget.deviceName,
                      ),
                    );
                    context.safePop();
                  },
                ),
              ],
            ),
          ],
          centerTitle: true,
          elevation: 4.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 0.0),
                  child: Text(
                    'You can send data to the connected device \nand receive data back from it.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 200.0,
                    child: Container(
                      height: 200.0,
                    ),
                  ),
                  Container(
                    height: 200.0,
                  ),
                  Container(
                    height: 200.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController,
                        focusNode: _model.textFieldFocusNode,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Enter data to send...',
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF4B39EF),
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
                          filled: true,
                          fillColor: const Color(0x294B39EF),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                        validator:
                            _model.textControllerValidator.asValidator(context),
                      ),
                    ),
                  ),
                  Container(
                    height: 200.0,
                  ),
                  Container(
                    height: 200.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 6.0, 15.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      buttonSize: 50.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      showLoadingIndicator: true,
                      onPressed: () async {
                        await actions.sendData(
                          BTDeviceStruct(
                            name: widget.deviceName,
                            id: widget.deviceId,
                            rssi: _model.currentRssi,
                          ),
                          (_model.textFieldFocusNode?.hasFocus ?? false)
                              .toString(),
                        );
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Data sent to device',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            duration: const Duration(milliseconds: 2000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).success,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 200.0,
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: wrapWithModel(
                      model: _model.displayReceivedDataModel,
                      updateCallback: () => setState(() {}),
                      child: const DisplayReceivedDataWidget(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
