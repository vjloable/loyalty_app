import 'package:flutter/material.dart';
import 'package:loyalty_app/features/authentication/data/user_repository.dart';

import '../../../common_widgets/rounded_elevated_button.dart';
import '../../../utils/custom_icons.dart';
import '../../../utils/illustration_vectors.dart';
import '../../authentication/application/authentication_service.dart';
import '../../authentication/domain/user_model.dart';

class AuthorizedAccessScreen extends StatefulWidget {
  final GenericUser userModel;
  const AuthorizedAccessScreen({super.key, required this.userModel});

  @override
  State<AuthorizedAccessScreen> createState() => _AuthorizedAccessScreenState();
}

class _AuthorizedAccessScreenState extends State<AuthorizedAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IllustrationVectors.authorized_access_hero,
          Column(
            children: [
              Container(
                height: 104,
              ),
              SizedBox(
                height: 84,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      radius: 100,
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.transparent,
                        child: SizedBox(
                          height: 26,
                          width: 13,
                          child: CustomIcons.back_arrow_dark,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 60,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Authorized Access",
                      style: TextStyle(
                        color: Color(0xFFFF7373),
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              widget.userModel.permissionMax >= 4
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: RoundedElevatedButton(
                    text: "Administrator",
                    backgroundColor: const Color(0xFFFFFFFF),
                    onPressed: widget.userModel.permissionLevel == 4 ? null : () {
                      UserRepository.setPermissionLevel(widget.userModel, 4).then((result) {
                        if (result == "Success") {
                          Navigator.of(context).pop();
                          AuthenticationService.signOut();
                          Navigator.of(context).pop();
                        }
                      });
                    }),
                  )
                  : Container(),
              const SizedBox(height: 15,),
              widget.userModel.permissionMax >= 3
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: RoundedElevatedButton(
                    text: "Owner",
                    backgroundColor: const Color(0xFFFFFFFF),
                    onPressed: widget.userModel.permissionLevel == 3 ? null : () {
                      UserRepository.setPermissionLevel(widget.userModel, 3).then((result) {
                        if (result == "Success") {
                          Navigator.of(context).pop();
                          AuthenticationService.signOut();
                          Navigator.of(context).pop();
                        }
                      });
                    }),
                  )
                  : Container(),
              const SizedBox(height: 15,),
              widget.userModel.permissionMax >= 2
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: RoundedElevatedButton(
                    text: "Manager",
                    backgroundColor: const Color(0xFFFFFFFF),
                    onPressed: widget.userModel.permissionLevel == 2 ? null : () {
                      UserRepository.setPermissionLevel(widget.userModel, 2).then((result) {
                        if (result == "Success") {
                          Navigator.of(context).pop();
                          AuthenticationService.signOut();
                          Navigator.of(context).pop();
                        }
                      });
                    }),
                  )
                  : Container(),
              const SizedBox(height: 15,),
              widget.userModel.permissionMax >= 1
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: RoundedElevatedButton(
                    text: "Worker",
                    backgroundColor: const Color(0xFFFFFFFF),
                    onPressed: widget.userModel.permissionLevel == 1 ? null : () {
                      UserRepository.setPermissionLevel(widget.userModel, 1).then((result) {
                        if (result == "Success") {
                          Navigator.of(context).pop();
                          AuthenticationService.signOut();
                          Navigator.of(context).pop();
                        }
                      });
                    }),
                  )
                  : Container(),
              const SizedBox(height: 15,),
              widget.userModel.permissionMax >= 0
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: RoundedElevatedButton(
                    text: "Customer",
                    backgroundColor: const Color(0xFFFFFFFF),
                    onPressed: widget.userModel.permissionLevel == 0 ? null : () {
                      UserRepository.setPermissionLevel(widget.userModel, 0).then((result) {
                        if (result == "Success") {
                          Navigator.of(context).pop();
                          AuthenticationService.signOut();
                          Navigator.of(context).pop();
                        }
                      });
                    }),
              )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
