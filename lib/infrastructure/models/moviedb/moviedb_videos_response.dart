class MovieDBVideoResponse {
    final int id;
    final List<Result> results;

    MovieDBVideoResponse({
        required this.id,
        required this.results,
    });

    factory MovieDBVideoResponse.fromJson(Map<String, dynamic> json) => MovieDBVideoResponse(
        id: json["id"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    final String iso6391;
    final String iso31661;
    final String name;
    final String key;
    final String site;
    final int size;
    final String type;
    final bool official;
    final String id;
    final DateTime publishedAt;

    Result({
        required this.iso6391,
        required this.iso31661,
        required this.name,
        required this.key,
        required this.site,
        required this.size,
        required this.type,
        required this.official,
        required this.id,
        required this.publishedAt,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        id: json["id"],
        publishedAt: DateTime.parse(json["published_at"]),
    );

    Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "id": id,
        "published_at": publishedAt.toIso8601String(),
    };
}

enum Iso31661 {
    US
}

final iso31661Values = EnumValues({
    "US": Iso31661.US
});

enum Iso6391 {
    EN
}

final iso6391Values = EnumValues({
    "en": Iso6391.EN
});

enum Site {
    YOU_TUBE
}

final siteValues = EnumValues({
    "YouTube": Site.YOU_TUBE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
