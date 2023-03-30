class BandModel{
  String name;
  String id;
  int votes;

  BandModel({
    required this.name,
    required this.id,
    required this.votes,
  });

  //recie un mapa y los datos los instancia a bandModel
  factory BandModel.fromMap(Map<String,dynamic> obj)=>
  BandModel(
    name: obj['name'], 
    id: obj['id'], 
    votes:obj['votes']);
}