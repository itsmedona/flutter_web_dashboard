import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:web_application/asset_gen/assets.gen.dart';
import 'package:web_application/core/animations/entrance_fader.dart';
import 'package:web_application/core/constants/size_constants.dart';
import 'package:web_application/generated/l10n.dart';
import 'package:web_application/view/widgets/card_header.dart';
import 'package:web_application/view/widgets/master_layout/master_layout.dart';
import 'package:web_application/view/widgets/ui_components_widgets/ui_components_appbar.dart';

class DialogsScreen extends StatefulWidget {
  const DialogsScreen({Key? key}) : super(key: key);

  @override
  State<DialogsScreen> createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen> {

  void _showDialog(BuildContext context, DialogType dialogType) {
    final dialog = AwesomeDialog(
      context: context,
      transitionAnimationDuration: const Duration(microseconds: 300),
      dialogType: dialogType,
      title: 'Dialog Title',
      desc: 'Dialog body...',
      width: kDialogWidth,
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
    );

    dialog.show();
  }

  void _showUpdateSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'Update Successful',
      desc: 'The update was completed successfully.',
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
    ).show();
  }

  void _simulateUpdateProcess(BuildContext context) async {
    // Show a progress dialog or any loading indication
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      title: 'Updating',
      desc: 'Please wait while the update is being processed...',
    ).show();

    // Simulate a delay for the update process
    await Future.delayed(const Duration(seconds: 2));

    // Hide the progress dialog
    Navigator.of(context).pop();

    // Show the success dialog
    _showUpdateSuccessDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return PortalMasterLayout(
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          UIComponenetsAppBar(
            title: Lang.current.dailogs,
            subtitle: Lang.current.dailogTitle,
            icon: Assets.images.png.secured
                .image(height: kDefaultPadding * 2, fit: BoxFit.cover),
            buttonTitle: '',
            onClick: () {},
          ),
          EntranceFader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding + kTextPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: CardBody(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: kDefaultPadding * 2.0,
                            runSpacing: kDefaultPadding * 2.0,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.info),
                                child: const Text('Info'),
                              ),
                              ElevatedButton(
                                onPressed: () => _showDialog(
                                    context, DialogType.infoReverse),
                                child: const Text('Info Reversed'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.warning),
                                child: const Text('Warning'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.error),
                                child: const Text('Error'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.success),
                                child: const Text('Success'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    _showDialog(context, DialogType.question),
                                child: const Text('Question'),
                              ),
                              ElevatedButton(
                                onPressed: () =>
                                    _simulateUpdateProcess(context),
                                child: const Text('Updating'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: CardBody(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: kDefaultPadding * 2.0,
                            runSpacing: kDefaultPadding * 2.0,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Your additional button actions here
                                },
                                child: const Text('Additional Button 1'),
                              ),
                              // Add more buttons if needed
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
