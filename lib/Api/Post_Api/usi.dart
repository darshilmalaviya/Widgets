import 'package:flutter/material.dart';
import 'package:widgest/Api/Post_Api/usi_api_repo.dart';

class UsiApi extends StatefulWidget {
  const UsiApi({super.key});

  @override
  State<UsiApi> createState() => _UsiApiState();
}

class _UsiApiState extends State<UsiApi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getUser.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text("User Id : ${snapshot.data[index]['userId']}"),
                      Text("Id : ${snapshot.data[index]['id']}"),
                      Text("Title : ${snapshot.data[index]['title']}"),
                    ],
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
