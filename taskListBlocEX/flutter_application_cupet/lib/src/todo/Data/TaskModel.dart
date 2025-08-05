class Task {
  String id ;
  bool isDone = false ; // defult false 
  String titel;
  Task({required this.id ,
  required this.isDone,
  required this.titel, });


  Map <String , dynamic> toJson(){
    return{
      'id':id,
      'isDone':isDone,
      'titel':titel
    };
  }

  factory Task.fromJson(Map<String,dynamic>json){
    return Task(id: json['id'],
      isDone: json['isDone'],
      titel: json['titel']);
  }
}