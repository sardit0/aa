class Berita {
  bool? success;
  String? message;
  List<DataBerita>? data;

  Berita({this.success, this.message, this.data});

  Berita.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataBerita>[];
      json['data'].forEach((v) {
        data!.add(new DataBerita.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataBerita {
  int? id;
  String? judul;
  String? slug;
  String? foto;
  String? deskripsi;
  int? idKategori;
  int? idUser;
  String? createdAt;
  String? updatedAt;
  Kategori? kategori;
  List<Tag>? tag;
  User? user;

  DataBerita(
      {this.id,
      this.judul,
      this.slug,
      this.foto,
      this.deskripsi,
      this.idKategori,
      this.idUser,
      this.createdAt,
      this.updatedAt,
      this.kategori,
      this.tag,
      this.user});

  DataBerita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    slug = json['slug'];
    foto = json['foto'];
    deskripsi = json['deskripsi'];
    idKategori = json['id_kategori'];
    idUser = json['id_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    kategori = json['kategori'] != null
        ? new Kategori.fromJson(json['kategori'])
        : null;
    if (json['tag'] != null) {
      tag = <Tag>[];
      json['tag'].forEach((v) {
        tag!.add(new Tag.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['slug'] = this.slug;
    data['foto'] = this.foto;
    data['deskripsi'] = this.deskripsi;
    data['id_kategori'] = this.idKategori;
    data['id_user'] = this.idUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.kategori != null) {
      data['kategori'] = this.kategori!.toJson();
    }
    if (this.tag != null) {
      data['tag'] = this.tag!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Kategori {
  int? id;
  String? namaKategori;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Kategori(
      {this.id, this.namaKategori, this.slug, this.createdAt, this.updatedAt});

  Kategori.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKategori = json['nama_kategori'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_kategori'] = this.namaKategori;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Tag {
  int? id;
  String? namaTag;
  String? slug;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tag(
      {this.id,
      this.namaTag,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaTag = json['nama_tag'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_tag'] = this.namaTag;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? idBerita;
  int? idTag;

  Pivot({this.idBerita, this.idTag});

  Pivot.fromJson(Map<String, dynamic> json) {
    idBerita = json['id_berita'];
    idTag = json['id_tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_berita'] = this.idBerita;
    data['id_tag'] = this.idTag;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}