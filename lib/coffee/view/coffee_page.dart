// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:very_good_coffee/coffee/coffee.dart';
import 'package:very_good_coffee/helpers/gallery_helper.dart';
import 'package:very_good_coffee/repository/coffee_repository.dart';

import '../../model/coffee_model.dart';

class CoffeePage extends StatelessWidget {
  const CoffeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = CoffeeRepository();
    final galleryHelper = GalleryHelper();

    return BlocProvider(
      create: (_) => CoffeeBloc(
        repository,
        galleryHelper,
      ),
      child: const CoffeeView(),
    );
  }
}

class CoffeeView extends StatefulWidget {
  const CoffeeView({Key? key}) : super(key: key);

  @override
  State<CoffeeView> createState() => _CoffeeViewState();
}

class _CoffeeViewState extends State<CoffeeView> {
  @override
  void initState() {
    super.initState();
    context.read<CoffeeBloc>().add(CoffeeRequestedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Very Good Coffee!'),
      ),
      body: const _CoffeeBody(),
    );
  }
}

class _CoffeeBody extends StatelessWidget {
  const _CoffeeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void toggleLoader() {
      bool showLoader = context.read<CoffeeBloc>().state.loading;
      if (showLoader) {
        context.loaderOverlay.show();
      } else {
        context.loaderOverlay.hide();
      }
    }

    void requestNewCoffee() {
      context.read<CoffeeBloc>().add(CoffeeRequestedEvent());
    }

    void saveCoffee() {
      var coffee = context.read<CoffeeBloc>().state.coffee;
      context.read<CoffeeBloc>().add(
            CoffeeSaveRequestedEvent(coffee: coffee),
          );
    }

    toggleLoader();

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: CoffeeImage(
              imageUrl: context.watch<CoffeeBloc>().state.coffee.imageUrl,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CtaButton(
                  onPressed: requestNewCoffee,
                  text: 'New Coffee',
                  padding: const EdgeInsets.fromLTRB(25.0, 10.0, 5.0, 10.0),
                  color: Theme.of(context).colorScheme.primary,
                ),
                CtaButton(
                  onPressed: saveCoffee,
                  text: 'Save Coffee',
                  padding: const EdgeInsets.fromLTRB(5.0, 10.0, 25.0, 10.0),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
