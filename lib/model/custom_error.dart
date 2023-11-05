class CustomError {
  CustomError(this.message);
  final String message;

  // TODO: make custom message by error type
  factory CustomError.fromObject(Object e) {
    return CustomError(e.toString());
  }

  factory CustomError.emptyData() {
    return CustomError("EmptyData");
  }
}
