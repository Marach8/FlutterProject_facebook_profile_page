import 'package:facebook_profile_page/users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget{
  const Profile({super.key});

  @override 
  State<Profile> createState() => P();
}

class P extends State<Profile> {
  bool hasFocus1 = true;
  bool hasFocus2 = false;    

  @override 
  Widget build (BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Consumer<Users>(
      builder: ((context, users, child)
      => Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          flexibleSpace: Column(
            children: [
              SizedBox(height: h*0.03),
              Row(              
                children: [ 
                  const Expanded(
                    flex: 2,          
                    child: SizedBox()
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: (){
                            ScaffoldMessenger.of(context).showMaterialBanner(
                              MaterialBanner(
                                padding: const EdgeInsets.all(20),
                                content: const Text('Hello'),
                                leading: const Icon(Icons.notifications),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();                                      
                                    },
                                    child: Text('Dismiss')
                                  )
                                ]
                              )
                            );
                          },
                          child: Text(
                            users.storeUsers[users.loggedInUser]![0],
                            style: GoogleFonts.getFont(
                              'Inter',
                              color: Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600
                            )
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ]
                    )
                  ),                
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(
                          Icons.search_sharp,
                          size: h*0.04,
                          weight:900
                        )
                      ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
    
        
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.grey.shade400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  //Division1
    
                  Container(
                    color: Colors.grey.shade400,
                    height: h*0.5,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: h*0.017,
                          child: Container(
                            color: Colors.white,
                            height: h*0.21, width:w,
                          )
                        ),
                        Positioned(
                          bottom: h*0.036,
                          child: Container(
                            width:w,
                            padding: const EdgeInsets.only(left:15, right:15),
                            child: Row(                            
                              children: [
                                Expanded(                                
                                  flex: 3,
                                  child: ElevatedButton.icon(
                                    onPressed: (){},
                                    icon: const Icon(Icons.add),
                                    label: Text(
                                      'Add to story',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontSize:10,
                                        fontWeight: FontWeight.w700,                                      
                                      )
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),
                                      backgroundColor: const Color.fromARGB(255, 44, 77, 241),
                                      foregroundColor: const Color.fromARGB(255, 255, 255, 255)
                                    )
                                  )
                                ),
                                SizedBox(width: w*0.025),
                                Expanded(                                
                                  flex: 3,
                                  child: ElevatedButton.icon(
                                    onPressed: (){},
                                    icon: const Icon(Icons.edit),
                                    label: const Text('Edit profile'),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),                                   
                                      backgroundColor: Colors.grey.shade300,
                                      foregroundColor: Colors.black
                                    )
                                  )
                                ),
                                SizedBox(width: w*0.025),
                                Expanded(                                
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: (){},                                                                    
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7)),                                   
                                      backgroundColor: Colors.grey.shade300,
                                      foregroundColor: Colors.black
                                    ),
                                    child: const Icon(Icons.more_horiz),
                                  )
                                ),
                              ]
                            ),
                          )
                        ),
                        Positioned(
                          bottom: h*0.11,
                          child: Container(
                            padding: const EdgeInsets.only(left: 15,),
                            child: Text(
                              users.storeUsers[users.loggedInUser]![0],
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 26,
                                fontWeight: FontWeight.w700
                              )
                            )
                          )
                        ),
                        Positioned( 
                          bottom: h*0.17,
                          child: Container(    
                            margin: const EdgeInsets.only(left:10,),                      
                            decoration: BoxDecoration(                            
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: h*0.005
                              )
                            ),
                            child: CircleAvatar(
                              radius: w*0.21, 
                              backgroundImage: const AssetImage('assets/FB_IMG_1691828515571.png')                           
                            ),
                          )
                        ),
                        Positioned( 
                          bottom: 158, left: w*0.33,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              )
                            ),
                            child: CircleAvatar(
                              radius: 21,
                              backgroundColor:  Colors.grey.shade300,
                              child: IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.camera_alt_rounded)
                              )
                            ),
                          )
                        ),
                        Positioned( 
                          bottom: 210, right: w*0.035,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              )
                            ),
                            child: CircleAvatar(
                              radius: 21,
                              backgroundColor:  Colors.grey.shade300,
                              child: IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.camera_alt_rounded)
                              )
                            ),
                          )
                        ),
                        Positioned(
                          bottom: 270, right: w*0.035,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              )
                            ),
                            child: CircleAvatar(
                              radius: 21,
                              backgroundColor:const Color.fromARGB(255, 44, 77, 241),
                              child: IconButton(
                                onPressed: (){},
                                icon: const Icon(
                                  Icons.face_4_outlined,
                                  color: Colors.white
                                )
                              )
                            ),
                          )
                        ),
                        Positioned(
                          top: 40, left: w*0.25,
                          child: TextButton.icon(
                            onPressed: (){},
                            icon: const Icon(Icons.add_photo_alternate_sharp),
                            label: Text(
                              'Add cover photo',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize:18,
                                fontWeight: FontWeight.w600,                                      
                              )
                            ),
                            style: const ButtonStyle(
                              foregroundColor: MaterialStatePropertyAll(Colors.black)
                            )
                          )
                        )
                      ],
                    )
                  ),
    
                  //Division 2
    
                  Container(                  
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(13, 13, 0, 4),
                          child: Row(
                            children: [
                              TextButton(                                   
                                onPressed: (){
                                  setState((){
                                    hasFocus1 = !hasFocus1;
                                    hasFocus2 = !hasFocus2;
                                  });
                                }, 
                                style: hasFocus1? const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 207, 223, 237))
                                ): null,                             
                                child: Text(
                                  'Posts',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: hasFocus1? const Color.fromARGB(255, 44, 77, 241): Colors.black87,                                  
                                  )
                                )
                              ),
                              const SizedBox(width:10),
                              TextButton(                                   
                                onPressed: (){
                                  setState((){
                                    hasFocus1 = !hasFocus1;
                                    hasFocus2 = !hasFocus2;
                                  });
                                }, 
                                style: hasFocus2? const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 207, 223, 237))
                                ): null,                             
                                child: Text(
                                  'Reels',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: hasFocus2? const Color.fromARGB(255, 44, 77, 241): Colors.black87,                                  
                                  )
                                )
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 0.3,                        
                        ),
                        Padding(                        
                          padding: const EdgeInsets.only(left: 13),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Details',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:13, top: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.home,
                                  size: 30
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Current city',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )
                                )
                              ],
                            )
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:13, top: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.work_history_sharp,
                                  size: 30
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Workplace',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )
                                )
                              ],
                            )
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:13, top: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.school_sharp,
                                  size: 30
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'School',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )
                                )
                              ],
                            )
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:13, top: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.place,
                                  size: 30
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Hometown',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )
                                )
                              ],
                            )
                          ),
                        ),
                        GestureDetector(                        
                          child: Padding(
                            padding: const EdgeInsets.only(left:13, top: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite_sharp,
                                  size: 30
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Relationship status',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )
                                )
                              ],
                            )
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.only(left:13, top: 15),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.more_horiz_sharp,
                                  size: 30
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'See your About info',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  )
                                )
                              ],
                            )
                          ),
                        ),
                        Container(
                          width: w,
                          padding: EdgeInsets.fromLTRB(15, 18, 15, 18),                        
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),
                              backgroundColor: Color.fromARGB(255, 207, 223, 237),
                              foregroundColor: const Color.fromARGB(255, 44, 77, 241)
                            ),
                            child: Text(
                              'Edit public details',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                              )
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 10, 15),
                          child: Row(
                            children: [                            
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Friends', 
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    '53 friends',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontSize: 20
                                    )
                                  )
                                ]
                              ),
                              SizedBox(width: w*0.46),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Find',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontSize: 20,
                                      color: const Color.fromARGB(255, 44, 77, 241)
                                    )
                                  ),
                                  Text(
                                    'Friends',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontSize: 20,
                                      color: const Color.fromARGB(255, 44, 77, 241)
                                    )
                                  )
                                ]
                              )
                            ]                          
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                          //color:Colors.yellow,
                          height: w*0.8, width: w*1.5,
                          child: GridView(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: w*0.8/w*0.9
                            ),
                            children: [
                              Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),                                    
                                    ),                                                       
                                    child: Image.asset('assets/FB_IMG_1691828515571.png')
                                  ),
                                  Text(users.storeUsers[users.loggedInUser]![0],)
                                ],
                              ),
                              Column(
                                children: [
                                  Card(                                
                                    child: Image.asset('assets/FB_IMG_1691828515571.png')
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Card(                                
                                    child: Image.asset('assets/FB_IMG_1691828515571.png')
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Card(                                
                                    child: Image.asset('assets/FB_IMG_1691828515571.png')
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Card(                                
                                    child: Image.asset('assets/FB_IMG_1691828515571.png')
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Card(                                
                                    child: Image.asset('assets/FB_IMG_1691828515571.png')
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                        Container(
                          width: w,
                          padding: const EdgeInsets.fromLTRB(15, 18, 15, 18),                        
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),
                              backgroundColor: const Color.fromARGB(255, 207, 223, 237),
                              foregroundColor: const Color.fromARGB(255, 44, 77, 241)
                            ),
                            child: Text(
                              'See all friends',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 17,
                                fontWeight: FontWeight.w500
                              )
                            )
                          ),
                        ),
                      ],
                    )
                  ),
                  const SizedBox(height: 15),
    
                  //Division 3
    
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Posts',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                  )
                                )
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Filters',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromARGB(255, 44, 77, 241)
                                    )
                                  ),
                                ),
                              )
                            ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(6, 5, 6, 15),
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage('assets/FB_IMG_1691828515571.png')
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: ElevatedButton(   
                                  style: ButtonStyle(
                                    elevation: const MaterialStatePropertyAll(0),
                                    backgroundColor: const MaterialStatePropertyAll(Colors.white),
                                    fixedSize: MaterialStatePropertyAll(Size(w*0.7, 50)),
                                    side: const MaterialStatePropertyAll(
                                      BorderSide(
                                        width: 1,
                                        color: Colors.black12
                                      )
                                    )
                                  ),
                                  onPressed: (){},
                                  child: Text(
                                    "What's on your mind?",
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400
                                    )
                                  )
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  radius: 25,
                                  child: Icon(Icons.photo_album)
                                ),
                              ),
                            ]
                          ),
                        ),
                        const Divider(
                          color: Colors.black38,
                          thickness: 0.3,height: 1,
                        ),
                        Container(
                          color: const Color.fromARGB(255, 247, 248, 248),
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Row(
                            children: [
                              ElevatedButton.icon(                              
                                icon: const Icon(
                                  Icons.video_library_sharp,
                                  color: Colors.red
                                ),
                                onPressed: (){},
                                label: Text(
                                  'Reel',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,                                
                                  side: const BorderSide(
                                    width: 1,
                                    color: Colors.black12,
                                    style: BorderStyle.solid,                                  
                                  )
                                )
                              ),
                              const SizedBox(width:15),
                              ElevatedButton.icon(                              
                                icon: const Icon(
                                  Icons.video_camera_front_sharp,
                                  color: Colors.red
                                ),
                                onPressed: (){},
                                label: Text(
                                  'Live',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  elevation: 0,                                
                                  side: const BorderSide(
                                    width: 1,
                                    color: Colors.black12,
                                    style: BorderStyle.solid,                                  
                                  )
                                )
                              )
                            ]
                          )
                        ),
                        const Divider(
                          color: Colors.black38,
                          thickness: 0.3, height: 1,
                          endIndent: 15,
                          indent: 15
                        ),
                        Container(
                          width: w,
                          padding: const EdgeInsets.fromLTRB(15, 18, 15, 18),                        
                          child: ElevatedButton.icon(
                            onPressed: (){},
                            icon: const Icon(Icons.chat_rounded, color: Colors.black),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),
                              backgroundColor: const Color.fromARGB(255, 207, 223, 237),
                              foregroundColor: const Color.fromARGB(255, 44, 77, 241)
                            ),
                            label: Text(
                              'Manage posts',                          
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              )
                            )
                          ),
                        ),
                      ]
                    )
                  ),
                  const SizedBox(height: 15),
    
                  //Division 4
                  
                  Container(
                    width: w, height: 90,
                    padding: const EdgeInsets.only(left:15, top:10, bottom:10),
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton.icon(
                        onPressed: (){},
                        icon: const Icon(Icons.photo, color: Colors.black),
                        label: Text(
                          'Photos',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          )
                        ),
                      ),
                    )
                  ),
                  const SizedBox(height: 15),
    
                  //Division 5 
    
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage('assets/FB_IMG_1691828515571.png')
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                margin: const EdgeInsets.only(left:15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(                                    
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: users.storeUsers[users.loggedInUser]![0],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600
                                            )
                                          ),
                                          TextSpan(
                                            text: ' updated his profile picture.',
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400
                                            ), 
                                          )
                                        ],                                                                           
                                      ) 
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Jan 6 at 10:43 AM',
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400
                                          )
                                        ),
                                        const SizedBox(width: 15),
                                        const Icon(Icons.public_outlined, size: 20)
                                      ],
                                    )
                                  ]
                                )
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.more_horiz)
                              )
                            ),
                          ]
                        ),
                        const SizedBox(height: 50),
                        Container(    
                          margin: const EdgeInsets.only(left:10,),                      
                          decoration: BoxDecoration(                                                      
                            shape: BoxShape.circle,
                            border: Border.all(                            
                              color: Colors.white,
                              width: 6
                            ),
                            boxShadow: const [                            
                              BoxShadow(                              
                                blurRadius: 0.2,
                                blurStyle: BlurStyle.normal,
                                spreadRadius: 1
                              )
                            ]
                          ),
                          child: CircleAvatar(
                            radius: w*0.4, 
                            backgroundImage: const AssetImage('assets/FB_IMG_1691828515571.png')                           
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Divider(
                          color: Colors.black54,
                          thickness: 0.3, height: 1,                        
                        ),
                        Row(                        
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: (){},
                                icon: const Icon(Icons.thumb_up_outlined, color: Colors.black),
                                label: Text(
                                  'Like',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                  )
                                )
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: (){},
                                icon: const Icon(Icons.message_rounded, color: Colors.black),
                                label: Text(
                                  'Comment',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                  )
                                )
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: (){},
                                icon: const Icon(Icons.share_outlined, color: Colors.black),
                                label: Text(
                                  'Share',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                  )
                                )
                              ),
                            ),
                          ]
                        )
                      ]
                    )
                  ),
                  const SizedBox(height: 10),
    
                  //Division 6
    
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage('assets/FB_IMG_1691828515571.png')
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                margin: EdgeInsets.only(left:15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      users.storeUsers[users.loggedInUser]![0],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600
                                      )
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'May 22, 1995',
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400
                                          )
                                        ),
                                        const SizedBox(width: 15),
                                        const Icon(Icons.lock, size: 20)
                                      ],
                                    )
                                  ]
                                )
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: (){},
                                icon: const Icon(Icons.more_horiz)
                              )
                            ),
                          ]
                        ),
                        const SizedBox(height: 30),
                       const Center(
                          child: CircleAvatar(
                            radius: 20,
                             backgroundColor: Color.fromARGB(255, 36, 65, 211),
                             child: Icon(Icons.car_rental, color: Colors.white)
                          )
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            'Born on March 15, 2001',
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontSize: 25,
                              fontWeight: FontWeight.w600
                            )
                          )
                        ),
                        const SizedBox(height: 5),
                        const Divider(
                          color: Colors.black54,
                          thickness: 0.3, height: 1,                        
                        ), 
                        Row(                        
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: (){},
                                icon: const Icon(Icons.thumb_up_outlined, color: Colors.black),
                                label: Text(
                                  'Like',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                  )
                                )
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: (){},
                                icon: const Icon(Icons.message_rounded, color: Colors.black),
                                label: Text(
                                  'Comment',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                  )
                                )
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton.icon(
                                onPressed: (){},
                                icon: const Icon(Icons.share_outlined, color: Colors.black),
                                label: Text(
                                  'Share',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black
                                  )
                                )
                              ),
                            ),
                          ]
                        )
                      ]
                    )
                  ),
                  SizedBox(
                    width: w, height: 60,
                    child: Center(
                      child: Text(
                        'No posts available',
                        style: GoogleFonts.getFont(
                          'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        )
                      )
                    )
                  )
                ],
              )
            ),
          ),
        )
      )),
    );
  }
}