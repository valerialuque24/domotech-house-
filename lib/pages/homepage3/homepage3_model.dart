import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage3_widget.dart' show Homepage3Widget;
import 'package:flutter/material.dart';

class Homepage3Model extends FlutterFlowModel<Homepage3Widget> {
  ///  Local state fields for this page.

  bool isFetchingDevices = false;

  bool isBluetoothEnabled = false;

  List<BTDeviceStruct> foundDevices = [];
  void addToFoundDevices(BTDeviceStruct item) => foundDevices.add(item);
  void removeFromFoundDevices(BTDeviceStruct item) => foundDevices.remove(item);
  void removeAtIndexFromFoundDevices(int index) => foundDevices.removeAt(index);
  void insertAtIndexInFoundDevices(int index, BTDeviceStruct item) =>
      foundDevices.insert(index, item);
  void updateFoundDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      foundDevices[index] = updateFn(foundDevices[index]);

  List<BTDeviceStruct> connectedDevices = [];
  void addToConnectedDevices(BTDeviceStruct item) => connectedDevices.add(item);
  void removeFromConnectedDevices(BTDeviceStruct item) =>
      connectedDevices.remove(item);
  void removeAtIndexFromConnectedDevices(int index) =>
      connectedDevices.removeAt(index);
  void insertAtIndexInConnectedDevices(int index, BTDeviceStruct item) =>
      connectedDevices.insert(index, item);
  void updateConnectedDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      connectedDevices[index] = updateFn(connectedDevices[index]);

  bool? isFetchingConnectedDevices = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getConnectedDevices] action in homepage3 widget.
  List<BTDeviceStruct>? fetchedConnectedDevices;
  // Stores action output result for [Custom Action - findDevices] action in homepage3 widget.
  List<BTDeviceStruct>? fetchedDevices;
  // Stores action output result for [Custom Action - getConnectedDevices] action in Icon widget.
  List<BTDeviceStruct>? fetchedConnectedDevicesCopy;
  // Stores action output result for [Custom Action - findDevices] action in Icon widget.
  List<BTDeviceStruct>? fetchedDevicesCopy;
  // Stores action output result for [Custom Action - connectDevice] action in ScannedDeviceTile widget.
  bool? hasWrite;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
