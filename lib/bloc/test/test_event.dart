import 'package:equatable/equatable.dart';

class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class TestsRequested extends TestEvent {}

class TestsReset extends TestEvent {}