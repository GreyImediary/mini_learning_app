import 'package:equatable/equatable.dart';
import 'package:mini_learning_app/model/test/test_card_data/test_card_data.dart';

class TestState extends Equatable {

  const TestState();

  @override
  List<Object> get props => [];
}

class TestInitial extends TestState {}

class TestsSuccess extends TestState {
  final List<TestCardData> tests;

  TestsSuccess(this.tests);

  @override
  List<Object> get props => [tests];
}