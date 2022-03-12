import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/bloc/age_calculator_bloc.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key, required this.focusNode, required this.ageController})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      focusNode: focusNode,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.blue, width: 1),
        minimumSize: const Size(175, 50),
      ),
      onPressed: () {
        BlocProvider.of<AgeCalculatorBloc>(context)
            .add(GetStage(ageval: ageController.text.toString()));
      },
      icon: const Icon(Icons.flutter_dash),
      label: const Text('Calculate'),
    );
  }
}
