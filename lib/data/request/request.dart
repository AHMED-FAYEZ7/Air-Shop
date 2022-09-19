class LoginRequest{
  String email;
  String password;

  LoginRequest(this.email,this.password);
}

class ChangeFavRequest{
  int productId;

  ChangeFavRequest(this.productId);
}