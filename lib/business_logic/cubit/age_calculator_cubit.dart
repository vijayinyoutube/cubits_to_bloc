import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'age_calculator_state.dart';

class AgeCalculatorCubit extends Cubit<AgeCalculator> {
  AgeCalculatorCubit() : super(const AgeCalculatorInitial());

  Future<void> updateAgeVal(String ageval) async {
    if (ageval.toString().isEmpty) {
      emit(const AgeCalculatorError());
    } else {
      emit(const AgeCalculatorLoading());
      await Future.delayed(const Duration(seconds: 3), () {
        emit(AgeCalculatorLoaded(
            stageOfLife: getStage(int.parse(ageval.toString()))));
      });
    }
  }

  String getStage(int ageval) {
    if (ageval == 0 || ageval == 1) {
      return "Infant";
    } else if (ageval >= 2 && ageval <= 4) {
      return "Toddler";
    } else if (ageval >= 5 && ageval <= 12) {
      return "Child";
    } else if (ageval >= 13 && ageval <= 19) {
      return "Teen";
    } else if (ageval >= 20 && ageval <= 39) {
      return "Adult";
    } else if (ageval >= 40 && ageval <= 59) {
      return "Middle Age Adult";
    } else {
      return "Senior Adult";
    }
  }
}
