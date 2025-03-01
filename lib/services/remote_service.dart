import 'package:restapi/models/post.dart';
import 'package:http/http.dart' as http ;

class RemoteService{
  Future<List<Post>?>getposts() async{
var client=http.Client();
var url=Uri.parse('https://jsonplaceholder.typicode.com/posts');
var response =await client.get(url);


if (response.statusCode ==200){
  //gets the body part
  var json =response.body;
  postFromJson(json);

}
  }
}