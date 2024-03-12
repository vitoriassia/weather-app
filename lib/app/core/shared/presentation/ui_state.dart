import 'package:equatable/equatable.dart';
import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/failure_to_message_converter.dart';

abstract class UiState {}

class Initial extends Equatable implements UiState {
  @override
  List<Object?> get props => [];
}

class Loading extends Equatable implements UiState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends Equatable implements UiState {
  final Failure? failure;
  final FailureToMessageConverter converter;
  late final String message;
  late final String? description;
  ErrorState({
    required this.converter,
    this.failure,
  }) {
    message = converter.message;
    description = converter.description;
  }

  @override
  List<Object?> get props => [failure, converter, message, description];
}

class Success<T> extends Equatable implements UiState {
  final T value;

  const Success(this.value);

  @override
  List<Object?> get props => [value];
}

class PaginationLoading<T> extends Success<T> {
  const PaginationLoading(T value) : super(value);
}

class PaginationError<T> extends Success<T> {
  final FailureToMessageConverter converter;
  final Failure? failure;
  late final String message;
  late final String? description;

  PaginationError(T value, {required this.converter, this.failure})
      : super(value) {
    message = converter.message;
    description = converter.description;
  }

  @override
  List<Object?> get props => [value, converter, message, description, failure];
}
