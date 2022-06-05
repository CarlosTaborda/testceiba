import 'package:testceiba/models/company_model.dart';

class UserModel{
  int? id;
  String name="";
  String username="";
  String email="";
  String phone="";
  String website="";
  CompanyModel? company;
  AddressModel? address;

  UserModel.fromJson(Map<String, dynamic> json){

    id       = json["id"];
    name     = (json["name"]?.isEmpty ?? true )? "":json["name"];
    username = (json["username"]?.isEmpty ?? true )? "":json["username"];
    email    = (json["email"]?.isEmpty ?? true )? "":json["email"];
    phone    = (json["phone"]?.isEmpty ?? true )? "":json["phone"];
    website  = (json["website"]?.isEmpty ?? true )? "":json["website"];

    if( json["company"] != null ) {
      company  = CompanyModel.fromJson(json["company"]);
    }

    if( json["address"] != null ) {
      address  = AddressModel.fromJson(json["address"]);
    }
    

  }

  Map<String, dynamic> toRowMap(){
    return {
      "id" : id,
      "name" : name,
      "username" : username,
      "email" : email,
      "phone" : phone,
      "website" : website
    };
  }

  @override
  String toString(){
    return toRowMap().toString();
  }


}


class AddressModel{
  String street = "";
  String suite  = "";
  String city   = "";
  Map<String, dynamic>? geo;

  AddressModel.fromJson(Map<String, dynamic> json){

    street = (json["street"]?.isEmpty ?? true )? "":json["street"];
    suite  = (json["suite"]?.isEmpty ?? true )? "":json["suite"];
    city   = (json["city"]?.isEmpty ?? true )? "":json["city"];
    geo    = json["geo"];

  }
}