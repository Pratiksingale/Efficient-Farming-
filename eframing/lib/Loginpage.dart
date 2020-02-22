import 'package:flutter/material.dart';
import 'auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';


class Loginpage extends StatefulWidget{
      Loginpage({this.auth , this.onSignedIn});
      final BaseAuth auth;
       final VoidCallback onSignedIn;
     @override
  State<StatefulWidget> createState() => new _LoginPageState();

  }

  enum FromType{
    login,
    register
  }

class _LoginPageState extends State<Loginpage> {

    String _email;
    String _password;
    FromType _fromType =FromType.login;
   final formKey = new GlobalKey<FormState>();

 bool validateAndSave(){
   final form = formKey.currentState;
     if (form.validate()){
        form.save();
        return true;
        // print('Form is valid, Email: $_email, password: $_password');
     }else{
         return false;
       // print('Form is Invalid, Email: $_email, password: $_password');
    }

 } 
  
   void validateAndSubmit() async {
     if (validateAndSave()){
       try{
         if (_fromType ==FromType.login) {
          String userId =await widget.auth.signInWithEmailAndPassword(_email, _password);
       //FirebaseUser user = await  FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
       print('Singned in : $userId');
         } else{
          String userId =await widget.auth.createUserWithEmailAndPassword(_email, _password);
       // FirebaseUser user =await FirebaseAuth.instance.createUserWithEmailAndPassword( email: _email, password: _password);
           print('Registered user: $userId');
         }
          widget.onSignedIn();
     }
        catch(e){
           print('Error: $e');
        }
     }
   }

    void moveToRegister(){
         setState(() {
           _fromType = FromType.register; 
         });
       
    }
     
     void moveToLogin(){
        setState(() {
          _fromType =FromType.login; 
        });
     }

    @override
  Widget build(BuildContext context) {
       
       return new Scaffold(
         appBar:  new AppBar(
           title: new Text(' Login'),
         ),
         body: new Container(
           padding: EdgeInsets.all(16.0),
           child: new Form(
               key: formKey,
                child: new Column(
                    children: buildInputs() + buildSubmitButtons(),
                ),
           )

           )
         );
      
  }

          List<Widget>buildInputs(){
            return[
            new TextFormField(
                        decoration: new InputDecoration(labelText: 'Email'),
                        validator: (value) => value.isEmpty ?'Email cant be empty':null,
                        onSaved: (value) => _email =value
                      ),
                      new TextFormField( 
                        decoration: new InputDecoration(labelText: 'Password'),
                         validator: (value) => value.isEmpty ?'Password cant be empty':null,
                        onSaved: (value) => _password =value,
                      obscureText: true,
                    
                      ),
            ];

          }

          List<Widget> buildSubmitButtons(){
            if(_fromType ==FromType.login){
               return[
                new RaisedButton(
                        child: new Text('Login',style: new TextStyle(fontSize: 20.0)),
                        onPressed: validateAndSubmit,
                      ),
                      new FlatButton(
                        child: new Text ('Create an account',style:  new TextStyle(fontSize: 20.0),),
                        onPressed: moveToRegister
                        ),
            
            ];
            } else{ 
              return[
                new RaisedButton(
                        child: new Text('Create an account',style: new TextStyle(fontSize: 20.0)),
                        onPressed: validateAndSubmit,
                      ),
                      new FlatButton(
                        child: new Text ('Have an account ? login',style:  new TextStyle(fontSize: 20.0),),
                        onPressed: moveToLogin,
                        ),
            ];
                
            }


          }


}