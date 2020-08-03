class UserInput {
  String title;
  String body;


  UserInput({ this.title, this.body});

  bool get isValid {
    return title != null && body != null ;
  }
}
