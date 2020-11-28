import 'package:alhambra_calculator/providers/game_provider.dart';
import 'package:alhambra_calculator/widgets/player/player_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerCardListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameProvider gameProvider = Provider.of(context);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: gameProvider.playerListAtivos.length,
        itemBuilder: (ctx, index) => PlayerCardWidget(gameProvider.playerListAtivos[index]),
      ),
    );
  }
}
