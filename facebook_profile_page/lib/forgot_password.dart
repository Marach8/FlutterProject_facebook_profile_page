import 'package:facebook_profile_page/users.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget{
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {  
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController(); 

  Future <void> dialogBox() {
    return showDialog(
      context: context,
      builder: (context) => 
       AlertDialog(
          title: Text('Please wait...', style: GoogleFonts.getFont('Quicksand', fontSize: 10, fontWeight: FontWeight.bold,),
          ),
          content: const LinearProgressIndicator(),
        )
    ); 
  }


  @override
  Widget build(BuildContext context){    
    var h = MediaQuery.of(context).size.height;    
    var w = MediaQuery.of(context).size.width;
    bool fieldsNotEmpty = [_controller1, _controller2,].every((controller) => controller.text.isNotEmpty); 

  snackBarAlert(String text, Color color) => 
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: GoogleFonts.getFont(
          'Quicksand', color: color, fontSize: h*0.02, fontWeight: FontWeight.bold,
        ),                                
      ),
      action: SnackBarAction(label: 'Ok', onPressed: (){}),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //behavior: SnackBarBehavior.floating, margin: const EdgeInsets.only(bottom:50),
      backgroundColor: Colors.white, duration: const Duration(seconds:3)
    )
  );
    
    return Consumer<Users>(
      builder: ((context, users, child)
      => Scaffold(      
        body: SingleChildScrollView(
          child: Container(
            color: Colors.blueGrey.shade900,
            child: Column(
              children: [
                SizedBox(height:h*0.04),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){Navigator.pop(context);}, 
                      icon: const Icon(Icons.arrow_back_outlined),
                      color: Colors.white,
                    )
                  ]
                ),
                SizedBox(height: h*0.045),
                Text('English (US)',
                  style: GoogleFonts.getFont('Ubuntu', color: Colors.white60, fontWeight: FontWeight.w100)
                ),
                SizedBox(height: h*0.051),
                CircleAvatar(
                  radius: h*0.038,
                  backgroundColor: const Color.fromARGB(255, 46, 108, 224),                    
                  child: Text(
                    'f',
                    style: TextStyle(
                      fontSize: h*0.07,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(255, 255, 255, 0.8)
                    )
                  )
                ), 
                SizedBox(height: h*0.075),
                Container(
                  height: h*0.25, width: w*0.9,                 
                  decoration: BoxDecoration(
                    color: Colors. blueGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [BoxShadow(blurRadius: 10, spreadRadius: 1)]
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: h*0.03),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: h*0.072,                  
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 5)]
                        ),
                        child: TextField(
                          controller: _controller1,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(              
                            hintStyle: GoogleFonts.getFont('Quicksand', color:Colors.white38, fontSize: h*0.02, fontWeight: FontWeight.bold),
                            hintText: 'Enter Mobile number or email',
                            border: InputBorder.none,                                                     
                          )
                        ),
                      ), 
                      SizedBox(height: h*0.004),
                      SizedBox(height: h*0.004),
                      Container(    
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: h*0.072,                  
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [BoxShadow(color: Colors.white, blurRadius: 5)]
                        ),
                        child: TextField(
                          controller: _controller2,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(              
                            hintStyle: GoogleFonts.getFont(
                              'Quicksand',
                              color: Colors.white38,
                              fontSize: h*0.02,
                              fontWeight: FontWeight.bold,
                            ),
                            hintText: 'Enter new password',
                            border: InputBorder.none,                                                     
                          )
                        ),
                      ), 
                    ]
                  )
                ),

                SizedBox(height: h*0.02),                
                SizedBox(                            
                  height: h*0.06, width: w*0.9,
                  child: ElevatedButton(    
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(255, 46, 108, 224),),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        )
                      ), 
                      side:const MaterialStatePropertyAll(BorderSide(
                        color: Colors.black, width:1, strokeAlign: 5
                      ))
                    ),
                    onPressed: () async{
                      if(fieldsNotEmpty){
                        if (users.storeUsers.containsKey(_controller1.text)){
                          users.storeUsers[_controller1.text]![1] = _controller2.text;
                          dialogBox();
                          await Future.delayed(const Duration(seconds:2), () => Navigator.of(context).popUntil(ModalRoute.withName('/')));
                        } else{
                          snackBarAlert('User "${_controller1.text}" not found!!!', Colors.red);
                        }                                         
                      } else{
                        snackBarAlert('Fields cannot be empty!!!', Colors.black);
                      }
                    },                      
                    child: Text(
                      'Change Password',
                      style: GoogleFonts.getFont(
                        'Quicksand', color: Colors.black, fontSize: h*0.02, fontWeight: FontWeight.bold,
                      )
                    )
                  ),
                ),
                SizedBox(height: h*0.25), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [                    
                    FaIcon(FontAwesomeIcons.meta,
                    color: Colors.white,
                    size: h*0.02,
                    ),
                    SizedBox(
                    width: w*0.01
                    ),
                    Text('Meta',
                    style: GoogleFonts.getFont('Quicksand', color: Colors.white, fontSize: h*0.022)
                    )
                  ]
                ),
                SizedBox(                  
                  height: h*0.1, width: w
                )
              ]
            ),
          ),
        ),  
        ) 
      ),
    );
  }
}