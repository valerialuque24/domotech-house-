import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'display_received_data_model.dart';
export 'display_received_data_model.dart';

class DisplayReceivedDataWidget extends StatefulWidget {
  const DisplayReceivedDataWidget({super.key});

  @override
  State<DisplayReceivedDataWidget> createState() =>
      _DisplayReceivedDataWidgetState();
}

class _DisplayReceivedDataWidgetState extends State<DisplayReceivedDataWidget> {
  late DisplayReceivedDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisplayReceivedDataModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Received data',
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0.0,
              ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              _model.data,
              '-',
            ),
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0.0,
                  lineHeight: 1.4,
                ),
          ),
        ),
      ],
    );
  }
}
