
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restapi/models/post.dart';
import 'package:restapi/services/remote_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //using the data generated
  List<Post>?posts;
  //creating a flag
  var isLoaded=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //fetch data  from api
    getdata();
  }
  getdata() async{
posts=await RemoteService().getposts();
if(posts !=null){
  setState(() {
    isLoaded=true;
  });
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //there is a place  i have used quicktype to cnvert json file
      appBar: AppBar(title: Text("post"),
        centerTitle: true,
      ),
      body:
      Visibility(
        visible: isLoaded,
        child: ListView.builder(
            //defining count
          itemCount: posts?.length,
            itemBuilder: (context,index){

          return Container(
            padding: EdgeInsets.all(18),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blue
              ),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(posts![index].title,overflow: TextOverflow.ellipsis,maxLines: 3,
                    style: TextStyle(
                    fontSize: 24,fontWeight: FontWeight.bold
                  ),),
                  Text(posts![index].body ?? '',
                    overflow: TextOverflow.ellipsis,maxLines: 3,
                    style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.bold
                    ),),

                ],
              ),
            ),
          );

        }),
        replacement: Center(child:CircularProgressIndicator() ,),
      ),
    );
  }
}
