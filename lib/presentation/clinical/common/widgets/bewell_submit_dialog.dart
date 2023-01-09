// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sghi_core/shared_themes/colors.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

// Project imports:
import 'package:bewell_pro_core/domain/core/value_objects/app_string_constants.dart';
import 'package:bewell_pro_core/domain/core/value_objects/app_widget_keys.dart';
import 'package:sghi_core/ui_components/src/platform_loader.dart';

/// [BewellSubmitDialog] manages the submission/posting of data to the backend.
/// Visually it create a translucent overlay with a spinner in the middle
/// indicating the process is going on.
class BewellSubmitDialog extends StatefulWidget {
  const BewellSubmitDialog({
    required this.data,
    required this.query,
    this.customNavigation,
  });

  final Map<String, dynamic> data;
  final String query;
  final void Function(Map<String, dynamic> data)? customNavigation;

  @override
  _BewellSubmitDialogState createState() => _BewellSubmitDialogState();
}

class _BewellSubmitDialogState extends State<BewellSubmitDialog> {
  late Stream<Map<String, dynamic>> _stream;
  late StreamController<Map<String, dynamic>> _streamController;

  @override
  void initState() {
    super.initState();

    _streamController = StreamController<Map<String, dynamic>>();
    _stream = _streamController.stream;

    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {
      genericFetchFunction(
        streamController: _streamController,
        context: context,
        queryString: this.widget.query,
        variables: this.widget.data,
        logTitle: 'Generic fetch function',
      );
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double dialogSize =
        ResponsiveWidget.isLargeScreen(context) ? 200 : 120;

    return StreamBuilder<Map<String, dynamic>>(
      stream: _stream,
      builder:
          (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.hasError) {
          final Map<String, dynamic>? error =
              snapshot.error as Map<String, dynamic>?;

          final Map<String, dynamic> errorMessage = <String, dynamic>{
            'error': error!.containsKey('error') ? error['error'] : 'error'
          };

          if (widget.customNavigation != null) {
            widget.customNavigation?.call(errorMessage);
          } else {
            Future<dynamic>.delayed(const Duration()).then(
              (dynamic value) => Navigator.of(context).pop(errorMessage),
            );
          }

          return const SizedBox();
        } else if (snapshot.hasData) {
          if (snapshot.data!['loading'] != null &&
              snapshot.data!['loading'] == true) {
            return Center(
              key: AppWidgetKeys.displayLoadingLargeCenterKey,
              child: Container(
                height: dialogSize,
                width: dialogSize,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Card(
                  elevation: 0,
                  color: white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Center(child: SILPlatformLoader()),
                        mediumVerticalSizedBox,
                        Text(loadingText,
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            widget.customNavigation != null
                ? widget.customNavigation?.call(snapshot.data!)
                : Navigator.of(context).pop(snapshot.data);

            return const SizedBox();
          }
        }
        return const SizedBox();
      },
    );
  }
}
