import 'package:flutter/material.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/model/api/api_response.dart';
import 'package:flutter_tutorial/design_pattern/mvvm_pattern/source/view_model/media_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Text(
              "MVVM Pattern",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )),
        body: getWidget(viewModel, viewModel.response),
      ),
    );
  }

  Widget getWidget(ViewModel viewModel, ApiResponse apiResponse) {
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.listModel?.length,
                itemBuilder: (context, index) {
                  final data = viewModel.listModel?[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data?.id}",
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data?.userName ?? "",
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data?.petName ?? "",
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Image.network(data?.petImage ?? ""),
                    ],
                  );
                }));
      case Status.ERROR:
        return const Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
        return const Center(
          child: Text('Search the lists'),
        );
    }
  }
}
