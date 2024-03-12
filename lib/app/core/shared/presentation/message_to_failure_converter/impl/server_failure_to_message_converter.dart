import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/failure_to_message_converter.dart';

class ServerFailureMessageConverter
    implements FailureToMessageConverter<ServerFailure> {
  late String _message;
  String? _description;

  @override
  FailureToMessageConverter call(ServerFailure failure) {
    final errorResponse = failure.errorResponse;

    if (errorResponse == null) {
      _message =
          'Falha ao acessar servidor.\nVerifique sua conexão ou tente mais tarde.';
      return this;
    }
    _message = failure.message ?? errorResponse.message ?? 'Erro';

    return this;
  }

  @override
  String? get description => _description;

  @override
  String get message => _message;
}
