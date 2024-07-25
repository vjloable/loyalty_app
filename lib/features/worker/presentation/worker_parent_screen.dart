import 'package:flutter/material.dart';
import 'package:loyalty_app/features/worker/data/worker_repository.dart';
import 'package:loyalty_app/features/worker/presentation/worker_account_screen.dart';
import 'package:loyalty_app/features/worker/presentation/worker_home_screen.dart';

import '../../../common_widgets/bottom_appbar_widget.dart';
import '../../../common_widgets/top_appbar_widget.dart';
import '../../../utils/state_handlers.dart';
import '../../authentication/application/authentication_service.dart';
import '../domain/worker_model.dart';

class WorkerParentScreen extends StatefulWidget {
  final Worker worker;
  const WorkerParentScreen({super.key, required this.worker });

  @override
  State<WorkerParentScreen> createState() => _WorkerParentScreenState();
}

class _WorkerParentScreenState extends State<WorkerParentScreen> {
  PageStateHandler pageStateHandler = PageStateHandler();

  Future<void> refreshWorker() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF9F9F9),
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: const TopAppBar(height: 80),
        body: FutureBuilder(
          future: WorkerRepository.getWorkerDoc(widget.worker.uid),
          initialData: widget.worker,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                Worker worker = snapshot.data!;
                return AnimatedBuilder(
                  animation: pageStateHandler,
                  builder: (context, child) {
                    return pageStateHandler.currentPage == 0
                        ? WorkerHomeScreen( worker: worker, callback: refreshWorker,)
                        : pageStateHandler.currentPage == 1
                        ? const Placeholder()
                        : pageStateHandler.currentPage == 2
                        ? const Placeholder()
                        : pageStateHandler.currentPage == 3
                        ? WorkerAccountScreen(worker: worker,) : const Placeholder();
                  },
                );
              }
            } else if (snapshot.hasError) {
              return const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    color: Color(0xFFFF7373),
                    value: null,
                  ),
                ),
              );
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    AuthenticationService.signOut();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6590FF),
                    minimumSize: const Size(double.infinity, 40),
                    surfaceTintColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Color(0xFF6590FF))
                    ),
                    elevation: 4,
                  ),
                  child: const Text("LOGOUT", style: TextStyle(color: Color(0xFFF9F9F9), fontSize: 18, fontWeight: FontWeight.w600)),
                ),
              ),
            );
          }
        ),
        bottomNavigationBar: CustomBottomAppBar(pageStateHandler: pageStateHandler),
      ),
    );
  }
}
