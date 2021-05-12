import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_learning_app/bloc/user/user_bloc.dart';
import 'package:mini_learning_app/model/user/user.dart';
import 'package:mini_learning_app/ui/screens/favorites_screen.dart';

class ProfileCard extends StatelessWidget {
  final User user;

  ProfileCard(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 3),
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/defaultProfile.png',
                  image: '',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 400),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      user.company,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                borderRadius: BorderRadius.circular(4),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  splashColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: context.read<UserBloc>(),
                          child: FavoritesScreen(userId: user.id),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.bookmark,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(4),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  splashColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.leaderboard,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(4),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  splashColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.settings,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
