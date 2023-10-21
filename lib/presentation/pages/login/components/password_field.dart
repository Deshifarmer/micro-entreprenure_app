import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required TextEditingController password,
    super.key,
  }) : _password = password;

  final TextEditingController _password;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: widget._password,
      //     state is RecordSowingInitial ? state.unit : null,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        // fillColor: tertiaryColor,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xffe9edde),
          ),
        ),
        // suffixIcon: Icon(
        //   Icons.remove_red_eye,
        //   color: Colors.white,
        // ),
        /// suffix icon to toggle password visibility
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
        ),
        hintText: 'পাসওয়ার্ড',
        hintStyle: const TextStyle(
          color: Color(0xff787878),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xffe9edde),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Color(0xffe9edde),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          // vertical: 20,
          horizontal: 15,
        ),
        // filled: true,
      ),
    );
  }
}

// class PasswordTextField extends StatefulWidget {
//   const PasswordTextField({
//     required this.passwordController,
//     super.key,
//   });

//   final TextEditingController passwordController;

//   @override
//   State<PasswordTextField> createState() => _PasswordTextFieldState();
// }

// class _PasswordTextFieldState extends State<PasswordTextField> {
//   bool isShowing = true;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       style: const TextStyle(color: Colors.white),
//       controller: widget.passwordController,
//       keyboardType: TextInputType.text,
//       obscureText: isShowing,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(
//             color: Colors.white,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(
//             color: Colors.white,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(
//             color: Colors.white,
//           ),
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 10,
//         ),
//         // icon: Icon(Icons.password),
//         // prefix: Icon(Icons.password),
//         suffix: InkWell(
//           onTap: () {
//             setState(() {
//               isShowing = !isShowing;
//             });
//           },
//           child: Icon(
//             Icons.password,
//             color: isShowing ? Colors.white : primaryColor,
//           ),
//         ),
//         fillColor: tertiaryColor,
//         filled: true,
//         labelText: 'পাসওয়ার্ড',
//         labelStyle: const TextStyle(
//           color: textGrey,
//         ),
//       ),
//     );
//   }
// }
