import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/failure_to_message_converter.dart';

class DefaultFailureToMessageConverter
    implements FailureToMessageConverter<Failure> {
  late final String _message;

  @override
  FailureToMessageConverter call(Failure failure) {
    _message = failure.runtimeType.toString();
    return this;
  }

  @override
  String? get description => null;

  @override
  String get message => _message;
}
