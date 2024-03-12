import 'package:pokedex_app/app/core/services/api/errors/failures.dart';
import 'package:pokedex_app/app/core/shared/presentation/message_to_failure_converter/failure_to_message_converter.dart';

class DataBaseFailureMessageConverter
    implements FailureToMessageConverter<DataBaseFailure> {
  late String _message;
  String? _description;

  @override
  DataBaseFailureMessageConverter call(DataBaseFailure failure) {
    _message = failure.message ?? 'Erro DataBase';

    return this;
  }

  @override
  String? get description => _description;

  @override
  String get message => _message;
}
