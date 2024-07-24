import 'package:flutter/material.dart';
import 'package:loyalty_app/common_widgets/rounded_elevated_button.dart';
import 'package:loyalty_app/features/worker/presentation/scanner/scan_send_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanResultScreen extends StatelessWidget {
  const ScanResultScreen({
    super.key,
    required this.barcodes,
  });

  final Stream<BarcodeCapture> barcodes;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: barcodes,
      builder: (context, snapshot) {
        final scannedBarcodes = snapshot.data?.barcodes ?? [];

        if (scannedBarcodes.isEmpty) {
          return const RoundedElevatedButton(
            backgroundColor: Color(0xFFFFFFFF),
            text: "CAPTURING",
            onPressed: null,
            borderColor: Color(0xFF6590FF),
          );
        } else {
          if (scannedBarcodes.first.displayValue!.length < 28) {
            return RoundedElevatedButton(
              backgroundColor: const Color(0xFFFFFFFF),
              text: scannedBarcodes.first.displayValue!,
              onPressed: null,
            );
          }
        }

        return RoundedElevatedButton(
          backgroundColor: const Color(0xFFFFFFFF),
          text: scannedBarcodes.first.displayValue ?? 'No display value.',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanSendScreen(recipient: scannedBarcodes.first.displayValue!,)));
          },
        );
      },
    );
  }
}