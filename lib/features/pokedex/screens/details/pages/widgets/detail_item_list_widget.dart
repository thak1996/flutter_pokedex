import 'package:flutter/material.dart';
import 'package:flutter_pokedex/common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {super.key, required this.isDiff, required this.pokemon});
  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: isDiff ? 0.4 : 1,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          tween: Tween<double>(
            end: isDiff ? 100 : 500,
            begin: isDiff ? 500 : 100,
          ),
          builder: (context, value, child) {
            return Image.network(
              pokemon.image,
              width: value,
              fit: BoxFit.contain,
              color: isDiff ? Colors.black.withOpacity(0.4) : null,
            );
          },
        ),
      ),
    );
  }
}
