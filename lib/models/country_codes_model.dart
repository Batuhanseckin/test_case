// To parse this JSON data, do
//
//     final countryCodesModel = countryCodesModelFromJson(jsonString);

import 'dart:convert';

CountryCodesModel countryCodesModelFromJson(String str) => CountryCodesModel.fromJson(json.decode(str));

String countryCodesModelToJson(CountryCodesModel data) => json.encode(data.toJson());

class CountryCodesModel {
    CountryCodesModel({
        this.name,
        this.flag,
        this.number,
    });

    String name;
    String flag;
    String number;

    CountryCodesModel copyWith({
        String name,
        String flag,
        String number,
    }) => 
        CountryCodesModel(
            name: name ?? this.name,
            flag: flag ?? this.flag,
            number: number ?? this.number,
        );

    factory CountryCodesModel.fromJson(Map<String, dynamic> json) => CountryCodesModel(
        name: json["name"] ?? null,
        flag: json["flag"] ?? null,
        number: json["number"] ?? null,
    );

    Map<String, dynamic> toJson() => {
        "name": name ?? null,
        "flag": flag ?? null,
        "number": number ?? null,
    };
}
