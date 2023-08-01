class ServerResponse {
  dynamic message;
  dynamic errors;
  num? total;
  dynamic data;
  String? token;
  Links? links;
  Meta? meta;
  int? unreadCount;
  //! use it only on response of upload order photo bank payment request
  String? invoicePdf;
  //! use it only on response of addresses
  String? verifyCode;

  ServerResponse(
      {this.message, this.errors, this.data, this.total, this.token, this.invoicePdf, this.verifyCode});

  ServerResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errors = json['errors'] ?? json['error'];
    total = json['total'];
    data = json['data'] ?? json['order'];
    token = json['token'];
    invoicePdf = json['invoice_pdf'];
    verifyCode = json['verify_code'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    unreadCount = json['unread_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['total'] = this.total;
    data['errors'] = this.errors;
    data['invoice_pdf'] = this.invoicePdf;
    data['verify_code'] = this.verifyCode;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!;
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['unread_count'] = this.unreadCount;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<InternalLinks>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage, this.from, this.lastPage, this.links, this.path, this.perPage, this.to, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <InternalLinks>[];
      json['links'].forEach((v) {
        links!.add(new InternalLinks.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class InternalLinks {
  String? url;
  String? label;
  bool? active;

  InternalLinks({this.url, this.label, this.active});

  InternalLinks.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
