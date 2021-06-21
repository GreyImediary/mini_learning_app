import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mini_learning_app/bloc/exercise/exercise_bloc.dart';
import 'package:mini_learning_app/bloc/exercise/exercise_event.dart';
import 'package:mini_learning_app/bloc/exercise/exercise_repository.dart';
import 'package:mini_learning_app/bloc/exercise/exercise_state.dart';
import 'package:mini_learning_app/bloc/page_handler.dart';
import 'package:mini_learning_app/dio_client.dart';
import 'package:mini_learning_app/model/exercise/exercise_card_data/exercise_card_data.dart';
import 'package:mini_learning_app/ui/widgets/ThemedProgressIndicator.dart';
import 'package:mini_learning_app/ui/widgets/exercise_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final exercises = <ExerciseCardData>[];
  late RefreshController _controller;

  @override
  void initState() {
    _controller = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Упражнения'),
      ),
      body: BlocProvider(
        create: (context) => ExerciseBloc(
          ExerciseRepository(
            DioClient.dio,
            PageHandler(),
          ),
        )..add(ExercisesRequested()),
        child: BlocConsumer<ExerciseBloc, ExerciseState>(
          listener: (_, state) {
            if (state is ExercisesSuccess) {
              exercises.addAll(state.exercises);
            }
          },
          builder: (context, state) {
            if (state is ExerciseInitial) {
              return Center(
                child: ThemedProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: Center(
                  child: SmartRefresher(
                    enablePullUp: true,
                    onRefresh: () {
                      context.read<ExerciseBloc>().add(ExercisesReset());
                      _controller.refreshCompleted();
                    },
                    onLoading: () {
                      context.read<ExerciseBloc>().add(ExercisesRequested());
                      _controller.loadComplete();
                    },
                    controller: _controller,
                    child: exercises.isNotEmpty
                        ? _showTests()
                        : _showNoTestsContent(context),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _showTests() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: exercises.length,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        itemBuilder: (BuildContext context, int index) => ExerciseCard(exercises[index]),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      ),
    );
  }

  Widget _showNoTestsContent(BuildContext context) {
    return Center(
      child: Text(
        'К сожалению, в данный момент нет упражнений :(',
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
