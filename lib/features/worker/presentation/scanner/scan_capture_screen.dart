import 'package:flutter/material.dart';
import 'package:loyalty_app/features/worker/presentation/scanner/scan_overlay_painter.dart';
import 'package:loyalty_app/features/worker/presentation/scanner/scan_result_screen.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../utils/custom_icons.dart';


class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final MobileScannerController controller = MobileScannerController();

  Widget _buildBarcodeOverlay() {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        // Not ready.
        if (!value.isInitialized || !value.isRunning || value.error != null) {
          return const SizedBox();
        }

        return StreamBuilder<BarcodeCapture>(
          stream: controller.barcodes,
          builder: (context, snapshot) {
            final BarcodeCapture? barcodeCapture = snapshot.data;

            // No barcode.
            if (barcodeCapture == null || barcodeCapture.barcodes.isEmpty) {
              return const SizedBox();
            }

            final scannedBarcode = barcodeCapture.barcodes.first;

            // No barcode corners, or size, or no camera preview size.
            if (scannedBarcode.corners.isEmpty ||
                value.size.isEmpty ||
                barcodeCapture.size.isEmpty) {
              return const SizedBox();
            }

            return CustomPaint(
              painter: BarcodeOverlay(
                barcodeCorners: scannedBarcode.corners,
                barcodeSize: barcodeCapture.size,
                boxFit: BoxFit.contain,
                cameraPreviewSize: value.size,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildScanWindow(Rect scanWindowRect) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, value, child) {
        // Not ready.
        if (!value.isInitialized ||
            !value.isRunning ||
            value.error != null ||
            value.size.isEmpty) {
          return const SizedBox();
        }

        return CustomPaint(
          painter: ScanOverlay(scanWindowRect),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 250,
      height: 250,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            fit: BoxFit.cover,
            scanWindow: scanWindow,
            controller: controller,
          ),
          _buildBarcodeOverlay(),
          _buildScanWindow(scanWindow),
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      height: 50,
                      width: 110,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,8,8,8),
                                child: SizedBox(
                                  height: 26,
                                  width: 13,
                                  child: CustomIcons.back_arrow_light,
                                ),
                              ),
                            ),
                            const Text(
                              "BACK",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  height: 100,
                  color: const Color(0x806590FF),
                  child: const Center(
                    child: Text(
                      "SCAN TO SEND POINTS",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              height: 150,
              color: Colors.black.withOpacity(0.4),
              child: ScanResultScreen(barcodes: controller.barcodes),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }
}
