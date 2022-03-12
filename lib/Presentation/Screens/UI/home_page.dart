import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/button.dart';
import '../../Components/spacers.dart';
import '../Widgets/text_form_field.dart';
import '../Widgets/text_data_widget.dart';
import '../../../business_logic/cubit/age_calculator_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FocusNode calculateBtnFocusNode;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    calculateBtnFocusNode = FocusNode();
    ageController = TextEditingController();
  }

  @override
  void dispose() {
    calculateBtnFocusNode.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocConsumer<AgeCalculatorCubit, AgeCalculator>(
          listener: (context, state) {
            if (state is AgeCalculatorError) {
              buildErrorLayout();
            }
          },
          builder: (context, state) {
            if (state is AgeCalculatorLoading) {
              return buildLoading();
            } else if (state is AgeCalculatorLoaded) {
              return buildLoadedInput(state.stageOfLife);
            } else {
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextData(message: ":)"),
          const HeightSpacer(myHeight: 20),
          InputField(
            focusNode: calculateBtnFocusNode,
            ageController: ageController,
          ),
          const HeightSpacer(myHeight: 10),
          ButtonWidget(
            focusNode: calculateBtnFocusNode,
            ageController: ageController,
          ),
        ],
      );

  Widget buildLoading() =>
      Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CircularProgressIndicator(),
        WidthSpacer(myWidth: 25.50),
        Text("Loading..."),
      ]);

  Widget buildLoadedInput(String data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextData(message: data),
          const HeightSpacer(myHeight: 20),
          InputField(
            focusNode: calculateBtnFocusNode,
            ageController: ageController,
          ),
          const HeightSpacer(myHeight: 10),
          ButtonWidget(
            focusNode: calculateBtnFocusNode,
            ageController: ageController,
          ),
        ],
      );

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your age!'),
        ),
      );
}
