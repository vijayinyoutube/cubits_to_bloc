part of 'age_calculator_cubit.dart';

@immutable
abstract class AgeCalculator {
  const AgeCalculator();
}

class AgeCalculatorInitial extends AgeCalculator {
  const AgeCalculatorInitial();
}

class AgeCalculatorLoading extends AgeCalculator {
  const AgeCalculatorLoading();
}

class AgeCalculatorLoaded extends AgeCalculator {
  final String stageOfLife;
  const AgeCalculatorLoaded({
    required this.stageOfLife,
  });
}

class AgeCalculatorError extends AgeCalculator {
  const AgeCalculatorError();
}
