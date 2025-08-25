import '../../../../core/constants/app_images.dart';
import '../models/book_model.dart';

class BookService {
  final List<BookModel> books = [
    // --- Fantasy ---
    BookModel(
      id: 1,
      title: "The Hobbit",
      author: "J. R. R. Tolkien",
      imagePath: AppImages.hobbit,
      genre: "Fantasy",
    ),
    BookModel(
      id: 2,
      title: "Catching Fire",
      author: "Suzanne Collins",
      imagePath: AppImages.catchingFire,
      genre: "Fantasy",
    ),
    BookModel(
      id: 3,
      title: "Bridge of Clay",
      author: "Markus Zusak",
      imagePath: AppImages.bridgeClay,
      genre: "Fantasy",
    ),
    BookModel(
      id: 4,
      title: "The Borgias",
      author: "Christopher Hibbert",
      imagePath: AppImages.borgias,
      genre: "Fantasy",
    ),
    BookModel(
      id: 5,
      title: "A Game of Thrones",
      author: "George R. R. Martin",
      imagePath: AppImages.gameThrones,
      genre: "Fantasy",
    ),
    BookModel(
      id: 6,
      title: "The Silmarillion",
      author: "J. R. R. Tolkien",
      imagePath: AppImages.silmarillion,
      genre: "Fantasy",
    ),

    // --- Fiction ---
    BookModel(
      id: 7,
      title: "A Man Called Ove",
      author: "Fredrik Backman",
      imagePath: AppImages.ove,
      genre: "Fiction",
    ),
    BookModel(
      id: 8,
      title: "To Kill a Mockingbird",
      author: "Harper Lee",
      imagePath: AppImages.mockingbird,
      genre: "Fiction",
    ),
    BookModel(
      id: 9,
      title: "1984",
      author: "George Orwell",
      imagePath: AppImages.nineteenEightyFour,
      genre: "Fiction",
    ),
    BookModel(
      id: 10,
      title: "Pride and Prejudice",
      author: "Jane Austen",
      imagePath: AppImages.pridePrejudice,
      genre: "Fiction",
    ),

    // --- Young Adult ---
    BookModel(
      id: 11,
      title: "The World is Not Enough",
      author: "Anthony Horowitz",
      imagePath: AppImages.world,
      genre: "YoungAdult",
    ),
    BookModel(
      id: 12,
      title: "The Hunger Games",
      author: "Suzanne Collins",
      imagePath: AppImages.hungerGames,
      genre: "YoungAdult",
    ),
    BookModel(
      id: 13,
      title: "Divergent",
      author: "Veronica Roth",
      imagePath: AppImages.divergent,
      genre: "YoungAdult",
    ),
    BookModel(
      id: 14,
      title: "The Maze Runner",
      author: "James Dashner",
      imagePath: AppImages.mazeRunner,
      genre: "YoungAdult",
    ),

    // --- Romance ---
    BookModel(
      id: 15,
      title: "The Notebook",
      author: "Nicholas Sparks",
      imagePath: AppImages.notebook,
      genre: "Romance",
    ),
    BookModel(
      id: 16,
      title: "Me Before You",
      author: "Jojo Moyes",
      imagePath: AppImages.meBeforeYou,
      genre: "Romance",
    ),
    BookModel(
      id: 17,
      title: "Twilight",
      author: "Stephenie Meyer",
      imagePath: AppImages.twilight,
      genre: "Romance",
    ),

    // --- Horror ---
    BookModel(
      id: 18,
      title: "It",
      author: "Stephen King",
      imagePath: AppImages.it,
      genre: "Horror",
    ),
    BookModel(
      id: 19,
      title: "The Shining",
      author: "Stephen King",
      imagePath: AppImages.shining,
      genre: "Horror",
    ),
    BookModel(
      id: 20,
      title: "Dracula",
      author: "Bram Stoker",
      imagePath: AppImages.dracula,
      genre: "Horror",
    ),

    // --- Crime ---
    BookModel(
      id: 21,
      title: "The Girl with the Dragon Tattoo",
      author: "Stieg Larsson",
      imagePath: AppImages.girlDragon,
      genre: "Crime",
    ),
    BookModel(
      id: 22,
      title: "Gone Girl",
      author: "Gillian Flynn",
      imagePath: AppImages.goneGirl,
      genre: "Crime",
    ),
    BookModel(
      id: 23,
      title: "In Cold Blood",
      author: "Truman Capote",
      imagePath: AppImages.coldBlood,
      genre: "Crime",
    ),
  ];
}
