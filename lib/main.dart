import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(primaryColor: Colors.green),
        home: HomeActivity()
    );
  }
}
//----------------------------------------------

MySnackbar(message,context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message))
  );
}

//-----------------------------------------------

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  //-------------------------------------------------------

  MyAlertDialog(message,context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
      return Expanded(child: AlertDialog(
        title: Text ("Alert !"),
        content: Text("Do You want to Exit"),
        actions: [
          TextButton(onPressed: (){
            MySnackbar("Exit Success", context);
            }, child: Text("Yes")),
          TextButton(onPressed: (){
            Navigator.of(context).pop();}, child: Text("No")),
        ],
      ));
        }
    );
  }
  //-------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle=ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity,60)
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Inventory App"),
        titleSpacing:20,
        toolbarHeight: 60,
        actions: [
          IconButton(onPressed: (){MySnackbar("I am Comments", context);}, icon: Icon(Icons.comment)),
          IconButton(onPressed: (){MySnackbar("I am Search", context);}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){MySnackbar("I am Settings", context);}, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){MySnackbar("I am Email", context);}, icon: Icon(Icons.email))
        ],
      ),

      //-----------------------------------------------------------

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(20),
            child: TextField(decoration: InputDecoration(
                labelText: 'First Name')),),
          Padding(padding: EdgeInsets.all(20), child: TextField(decoration: InputDecoration(
           labelText: 'Last Name')),),
          Padding(padding: EdgeInsets.all(20),
            child: TextField(decoration: InputDecoration(
              labelText: 'Email Address')),),
          Padding(padding: EdgeInsets.all(20),
          child: ElevatedButton (onPressed: (){},child: Text('Submit')),)
        ],
      ),

      //------------------------------------------------------

      floatingActionButton: FloatingActionButton(
        elevation: 18,
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: (){
          MySnackbar("I am Floating Action Button", context);
        },
      ) ,
//-----------------------------------------------------
  bottomNavigationBar: BottomNavigationBar(
  currentIndex: 0,
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contact"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
  ],
  onTap: (int index){
    if(index==0){
    MySnackbar("Home", context);
    }

    if(index==1){
      MySnackbar("Contact", context);
    }

    if(index==2){
      MySnackbar("Profile", context);
    }

  },
),
      //-----------------------------------------------------

      drawer: Drawer(
       child: ListView(
         children: [DrawerHeader(
           padding: EdgeInsets.all(0),
             child: UserAccountsDrawerHeader(
           decoration: BoxDecoration(color: Colors.green),
               accountName: Text("Md. Morsalin Hossain"),
               accountEmail: Text("morsalin88bd@gmail.com"),
               currentAccountPicture: Image.network("https://w7.pngwing.com/pngs/537/866/png-transparent-flutter-hd-logo-thumbnail.png"),
             )

         ),

           ListTile(leading:Icon(Icons.home),
               title: Text("Home")),
           ListTile(leading: Icon(Icons.contact_mail),
               title: Text("Contact")),
           ListTile(leading: Icon(Icons.phone),
               title: Text("Phone"))
         ],
       )
      ),
//-----------------------------------------------------------
      endDrawer: Drawer(
          child: ListView(
            children: [DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Text("Md. Morsalin Hossain"),
                  accountEmail: Text("morsalin88bd@gmail.com"),
                  currentAccountPicture: Image.network("https://w7.pngwing.com/pngs/537/866/png-transparent-flutter-hd-logo-thumbnail.png"),
                )

            ),

              ListTile(leading:Icon(Icons.home),
                  title: Text("Home")),
              ListTile(leading: Icon(Icons.contact_mail),
                  title: Text("Contact")),
            ],
          )
      ),
    //------------------------------------------------------


    );
  }
}


