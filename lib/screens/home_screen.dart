import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repo.'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: RepoList(),
    );
  }
}

class RepoList extends StatelessWidget {
  final List<Map<String, String>> repos = List.generate(5, (index) => {
    'name': 'Test Test',
    'owner': 'Hani Mustafa',
    'date': '12/10/2023',
    'branch': 'Asadsmn-Test test'
  });

  RepoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: repos.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.account_circle, size: 40.0),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${repos[index]['name']}',
                              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Owner: ${repos[index]['owner']}',
                              style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        repos[index]['date']!,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text(
                        'Main Branch: ${repos[index]['branch']}',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 8.0),
                      Icon(Icons.copy, size: 16.0, color: Colors.grey[700]),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
