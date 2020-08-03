class User {
  String username;
  String location;


  User({ this.location, this.username});

  bool get isValid {
    return username != null && location != null ;
  }
}
