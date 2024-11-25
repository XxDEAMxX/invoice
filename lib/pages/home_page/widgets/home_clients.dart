import 'package:facturacion/models/client_model.dart';
import 'package:facturacion/pages/home_page/home_provider.dart';
import 'package:facturacion/widgets/ss_card.dart';
import 'package:facturacion/widgets/ss_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeClients extends ConsumerStatefulWidget {
  const HomeClients({
    super.key,
  });

  @override
  ConsumerState<HomeClients> createState() => _HomeClientsState();
}

class _HomeClientsState extends ConsumerState<HomeClients> {
  @override
  Widget build(BuildContext context) {
    final bool loading = ref.watch(homeProvider).loadingClients;
    final List<ClientModel>? clients = ref.watch(homeProvider).clients;

    return loading
        ? const Center(child: CircularProgressIndicator())
        : SsListView(
            onRefresh: () {
              return ref.read(homeProvider.notifier).fetchDataClients();
            },
            itemCount: clients?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SsCard(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Text(
                            clients![index].id.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(clients[index].name),
                              Text(clients[index].documentType),
                              const Text('Telefono'),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(clients[index].email),
                          Text(clients[index].documentNumber.toString()),
                          Text(clients[index].phone),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
