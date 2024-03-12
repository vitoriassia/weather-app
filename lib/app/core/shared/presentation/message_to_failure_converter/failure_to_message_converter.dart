abstract class FailureToMessageConverter<T> {
  FailureToMessageConverter call(T failure);

  String get message;
  String? get description;
}
