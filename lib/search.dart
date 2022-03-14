import 'package:covid19_tracker_api_vietnam/api_service.dart';
import 'package:covid19_tracker_api_vietnam/vietnam_model.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final FetchList _userList = FetchList();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF4A3298).withOpacity(0.8),
            const Color(0xFFFF7643).withOpacity(0.8),
          ],
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: FutureBuilder<List<Detail>>(
          future: _userList.getList(query: query),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<Detail>? data = snapshot.data;
            return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data![index].name.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '${data[index].cases}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '+${data[index].casesToday}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '${data[index].death}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        // trailing: Text('More Info'),
                      ),
                    ),
                  );
                });
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF4A3298).withOpacity(0.8),
            const Color(0xFFFF7643).withOpacity(0.8),
          ],
        ),
      ),
      child: const Center(
        child: Text('Search User'),
      ),
    );
  }
}
