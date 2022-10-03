
enum Category { CAT, DOG, BUNNY, HAMSTER, Fish, Snake, Bird }
enum Condition { Adoption, Disappear, Mating, Buy }

class Pet {

  String name;
  String location;
  String distance;
  String condition;
  Category category;
  String imageUrl;
  bool favorite;
  bool newest;

  Pet(this.name, this.location, this.distance, this.condition, this.category, this.imageUrl, this.favorite, this.newest);

}

List<Pet> getPetList(){
  return <Pet>[
    //Cats
    Pet("Ragdoll", "Khalda", "2.5", "Buy", Category.CAT, "assets/images/cats/cat_1.jpg", true, true),
    Pet("Burmés", "Khalda", "1.2", "Disappear", Category.CAT, "assets/images/cats/cat_4.jpg", true, true),
    Pet("Ragdoll", "Zarqa", "1.2", "Disappear", Category.CAT, "assets/images/cats/cat_9.jpg", false, true),

   //Hamsters
    Pet("Roborowski", "Khalda", "1.5", "Adoption", Category.HAMSTER, "assets/images/hamsters/hamster_1.jpg", true, true),
    Pet("Chinese", "Mafraq", "3.5", "Disappear", Category.HAMSTER, "assets/images/hamsters/hamster_4.jpg", true, true),

    //Bunnys
    Pet("American Rabbit", "Khalda", "7.5", "Adoption", Category.BUNNY, "assets/images/bunnies/bunny_1.jpg", true, true),
    Pet("Californian Rabbits", "Marka", "4.25", "Disappear", Category.BUNNY, "assets/images/bunnies/bunny_4.jpg", true, true),
    Pet("English Spot", "Zarqa", "1", "Buy", Category.BUNNY, "assets/images/bunnies/bunny_8.jpg", true, true),
   
    //DOGs
    Pet("Affenpinscher", "Khalda", "3.5", "Adoption", Category.DOG, "assets/images/dogs/dog_1.jpg", true, true),
    Pet("Shepherd Dog", "Zarqa", "2.5", "Disappear", Category.DOG, "assets/images/dogs/dog_4.jpg", true, true),
    Pet("Bloodhound", "Marka", "2.4", "Adoption", Category.DOG, "assets/images/dogs/dog_8.jpg", true, true),
    Pet("Boston Terrier", "Zarqa", "1.5", "Buy", Category.DOG, "assets/images/dogs/dog_9.jpg", true, true),
    Pet("Chow Chow", "Irbid", "3.5", "Disappear", Category.DOG, "assets/images/dogs/dog_12.jpg", true, true),

    //Fish
   Pet("Arowana", "Irbid", "1.5", "Buy", Category.Fish, "assets/images/fish/fish_2.jpg", false, true),
    Pet("Golden fish", "Irbid", "3.2", "Mating", Category.Fish, "assets/images/fish/fish_3.jpg", true, true),

    //Birds
    Pet("Parrotlets", "Irbid", "3.2", "Mating", Category.Bird, "assets/images/birds/bird_3.jpg", true, false),

    //Others
    Pet("Corn Snake", "Zarqa", "3.5", "Buy", Category.Snake, "assets/images/snakes/snake_1.jpg", true, false),

  ];
}