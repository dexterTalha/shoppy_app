import 'dart:async';

class Validator{

  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){
      if(email.contains("@")){
        sink.add(email);
      }else{
        sink.addError("Invalid Email");
      }
    }
  );
  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.length >= 8){
        sink.add(password);
      }else{
        sink.addError("Password should be minimum 8 characters");
      }
    }
  );

}