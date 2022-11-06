// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PoError extends StatelessWidget {
  const PoError({Key? key, this.error}) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'Erro Durante a Operação'),
      ),
    );
  }
}
