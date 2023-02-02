// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dotted_border/dotted_border.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

class DocumentCameraSelector extends StatelessWidget {
  final VoidCallback onTap;
  final String description;
  final String documentType;

  const DocumentCameraSelector({
    required this.onTap,
    required this.documentType,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              DottedBorder(
                dashPattern: const <double>[8],
                color: Colors.blueGrey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                borderType: BorderType.RRect,
                strokeWidth: 0.5,
                strokeCap: StrokeCap.round,
                radius: const Radius.circular(5),
                child: const SizedBox(
                  height: 100,
                  width: 200,
                  child:
                      Icon(Icons.camera_alt, size: 80, color: Colors.blueGrey),
                ),
              ),
              mediumVerticalSizedBox,
              Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                'of $documentType card',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
