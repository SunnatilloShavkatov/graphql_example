import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_jobs/src/bloc/jobs_bloc.dart';
import 'package:flutter_graphql_jobs/src/ui/jobs_page.dart';

import 'api/api.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.jobsApiClient}) : super(key: key);

  final JobsApiClient jobsApiClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => JobsBloc(
          jobsApiClient: jobsApiClient,
        )..add(JobsFetchStarted()),
        child: JobsPage(),
      ),
    );
  }
}
