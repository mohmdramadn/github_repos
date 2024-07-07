import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constant_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            Constant.assets.filter,
            width: 30.spMin,
            height: 30.spMin,
            fit: BoxFit.fill,
          ),
          onPressed: () {},
        ),
        title: const Text('GitHub Repo.'),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              Constant.assets.search,
              width: 30.spMin,
              height: 30.spMin,
              fit: BoxFit.fill,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: RepoList(),
    );
  }
}

class RepoList extends StatelessWidget {
  final List<Map<String, String>> repos = List.generate(
      5,
      (index) => {
            'name': 'Test Test',
            'owner': 'Hani Mustafa',
            'date': '12/10/2023',
            'branch': 'Asadsmn-Test test'
          });

  RepoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.spMin),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Colors.white)),
        child: ListView.separated(
          padding: EdgeInsets.all(16.spMin),
          itemCount: repos.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 8.h),
              child: Padding(
                padding: EdgeInsets.all(16.spMin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Container(
                          constraints: BoxConstraints(
                              minWidth: 50.w,
                              maxWidth: 50.w,
                              minHeight: 50.h,
                              maxHeight: 50.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.white,
                          ),
                          child: SvgPicture.asset(
                            Constant.assets.user,
                            width: 40.spMin,
                            height: 40.spMin,
                            fit: BoxFit.cover,
                          )),
                      title: Column(
                        children: [
                          Text(
                            'Name: ${repos[index]['name']}',
                            style: TextStyle(
                                fontSize: 16.spMin,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Owner: ${repos[index]['owner']}',
                            style: TextStyle(
                                fontSize: 14.spMin, color: Colors.grey[700]),
                          )
                        ],
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.blue.shade50),
                        child: Padding(
                          padding: EdgeInsets.all(4.spMin),
                          child: Text(
                            repos[index]['date']!,
                            style: TextStyle(
                                fontSize: 12.spMin, color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          'Main Branch: ${repos[index]['branch']}',
                          style: TextStyle(
                              fontSize: 14.spMin, color: Colors.grey[700]),
                        ),
                        SizedBox(width: 8.w),
                        Icon(Icons.copy,
                            size: 16.spMin, color: Colors.grey[700]),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            if (index != repos.last.length) {
              return const Divider(indent: 5,endIndent: 5,color: Colors.white,);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
