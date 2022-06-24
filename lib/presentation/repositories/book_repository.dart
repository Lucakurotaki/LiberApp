import '../../domain/entities/book.dart';

class BookRepository{
  static List<Book> list = [
    const Book(
      id: 'id1',
      image: 'image/i01.jpg',
      title: 'Viver Ciências',
      author: 'Sônia Lopes',
      category: 'Educação',
      description: 'A coleção Viver Ciências convida o aluno a utilizar sua capacidade de observação e sua curiosidade como uma grande lupa com a qual poderá investigar a natureza, a vida na Terra, o Sistema Solar e o Universo.',
      year: 2021,
      publisher: 'Editora Moderna',
      price: 95.0
    ),
    const Book(
      id: 'id2',
      image: 'image/i02.jpg',
      title: 'Challege',
      author: 'Eduardo Amos',
      category: 'Educação',
      description: 'Challenge, volume único, é o material que melhor se adapta à realidade brasileira. De fácil utilização pelos professores, Challenge apresenta foco na leitura e abordagem gramatical pensada para classes heterogêneas.',
      year: 2016,
      publisher: 'Richmond',
      price: 193.0
    ),
    const Book(
      id: 'id3',
      image: 'image/i03.jpg',
      title: 'Assassinato no Expresso do Oriente',
      author: 'Agatha Christie',
      category: 'Ficção',
      description: 'Em meio a uma viagem, Hercule Poirot é surpreendido por um telegrama solicitando seu retorno a Londres. Então, o famoso detetive belga embarca no Expresso do Oriente, que está inesperadamente cheio para aquela época do ano.',
      year: 2020,
      publisher: 'HarperCollins',
      price: 29.90
    ),
    const Book(
      id: 'id4',
      image: 'image/i04.jpg',
      title: 'Batman - A Piada Mortal',
      author: 'Alan Moore',
      category: 'HQ',
      description: 'Do premiado roteirista Alan Moore (Watchmen, V de Vingança) conta como um dia ruim na vida de um homem pode significar a linha que separa a sanidade da loucura.',
      year: 2018,
      publisher: 'HarperCollins',
      price: 47.50
    ),
    const Book(
      id: 'id5',
      image: 'image/i05.jpg',
      title: 'One Piece, Vol. 1',
      author: 'Eiichiro Oda',
      category: 'HQ',
      description: 'Join Monkey D. Luffy and his swashbuckling crew in their search for the ultimate treasure, One Piece!',
      year: 2003,
      publisher: 'Viz Media',
      price: 60.73
    ),
    const Book(
      id: 'id6',
      image: 'image/i06.jpg',
      title: 'Ursinho Pooh Constrói uma Casa',
      author: 'A.A. Milne',
      category: 'Infantil',
      description: 'A. A. Milne conta para você mais histórias vividas por Pooh, o Leitão e todos os seus amigos do Bosque dos Cem Acres',
      year: 2018,
      publisher: 'Martins Fontes',
      price: 35.8
    ),
  ];

  static List<Book> bookListFilter(String type, String? subject){
    List<Book> result = []; 
    if(type == 'random'){
      result = list;
      result.shuffle();
      return result;
    }else if(type == 'category'){
      for(var book in list){
        if(book.category == subject){
          result.add(book);
        }
        return result;
      }
    }else if(type == 'search'){
      for(var book in list){
        if(book.title.toLowerCase().contains(subject!.toLowerCase())){
          result.add(book);
        }
        return result;
      }
    }
    result.add(list[0]);
    return result;
  }
}