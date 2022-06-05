class CompanyModel{
  late String name;
  late String catchPhrase;
  late String bs;

  CompanyModel.fromJson(Map<String, dynamic> json){

    name        = (json["name"]?.isEmpty ?? true )? "":json["name"];
    catchPhrase = (json["catchPhrase"]?.isEmpty ?? true )? "":json["catchPhrase"];
    bs          = (json["bs"]?.isEmpty ?? true )? "":json["bs"];

  }
}