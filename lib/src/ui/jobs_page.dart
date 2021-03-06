import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_jobs/src/bloc/jobs_bloc.dart';

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jobs')),
      body: Center(
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is JobsLoadInProgress) {
              return CircularProgressIndicator();
            }
            if (state is JobsLoadSuccess) {
              return ListView.builder(
                itemCount: state.jobs.length,
                itemBuilder: (context, index) {
                  final job = state.jobs[index];
                  return ListTile(
                    key: Key(job.id),
                    leading: Icon(Icons.location_city),
                    title: Text(job.title),
                    trailing: Icon(
                      job.isFeatured == true ? Icons.star : Icons.star_border,
                      color: Colors.orangeAccent,
                    ),
                    subtitle: job.locationNames != null
                        ? Text(job.locationNames!)
                        : null,
                  );
                },
              );
            }
            return Text('Oops something went wrong!');
          },
        ),
      ),
    );
  }
}
