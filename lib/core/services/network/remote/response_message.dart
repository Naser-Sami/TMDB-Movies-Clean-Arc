
// ignore_for_file: constant_identifier_names

class ResponseMessage {
  // success with data
  static const String SUCCESS = "success";
  // success with no data (no content)
  static const String NO_CONTENT = "success";
  // failure, API rejected request
  static const String BAD_REQUEST = "Bad request, Try again later";
  // failure, user is not authorized
  static const String UNAUTHORIZED = "User is unauthorized, Try again later";
  //  failure, API rejected request
  static const String FORBIDDEN = "Forbidden request, Try again later";
  // failure, crash in server side
  static const String INTERNAL_SERVER_ERROR =
      "Some thing went wrong, Try again later";
  static const String NOT_FOUND =
      "Some thing went wrong, Try again later"; // failure, crash in server side
  // local status code
  static const String CONNECT_TIMEOUT = "Time out error, Try again later";
  static const String CANCEL = "Request was cancelled, Try again later";
  static const String RECEIVE_TIMEOUT = "Time out error, Try again later";
  static const String SEND_TIMEOUT = "Time out error, Try again later";
  static const String CACHE_ERROR = "Cache error, Try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";
  static const String DEFAULT = "Some thing went wrong, Try again later";
}
