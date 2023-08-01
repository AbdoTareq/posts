class ServerResponse {
  dynamic errors;
  dynamic data;

  ServerResponse({
    this.errors,
    this.data,
  });

  ServerResponse.fromJson(Map<String, dynamic> json) {
    errors = json['errors'] ?? json['error'];
    data = json['data'] ?? json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!;
    }
    return data;
  }
}
