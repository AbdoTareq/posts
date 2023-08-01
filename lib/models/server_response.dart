class ServerResponse {
  dynamic errors;
  List<dynamic> data;

  ServerResponse({
    this.errors,
    required this.data,
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    return ServerResponse(
      errors: json['errors'] as dynamic,
      data: List<dynamic>.from(
          (json['data'] ?? const <dynamic>[]) as List<dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    data['data'] = this.data;
    return data;
  }
}
