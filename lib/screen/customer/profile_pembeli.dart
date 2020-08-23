import 'package:flutter/material.dart';
import 'package:vgo/screen/login.dart';

class ProfilePembeli extends StatefulWidget {
  @override
  _ProfilePembeliState createState() => _ProfilePembeliState();
}

class _ProfilePembeliState extends State<ProfilePembeli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top :43),
            child: Container(
              alignment: Alignment.topRight,
              child: Image.asset("images/menu.png"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Container(
                      height: 95,
                      width: 100,
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage(
                            'images/ibu1.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                  )
                ],
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.grey[100],
              ),
              height: 600,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: ListView(
                    children: ListTile.divideTiles(
                        context: context,
                        tiles: [
                          ListTile(
                            title: Text('Nama', style: TextStyle(color: Colors.grey, fontSize: 15)),
                            subtitle: Text('Reza Nurfitriani', style: TextStyle(color: Colors.black, fontSize: 20)),
                            onTap: (){

                            },
                          ),
                          ListTile(
                            title: Text('Username', style: TextStyle(color: Colors.grey, fontSize: 15)),
                            subtitle: Text('ezaftrni', style: TextStyle(color: Colors.black, fontSize: 20)),
                          ),
                          ListTile(
                            title: Text('Password', style: TextStyle(color: Colors.grey, fontSize: 15)),
                            subtitle: Text('', style: TextStyle(color: Colors.black, fontSize: 20)),
                            onTap: (){

                            },
                          ),
                          ListTile(
                            title: Text('No. Handphone', style: TextStyle(color: Colors.grey, fontSize: 15)),
                            subtitle: Text('087887897614', style: TextStyle(color: Colors.black, fontSize: 20)),
                          ),
                          ListTile(
                            title: Text('Email', style: TextStyle(color: Colors.grey, fontSize: 15)),
                            subtitle: Text('ezaftrn@gmail.com', style: TextStyle(color: Colors.black, fontSize: 20)),
                          ),
                          ListTile(
                            title: Text('Alamat', style: TextStyle(color: Colors.grey, fontSize: 15)),
                            subtitle: Text('Jalan Lontar V No.47 Rt 14 Rw 04 Kel. Tugu Utara Kec. Koja Jakarta Utara', style: TextStyle(color: Colors.black, fontSize: 20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => Login()));
                              },
                              child: Card(
                                  color: Colors.pink,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(
                                          6.0)),
                                  child: Container(
                                    height: 40,
                                    width: 20,
                                    child: Center(
                                        child: Text(
                                          "Logout",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )),
                                  )
                              ),
                            ),
                          ),
                        ]
                    ).toList(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
