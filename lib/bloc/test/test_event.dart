import 'package:equatable/equatable.dart';

class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class TestsRequested extends TestEvent {}

class TestsReset extends TestEvent {}

class TestRequested extends TestEvent {
  final int id;

  TestRequested(this.id);

  @override
  List<Object> get props => [id];
}