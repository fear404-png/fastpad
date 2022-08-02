import 'package:fastpad/bloc/bloc/notes_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecurityWidget extends StatelessWidget {
  const SecurityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController onePassword = TextEditingController();
    TextEditingController twoPassword = TextEditingController();
    TextEditingController helperText = TextEditingController();

    final List<Widget> securityListWidget = [
      BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (!state.isSecure) {
            onePassword.text = "";
            twoPassword.text = "";
            helperText.text = "";
          }

          String error = state.erorrTextPasswordRegistration;

          return Column(
            children: [
              ListTile(
                leading: const Icon(Icons.security_update_good),
                title: const Text("Вход по паролю"),
                trailing: CupertinoSwitch(
                  onChanged: (value) {
                    BlocProvider.of<NotesBloc>(context)
                        .add(ChangeSecureParam(value));
                    value = state.isSecure;
                  },
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: state.isSecure,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: onePassword,
                  enabled: state.isSecure,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Пароль',
                    errorText:
                        state.isErrorInPasswordRegistration ? error : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: twoPassword,
                  enabled: state.isSecure,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Повтор пароля',
                    errorText:
                        state.isErrorInPasswordRegistration ? error : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: helperText,
                  enabled: state.isSecure,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Подсказка',
                      helperText:
                          "Подсказка может помочь вам вспомнить ваш пароль"),
                ),
              ),
              state.isSecure
                  ? Column(
                      children: [
                        ListTile(
                          title: Text(
                            "ВНИМАНИЕ!",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          subtitle: Text(
                              style: Theme.of(context).textTheme.bodyLarge,
                              "Запомните пароль! Если вы его забудете, то потеряете "
                              "все свои записи, войти в блокнот будет НЕВОЗМОЖНО!"
                              " Единственный выход из этой ситуации, это удалить"
                              " и заново установить приложение."
                              "\n\nПоставьте галочку снизу если согласны на такие условия."),
                        ),
                        ListTile(
                          title: const Text("Да ваще похую"),
                          leading: Checkbox(
                            onChanged: (value) {
                              BlocProvider.of<NotesBloc>(context)
                                  .add(FuckItEvent(value!));
                            },
                            value: state.fuckIt,
                          ),
                        ),
                        state.fuckIt
                            ? OutlinedButton(
                                onPressed: () {
                                  if (onePassword.text == twoPassword.text) {
                                    if (onePassword.text.length >= 4) {
                                      BlocProvider.of<NotesBloc>(context).add(
                                          PasswordRegistrationSuccessful(
                                              onePassword.text,
                                              helperText.text));
                                    } else {
                                      BlocProvider.of<NotesBloc>(context).add(
                                          PasswordRegistrationError(
                                              "Пароль должен быть минимум 4 символа!"));
                                    }
                                  } else {
                                    BlocProvider.of<NotesBloc>(context).add(
                                        PasswordRegistrationError(
                                            "Пароли не совподают!"));
                                  }
                                },
                                child: Text(
                                  "Сохранить",
                                  style: Theme.of(context).textTheme.headline6,
                                ))
                            : Container()
                      ],
                    )
                  : Container(),
            ],
          );
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Безопасность"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return securityListWidget[index];
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.black,
              height: 2,
            );
          },
          itemCount: securityListWidget.length),
    );
  }
}
