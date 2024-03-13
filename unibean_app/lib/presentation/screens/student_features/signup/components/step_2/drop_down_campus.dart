import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unibean_app/presentation/config/constants.dart';

import '../../../../../../data/models.dart';
import '../../../../../blocs/blocs.dart';

class DropDownCampus extends StatefulWidget {
  final double hem;
  final double fem;
  final double ffem;
  final String labelText;
  final String hintText;
  final TextEditingController campusController;
  final FormFieldValidator<String> validator;

  const DropDownCampus(
      {super.key,
      required this.hem,
      required this.fem,
      required this.ffem,
      required this.labelText,
      required this.hintText,
      required this.campusController,
      required this.validator});

  @override
  State<DropDownCampus> createState() => _DropDownCampusState();
}

class _DropDownCampusState extends State<DropDownCampus> {
  List<CampusModel> campuses = List.empty();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 43 * widget.hem,
      width: 272 * widget.fem,
      child: BlocConsumer<CampusBloc, CampusState>(
        listener: (context, state) {
          if (state is CampusLoaded) {
            campuses = state.campuses.toList();
          }
        },
        builder: (context, state) {
          if (state is CampusLoading) {
            return Center(
                child: Lottie.asset('assets/animations/loading-screen.json',
                    width: 50 * widget.fem, height: 50 * widget.hem));
          } else if (state is CampusLoaded) {
            campuses = state.campuses.toList();
            return _dropDownCampusLoaded();
          }
          return _dropDownCampusLoaded();
        },
      ),
    );
  }

  DropdownButtonFormField<String> _dropDownCampusLoaded() {
    return DropdownButtonFormField(
      validator: widget.validator,
      style: GoogleFonts.openSans(
          textStyle: TextStyle(
              color: Colors.black,
              fontSize: 14 * widget.ffem,
              fontWeight: FontWeight.w700)),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: GoogleFonts.openSans(
          textStyle: TextStyle(
              color: kPrimaryColor,
              fontSize: 15 * widget.ffem,
              fontWeight: FontWeight.w900),
        ),
        hintStyle: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: kLowTextColor,
                fontSize: 17 * widget.ffem,
                fontWeight: FontWeight.w700)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 26 * widget.fem, vertical: 10 * widget.hem),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28 * widget.fem),
            borderSide: BorderSide(
                width: 2, color: const Color.fromARGB(255, 220, 220, 220)),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28 * widget.fem),
            borderSide: BorderSide(
                width: 2, color: const Color.fromARGB(255, 220, 220, 220)),
            gapPadding: 10),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28 * widget.fem),
            borderSide: BorderSide(
                width: 2, color: const Color.fromARGB(255, 220, 220, 220)),
            gapPadding: 10),
      ),
      onChanged: (newValue) {
        setState(() {
          widget.campusController.text = newValue!;
        });
      },
      items: campuses.map((u) {
        return DropdownMenuItem(
          child: Text(u.campusName.toString()),
          value: u.id,
        );
      }).toList(),
    );
  }
}
