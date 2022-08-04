import 'package:fastpad/bloc/notes_bloc/notes_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();

    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Введите пароль",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      BlocProvider.of<NotesBloc>(context)
                          .add(CheckPasswordEvent(passwordController.text));
                    },
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Theme.of(context).colorScheme.onError),
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(
                        helperText: "Подсказка: ${state.helpText}",
                        semanticCounterText: "*"),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      state.isLogin
                          ? Navigator.pushNamedAndRemoveUntil(
                              context, "/notes", (route) => false)
                          : null;
                    },
                    child: Text(
                      "Войти",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                      "Если по какой-то причине вы забыли пароль, то вы можете удалить приложение и загрузить снова, но тогда вы потеряете все свои записи."),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                      "Если на вашем устройстве есть датчик отпечатка пальца, то вы можете войти в блокнот по нему, просто приложив палец к сканеру."),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
