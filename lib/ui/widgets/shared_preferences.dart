import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences{
UserSharedPreferences._();

static final UserSharedPreferences userSharedPreferences = UserSharedPreferences._();

 SharedPreferences prefs ;

 initializeSharedPref()async{
   if(prefs==null){
     prefs =  await SharedPreferences.getInstance();
     //userSharedPreferences.
     return prefs;

   }else{
     return prefs;
   }

 }

insertIntoFile(bool loggedIn)async{
  
  try{
SharedPreferences sh =await initializeSharedPref();
//prefs = await SharedPreferences.getInstance();
sh.setBool('isLoggeIn', loggedIn);
  }catch(error){
    print(error);
  }

}
getUserStatus()async{
 initializeSharedPref();
  bool status;
  try{

SharedPreferences sh =await initializeSharedPref();
status = sh.getBool('isLoggeIn');
if(sh == null){
  insertIntoFile(false);
  status = false;
}
return status;
}catch( e ){
  print(e);
  status = false;

}
}



}