import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:github_repos/components/app_fields.dart';
import 'package:provider/provider.dart';

import '../../constants/constant_strings.dart';
import '../../main.dart';
import '../../routes/routes_names.dart';
import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>.value(
        value: getIt<HomeViewModel>(), child: const _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body();

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
          onPressed: () => context.read<HomeViewModel>().setIsShowFilters(),
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
            onPressed: () =>
                context.read<HomeViewModel>().setIsShowSearchField(),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: RepoList(),
      ),
    );
  }
}

class RepoList extends StatelessWidget {
  const RepoList({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<HomeViewModel>().searchController;
    var isShowTextField = context.watch<HomeViewModel>().isShowSearchField;
    var isShowFilters = context.watch<HomeViewModel>().isShowFilters;
    var isLoading = context.watch<HomeViewModel>().isLoading;
    var items = context.watch<HomeViewModel>().searchResult?.items ?? [];
    var filters = context.watch<HomeViewModel>().filters;
    var selectedFilter = context.watch<HomeViewModel>().selectedFilter;

    return Padding(
      padding: EdgeInsets.all(16.spMin),
      child: Column(
        children: [
          if (isShowTextField)
            Field(
              controller: controller,
              onSearchTapped: () =>
                  context.read<HomeViewModel>().searchGithubRepos(),
            ),
          if (isShowFilters)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.spMin),
              child: SizedBox(
                height: 30.h,
                width: MediaQuery.sizeOf(context).width,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                          splashColor: Colors.transparent,
                          onTap: () => context
                              .read<HomeViewModel>()
                              .setSelectedFilter(filters[index]),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: selectedFilter == filters[index]
                                    ? Colors.blue.shade50
                                    : Colors.grey),
                            child: Padding(
                              padding: EdgeInsets.all(4.spMin),
                              child: Text(
                                filters[index],
                                style: TextStyle(
                                    fontSize: 16.spMin,
                                    color: selectedFilter == filters[index]
                                        ? Colors.blue
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 4.w),
                    itemCount: filters.length),
              ),
            ),
          SizedBox(height: 16.h),
          isLoading
              ? const CircularProgressIndicator()
              : Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.white),
                  ),
                  child: RefreshIndicator(
                    onRefresh: () =>
                        context.read<HomeViewModel>().searchGithubRepos(),
                    child: ListView.separated(
                      padding: EdgeInsets.all(16.spMin),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.toNamed(Routes.repoDetailsRoute,
                              arguments: {
                                'ownerName': items[index].owner?.login ?? '',
                                'repoName': items[index].name
                              }),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  leading: Container(
                                      constraints: BoxConstraints(
                                          minWidth: 30.w,
                                          maxWidth: 50.w,
                                          minHeight: 40.h,
                                          maxHeight: 40.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: Colors.white,
                                      ),
                                      child: items[index].owner?.avatarUrl == ''
                                          ? SvgPicture.asset(
                                              Constant.assets.user,
                                              width: 40.spMin,
                                              height: 40.spMin,
                                              fit: BoxFit.contain,
                                            )
                                          : Image.network(
                                              items[index].owner!.avatarUrl!,
                                              width: 40.spMin,
                                              height: 40.spMin,
                                              fit: BoxFit.contain)),
                                  title: Container(
                                    constraints: BoxConstraints(
                                        minWidth: 60.w,
                                        maxWidth: 60.w,
                                        minHeight: 50.h,
                                        maxHeight: 60.h),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Name: ${items[index].name}',
                                          softWrap: true,
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 16.spMin,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Owner: ${items[index].owner!.login}',
                                          softWrap: true,
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontSize: 14.spMin,
                                              color: Colors.grey[700]),
                                        )
                                      ],
                                    ),
                                  ),
                                  trailing: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                        color: Colors.blue.shade50),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.spMin),
                                      child: Text(
                                        '${items[index].createdAt?.year} - ${items[index].createdAt?.month} - ${items[index].createdAt?.day}',
                                        style: TextStyle(
                                            fontSize: 12.spMin,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.zero,
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    Text(
                                      'Main Branch: ${items[index].defaultBranch}',
                                      style: TextStyle(
                                          fontSize: 14.spMin,
                                          color: Colors.grey[700]),
                                    ),
                                    SizedBox(width: 8.w),
                                    Icon(Icons.copy,
                                        size: 16.spMin,
                                        color: Colors.grey[700]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        if (index != items.length) {
                          return const Divider(
                            indent: 5,
                            endIndent: 5,
                            color: Colors.white,
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
