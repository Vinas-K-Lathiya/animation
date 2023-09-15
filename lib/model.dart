class JsonDecodeModel {
  String position;
  String name;
  String type;
  String radius;
  String orbital_period;
  String gravity;
  String velocity;
  String distance;
  String description;
  String image;

  JsonDecodeModel({
    required this.position,
    required this.name,
    required this.type,
    required this.radius,
    required this.orbital_period,
    required this.gravity,
    required this.velocity,
    required this.distance,
    required this.description,
    required this.image,
  });

  factory JsonDecodeModel.map({required Map data}) {
    return JsonDecodeModel(
      position: data['position'],
      name: data['name'],
      type: data['type'],
      radius: data['radius'],
      orbital_period: data['orbital_period'],
      gravity: data['gravity'],
      velocity: data['velocity'],
      distance: data['distance'],
      description: data['description'],
      image: data['image'],
    );
  }
}
