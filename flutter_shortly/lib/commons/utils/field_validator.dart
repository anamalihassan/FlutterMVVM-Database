
class FieldValidator {

  static String validateURL(String url){
    if (url.trim().isEmpty){
      return "Please enter URL";
    }
    return null;
  }
}