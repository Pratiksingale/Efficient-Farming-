import 'package:flutter/material.dart';
import 'Loginpage.dart';
import 'auth.dart';

 class RootPage extends StatefulWidget{
   RootPage({this.auth});
    final BaseAuth auth;
    @override
         State<StatefulWidget>createState() => new _RootPageState();
 }

   enum AuthStatus{
      notSignedIn,
      signedIn
   }
   class _RootPageState extends State<RootPage>{
         AuthStatus _authStatus =AuthStatus.notSignedIn;

       @override
  void initState() {
           super.initState();
         widget.auth.currentUser().then((userId){
            setState(() {
           //  _authStatus = userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn; 
            });
         });
   }   

     void _signedIn(){
       setState((){
         _authStatus =AuthStatus.signedIn;
       });
     }


                @override
  Widget build(BuildContext context) {
       switch (_authStatus){
         case AuthStatus.notSignedIn:
                 return new Loginpage(auth: widget.auth,
                 onSignedIn: _signedIn,
                 );
                   

          case AuthStatus.signedIn:
                return new Scaffold(
                 appBar:  new AppBar(
                   title: new Text('Welcome'),
              
              
              
               )
               );
       }
       return(null);
  }
   }
