// To parse this JSON data, do
//
//     final branches = branchesFromJson(jsonString);

import 'dart:convert';

Branches branchesFromJson(String str) => Branches.fromJson(json.decode(str));

String branchesToJson(Branches data) => json.encode(data.toJson());

class Branches {
  String? name;
  Commit? commit;
  bool? protected;

  Branches({
    this.name,
    this.commit,
    this.protected,
  });

  factory Branches.fromJson(Map<String, dynamic> json) => Branches(
    name: json["name"],
    commit: json["commit"] == null ? null : Commit.fromJson(json["commit"]),
    protected: json["protected"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "commit": commit?.toJson(),
    "protected": protected,
  };
}

class Commit {
  String? sha;
  String? url;

  Commit({
    this.sha,
    this.url,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
    sha: json["sha"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "sha": sha,
    "url": url,
  };
}
