import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mini_learning_app/bloc/page_handler.dart';
import 'package:mini_learning_app/bloc/test/test_bloc.dart';
import 'package:mini_learning_app/bloc/test/test_event.dart';
import 'package:mini_learning_app/bloc/test/test_repository.dart';
import 'package:mini_learning_app/bloc/test/test_state.dart';
import 'package:mini_learning_app/dio_client.dart';
import 'package:mini_learning_app/model/test/test_card_data/test_card_data.dart';
import 'package:mini_learning_app/ui/screens/test_passing_screen.dart';
import 'package:mini_learning_app/ui/widgets/ThemedProgressIndicator.dart';
import 'package:mini_learning_app/ui/widgets/test_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final tests = <TestCardData>[];
  late RefreshController _controller;

  @override
  void initState() {
    _controller = RefreshController(initialRefresh: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TestBloc(
          TestRepository(
            DioClient.dio,
            PageHandler(),
          ),
        )..add(TestsRequested()),
        child: BlocConsumer<TestBloc, TestState>(
          listener: (_, state) {
            if (state is TestsSuccess) {
              tests.addAll(state.tests);
            } else if (state is TestSuccess) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => TestPassingScreen(state.test),
              ));
            }
          },
          builder: (context, state) {
            if (state is TestInitial) {
              return Center(
                child: ThemedProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: Center(
                  child: SmartRefresher(
                    enablePullUp: true,
                    onRefresh: () {
                      context.read<TestBloc>().add(TestsReset());
                      _controller.refreshCompleted();
                    },
                    onLoading: () {
                      context.read<TestBloc>().add(TestsRequested());
                      _controller.loadComplete();
                    },
                    controller: _controller,
                    child: tests.isNotEmpty
                        ? _showTests(context)
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

  Widget _showTests(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: tests.length,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        itemBuilder: (BuildContext context, int index) => TestCard(
          testCardData: tests[index],
          onTap: () {
            context.read<TestBloc>().add(TestRequested(tests[index].id));
          },
        ),
        staggeredTileBuilder: (_) => StaggeredTile.fit(1),
      ),
    );
  }

  Widget _showNoTestsContent(BuildContext context) {
    return Center(
      child: Text(
        'К сожалению, в данный момент нет тестов :(',
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
