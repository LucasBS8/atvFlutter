import 'package:appimc/pages/modelResult.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _altura = TextEditingController();
  final TextEditingController _peso = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData ctxPage = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(
            child: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          strutStyle: StrutStyle(fontSize: double.parse('23')),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/calcIMC.png',
              width: ctxPage.size.width * 0.7,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: ctxPage.size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Altura:', textScaler: TextScaler.linear(2)),
                    TextField(
                      controller: _altura,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Digite a altura aqui. Ex.: 1.90'),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: ctxPage.size.width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Peso:', textScaler: TextScaler.linear(2)),
                    TextField(
                      controller: _peso,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Digite o peso aqui. Ex.: 70.58'),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: TextButton(
                    onPressed: () {
                      verificarIMC();
                    },
                    child: const Text(
                      'Verificar',
                      style: TextStyle(fontSize: 23),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  double _imc = 0, _cvrtAltura = 0, _cvrtPeso = 0;
  void verificarIMC() {
    if (
        //evita de colocar letras e vírgukla
        !_peso.text.contains(RegExp(r'[A-Z a-z ,]')) &&
            !_altura.text.contains(RegExp(r'[A-Z a-z ,]')) &&
            //evita de o usuário deixar vazio
            _altura.text != '' &&
            _peso.text != '' &&
            //impede do usuário deixar a altura sem ponto
            _altura.text.length >= 3 &&
            _altura.text.contains('.')) {
      //IMC = peso / (altura * altura)
      _cvrtPeso = double.tryParse(_peso.text) ?? 0;
      _cvrtAltura = double.tryParse(_altura.text) ?? 0;
      _imc = _cvrtPeso / (_cvrtAltura * _cvrtAltura);
      switch (_imc) {

        case < 18.50: //abaixo do peso
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const PaginaResultado(
                  title: 'Abaixo do peso',
                  desc: '"Explore seu bem-estar! Estar abaixo do peso pode ser'
                      'um sinal para revisitar seus hábitos alimentares e de '
                      'saúde. Alimentação balanceada e atividades físicas '
                      'regulares são essenciais para atingir um peso '
                      'saudável. Lembre-se, cada corpo é único; considere'
                      'conversar com um profissional de saúde para '
                      'orientações personalizadas."',
                  caminho: 'assets/images/pesoBaixo.png'),
            ),
          );
          break;
        
        case >= 18.50 && <= 24.99: // peso normal
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const PaginaResultado(
                  title: 'Peso Normal',
                  desc: '"Parabéns pelo equilíbrio! Seu IMC indica que você '
                      'está em uma faixa de peso considerada saudável. '
                      'Continue com seus hábitos alimentares balanceados e '
                      'atividades físicas regulares para manter seu bem'
                      'estar. Lembre-se de que a saúde vai além do peso, '
                      'então foque também na qualidade de vida."',
                  caminho: 'assets/images/pesoIdeal.png'),
            ),
          );
          break;
        
        case >= 25.00 && <= 29.99: //sobre peso
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const PaginaResultado(
                  title: 'Sobre Peso',
                  desc: '"Um passo de cada vez! Estar na faixa de sobrepeso é '
                      'um sinal para refletir sobre seus hábitos de saúde. '
                      'Pequenas mudanças, como uma alimentação mais '
                      'balanceada e aumento da atividade física, podem '
                      'fazer uma grande diferença. Considerar o apoio de '
                      'profissionais pode ser um ótimo caminho para '
                      'encontrar seu equilíbrio."',
                  caminho: 'assets/images/sobrePeso.png'),
            ),
          );
          break;
        
        case >= 30.00 && <= 34.99: //obesidade nivel 1
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const PaginaResultado(
                  title: 'Obesidade grau 1',
                  desc: '"Tempo de atenção! Seu IMC indica obesidade grau I,'
                      'o que sugere a importância de cuidar mais de sua '
                      'saúde. Modificações no estilo de vida, como melhorar '
                      'a dieta e aumentar as atividades físicas, são passos '
                      'significativos. Profissionais de saúde podem oferecer '
                      'suporte e orientação personalizada para sua jornada."',
                  caminho: 'assets/images/obsd1.png'),
            ),
          );
          break;
        
        case >= 35.00 && <= 39.99: //obesidade nivel 2
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const PaginaResultado(
                  title: 'Obesidade grau 2',
                  desc: '"Foco na saúde! Estar na faixa de obesidade grau II é '
                      'um sinal para priorizar sua saúde. É importante adotar '
                      'hábitos saudáveis e, possivelmente, buscar '
                      'intervenções específicas com o suporte de '
                      'profissionais. Sua jornada para o bem-estar é '
                      'importante, e cada pequeno passo conta."',
                  caminho: 'assets/images/obsd2.png'),
            ),
          );
          break;
        
        case >= 40.00: //obesidade nivel 3
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const PaginaResultado(
                  title: 'Obesidade grau 3',
                  desc: '"Priorize seu bem-estar! Seu IMC aponta para '
                      'obesidade grau III, o que significa que é crucial focar '
                      'em sua saúde agora. Este é um momento para cuidado '
                      'e compreensão, buscando orientação de especialistas '
                      'para adotar mudanças positivas no estilo de vida. '
                      'Lembre-se, cada passo em direção à saúde é valioso."',
                  caminho: 'assets/images/obsd3.png'),
            ),
          );
          break;
        default:
          respErro();
          break;
      }
    } else {
      respErro();
    }
  }

  void respErro() {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Erro'),
          content: const Text('Valores descritos incorretos, tente novamente'
              '\nDicas:'
              '\n   - Use "."(ponto) em vez de vírgula.'
              '\n       Ex.: X = 1,90'
              '\n       Ex.: ✓ = 1.90'
              '\n   - Coloque a altura em metro.'
              '\n       Ex.: X = 190'
              '\n       Ex.: ✓ = 1.90'
              '\n   - Coloque o peso em Kg.'
              '\n       Ex.: X = 70580'
              '\n       Ex.: ✓ = 70.58'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      _altura.clear();
      _peso.clear();
    });
  }
}
