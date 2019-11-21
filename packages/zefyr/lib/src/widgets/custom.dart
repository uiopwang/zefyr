// Copyright (c) 2018, the Zefyr project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:notus/notus.dart';

abstract class ZefyrCustomDelegate {
  /// Builds image widget for specified custom.
  ///
  Widget buildCustom(BuildContext context, BlockNode node);
}

class ZefyrCustom extends StatefulWidget {
  const ZefyrCustom({Key key, @required this.node, @required this.delegate})
      : super(key: key);

  final BlockNode node;
  final ZefyrCustomDelegate delegate;

  @override
  _ZefyrCustomState createState() => _ZefyrCustomState();
}

class _ZefyrCustomState extends State<ZefyrCustom> {
  BlockNode get nodeSource => widget.node;

  @override
  Widget build(BuildContext context) {
    if (widget.delegate == null) return Container();

    final image = widget.delegate.buildCustom(context, nodeSource);
    return image;
  }
}
