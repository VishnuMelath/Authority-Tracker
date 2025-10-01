import 'package:authority_tracker/data/data_sources/user_cache.dart';
import 'package:authority_tracker/domain/models/permits_model.dart';
import 'package:authority_tracker/presentation/controllers/permit_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<PermitController>(
      context,
      listen: false,
    ).getPermitsByProject(UserCache.projectId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PermitController>(
        builder: (context, controller, child) {
          if (controller.isloading == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.isloading == false) {
            return controller.permits.isEmpty
                ? const Center(child: Text('No permits'))
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (context, index) =>
                        PermitTile(permitsModel: controller.permits[index]),
                    itemCount: controller.permits.length,
                  );
          } else {
            return Center(
              child: GestureDetector(
                onTap: () {
                  controller.getPermitsByProject(UserCache.projectId!);
                },
                child: const Text('Error!\nTap to retry'),
              ),
            );
          }
        },
      ),
    );
  }
}

class PermitTile extends StatelessWidget {
  final PermitsModel permitsModel;
  const PermitTile({super.key, required this.permitsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Text(permitsModel.name)]),
        ],
      ),
    );
  }
}
