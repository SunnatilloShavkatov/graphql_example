import 'package:flutter/material.dart';
import 'package:flutter_graphql_jobs/src/api/api.dart';
import 'package:flutter_graphql_jobs/src/app.dart';

void main() {
  runApp(
    App(jobsApiClient: JobsApiClient.create()),
  );
}
