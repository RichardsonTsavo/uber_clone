import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:uber_clone/app/shared/utils/auth_controller.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  AuthController authController = Modular.get();
  List<Map<String, dynamic>> slides = [
    {
      "url": "assets/slide_1.png",
      "title": "Cola com a gente!",
      "subtitle": "Descontos exclusivos com o Eats para você e sua Familia"
    },
    {
      "url": "assets/slide_2.png",
      "title": "Com fome?",
      "subtitle": "As melhores lojas na palma da sua mão"
    },
    {
      "url": "assets/slide_3.png",
      "title": "Envie um presente",
      "subtitle": "Entregue no mesmo dia suas surpresas especiais"
    }
  ];
  List<Map<String, dynamic>> banners = [
    {
      "url": "assets/banner_1.png",
      "title": "Viagens de negócios exclusivas",
      "subtitle":
          "Essa opção de viagem, exclusiva para clientes da Uber para Empresas"
    },
    {
      "url": "assets/banner_2.png",
      "title": "Viaje para qualquer destino",
      "subtitle": "Receba o que você precisa, tudo pelo Uber One"
    }
  ];
  List<Map<String, dynamic>> stores = [
    {
      "url": "assets/store_logo_1.png",
      "title": "Carrefour Hiper",
      "time": "55-75 min",
    },
    {
      "url": "assets/store_logo_2.png",
      "title": "Pão de açucar",
      "time": "60-80 min",
    },
    {
      "url": "assets/store_logo_3.png",
      "title": "Assai",
      "time": "50-70 min",
    }
  ];
  List<Map<String, dynamic>> bannerStore = [
    {
      "url": "assets/banner_3.jpg",
      "title": "Carrefour Hiper",
      "time": "Entrega R\$16,99 - 55-75 min",
    },
    {
      "url": "assets/banner_4.jpg",
      "title": "Assai",
      "time": "Entrega R\$6,99 - 50-70 min",
    },
    {
      "url": "assets/banner_5.png",
      "title": "Pão de açucar",
      "time": "Entrega R\$12,99 - 60-80 min",
    }
  ];
}
