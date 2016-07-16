String gametitle = "8bit RPG";

enum gameStates { TitleScreen, GameOn, GameOver }
const int ROCK = 0;
const int MAINROUTE = 1;
const int GRASS = 3;
const int HOMEFLOOR = 2;
const int FTREE = 4;
const int GOLDORE = 5;
const int LINE = 6;
const int VERTLINE = 7;
const int TJOINLINE = 8;
const int HEART = 9;

const int BRICK = 12;
const int DOOR = 13;
const int WATER = 14;

const int PORTAL = 99;
const int CHEST = 101;
const int SHRUB = 102;
const int FLOWER = 103;

const int DIAMOND = 1001;
const int APPLE = 1002;
const int APRICOT = 1003;
const int DIAMOND_GREY = 1004;

const int NINJA = 2001;
const int BLOB = 2002;
const int EVILSAGE = 2003;
const int GHOST = 2004;
const int PHANTOM = 2005;
const int SNAIL = 2006;
const int SNAKE = 2007;
const int SPIDER = 2008;
const int HEDGE = 2009;
const int DRAGON = 2010;

final List<int> monsters = [NINJA,BLOB,EVILSAGE,GHOST,PHANTOM,SNAIL,SNAKE,SPIDER,HEDGE];

const int MAXMON = 9;
const int DUCK = 3001;
const int LLAMA = 3002;
const int SAGE = 3003;
const int FARMER = 3004;
const int SHOPKEEPER = 3005;

final List<int> obstacles = [
  BRICK,
  SHRUB,
  FLOWER,
  WATER,
  FARMER,
  SAGE,
  LLAMA,
  SHOPKEEPER,
  DUCK,
  ROCK
];

final String line = "--" * 40;


final List<String> sagelines = [
  "Watch out for my evil brothers!",
  "Blue is faster than Tuesday!",
  "Don't get out much...",
  "Who planted these trees?",
  "Times change.",
  "Selfie!",
  "42",
  "I Haz the wisdom",
  "Onion is out today",
  "Follow daftspaniel on Twitter",
  "I am sticking with Dart 1.0 forever",
  "Dart FTW",
  "Somewhere be dragons",
  "Find those diamonds fast",
  "Orcs!",
  "Apples help you live longer.",
  ".......",
  "Have you read the fine manual?",
  "One day I will be in a real game.",
  "7",
  "Meh."
];