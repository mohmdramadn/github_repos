import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_repos/screens/repo_details/repo_details_view_model.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class RepoDetailsScreen extends StatelessWidget {
  const RepoDetailsScreen(
      {super.key, required this.ownerName, required this.repoName});

  final String ownerName;
  final String repoName;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RepoDetailsViewModel>.value(
        value: getIt<RepoDetailsViewModel>()
          ..setOwnerName(ownerName)
          ..setRepoName(repoName),
        child: const _Body());
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    Future.microtask(
        () => context.read<RepoDetailsViewModel>().getRepoDetails());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = context.watch<RepoDetailsViewModel>().isLoading;
    var ownerName = context.watch<RepoDetailsViewModel>().ownerName;
    var branches = context.watch<RepoDetailsViewModel>().branches;

    return Scaffold(
      appBar: AppBar(title: const Text('Repo details')),
      body: Padding(
        padding: EdgeInsets.all(16.spMin),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Text(
                    'Owner: $ownerName',
                    style: TextStyle(fontSize: 20.spMin),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Branches : ',
                      style: TextStyle(fontSize: 15.spMin),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 200.h,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListView.builder(
                      itemCount: branches?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Text(
                        branches?[index].name ?? '',
                        style:
                            TextStyle(color: Colors.black, fontSize: 15.spMin),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
