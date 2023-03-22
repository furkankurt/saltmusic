import 'package:flutter/material.dart';
// coverage:ignore-file

extension CenterX on Widget {
  Widget toCenter() {
    return Center(
      child: this,
    );
  }

  Widget toAlign(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }
}
