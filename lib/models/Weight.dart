class Weight {
    String imperial;
    String metric;

    Weight({
        required this.imperial,
        required this.metric,
    });

    factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
    );

    Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
    };
}