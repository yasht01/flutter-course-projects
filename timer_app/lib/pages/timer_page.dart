import 'package:flutter/material.dart';

import 'package:timer_app/components/button_state.dart';
import 'package:timer_app/services/service_locator.dart';
import 'package:timer_app/pages/timer_page_logic.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Timer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TimerTitle(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            ButtonContainer(),
          ],
        ),
      ),
    );
  }
}

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateManager = getIt<TimerPageManager>();
    return ValueListenableBuilder<String>(
      valueListenable: stateManager.timeNotifier,
      builder: (context, timeLeft, _) {
        return Text(
          timeLeft,
          style: TextStyle(
            color: Colors.white,
            fontSize: 80.0,
            fontFamily: 'Odibee Sans',
            letterSpacing: 5.0,
          ),
        );
      },
    );
  }
}

class TimerTitle extends StatelessWidget {
  const TimerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Meditation',
      style: TextStyle(
        fontSize: 30.0,
        fontFamily: 'Noto Sans',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateManager = getIt<TimerPageManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: stateManager.buttonNotifier,
      builder: (context, buttonState, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (buttonState == ButtonState.initial) ...[
              PlayButton(),
            ] else if (buttonState == ButtonState.finished) ...[
              // ResetButton(),
            ] else if (buttonState == ButtonState.paused) ...[
              PlayButton(),
              SizedBox(width: 40.0),
              ResetButton(),
            ] else if (buttonState == ButtonState.started) ...[
              PauseButton(),
              SizedBox(width: 40.0),
              ResetButton(),
            ]
          ],
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.deepOrange[800],
      radius: 40.0,
      child: IconButton(
        icon: Icon(
          Icons.play_arrow,
        ),
        onPressed: () {},
        color: Colors.white,
        splashColor: Colors.grey[400],
        splashRadius: 50.0,
        iconSize: 50.0,
      ),
    );
  }
}

class PauseButton extends StatelessWidget {
  const PauseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.deepOrange[800],
      radius: 40.0,
      child: IconButton(
        icon: Icon(
          Icons.pause_outlined,
        ),
        onPressed: () {},
        color: Colors.white,
        splashColor: Colors.grey[400],
        splashRadius: 50.0,
        iconSize: 50.0,
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.deepOrange[800],
      radius: 40.0,
      child: IconButton(
        icon: Icon(
          Icons.restart_alt_outlined,
        ),
        onPressed: () {},
        color: Colors.white,
        splashColor: Colors.grey[400],
        splashRadius: 50.0,
        iconSize: 50.0,
      ),
    );
  }
}
