import 'package:fancy_password_field/src/widget/semantics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultShowHidePasswordButton extends StatelessWidget {
  const DefaultShowHidePasswordButton({
    Key? key,
    required bool hidePassword,
    IconData? showPasswordIcon,
    IconData? hidePasswordIcon,
    required Function() onPressed,
  })  : _hidePassword = hidePassword,
        _showPasswordIcon = showPasswordIcon,
        _hidePasswordIcon = hidePasswordIcon,
        _onPressed = onPressed,
        super(key: key);

  final bool _hidePassword;
  final IconData? _showPasswordIcon;
  final IconData? _hidePasswordIcon;
  final Function() _onPressed;
  static const String _showPasswordDescription =
      "Zeigt das Password im Klartext";
  static const String _hidePasswordDescription = "Versteckt das Passwort";

  @override
  Widget build(BuildContext context) {
    return buildWidgetWithSemantics(
        _hidePassword ? _showPasswordDescription : _hidePasswordDescription,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _onPressed,
              child: _hidePassword
                  ? FaIcon(
                      _hidePasswordIcon ?? FontAwesomeIcons.eye,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Icon(
                        _showPasswordIcon ?? FontAwesomeIcons.eyeSlash,
                      ),
                    ),
            ),
          ],
        ));
  }
}
