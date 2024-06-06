import 'package:flutter/material.dart';
import 'package:practice_app/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoadingApi = false;
  @override
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 148, 98, 235),
      ),
      body: isLoadingApi
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder(
              future: ApiServices.getApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          trailing: IconButton(
                              onPressed: () {
                                ApiServices.deleteApi(
                                    snapshot.data?[index].sId ?? "0");
                                    setState(() {
                                      
                                    });
                              },
                              icon: const Icon(Icons.delete)),
                          leading: IconButton(
                              onPressed: () {
                                ApiServices.updateApi(
                                    snapshot.data?[index].sId ?? "0");
                                setState(() {});
                              },
                              icon: const Icon(Icons.update)),
                          title: Text(snapshot.data?[index].name.toString() ??
                              "No data"),
                          subtitle: Text(snapshot.data?[index].age.toString() ??
                              "No data"),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          isLoadingApi = true;
          setState(() {});
          await ApiServices.postApi();
          isLoadingApi = false;
          setState(() {});
        },
        child: const Text("Add"),
      ),
    ));
  }
}
