import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final bool isImage;

  const LoadingWidget({super.key, this.isImage = false, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    if (isImage) {
      return SpinKitRipple(
        size: size,
        color: Theme.of(context).colorScheme.secondary,
      );
    } else {
      return SpinKitWave(
        size: size,
        color: Theme.of(context).colorScheme.secondary,
      );
    }
  }
}
