import 'package:alhambra_calculator/helpers/tile_helper.dart';
import 'package:alhambra_calculator/widgets/tile/tile_avatar_widget.dart';
import 'package:flutter/material.dart';

class TileColorBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _createPlayerSwitch() {
      List<Widget> widgets = [];
      for (TileColor tileColor in TileColor.values) {
        widgets.add(TileAvatarWidget(null, null, tileColor));
      }
      return widgets;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ..._createPlayerSwitch(),
      ],
    );
  }
}
