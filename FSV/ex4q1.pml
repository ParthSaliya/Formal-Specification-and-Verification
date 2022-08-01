mtype = {ROCK, PAPER , SCISSORS};
byte score[2];

inline print_hand(v)
{
if
  :: v == PAPER -> printf("paper   ");
  :: v == ROCK -> printf("rock    ");
  :: v == SCISSORS -> printf("scissors");
fi;
};

proctype player (chan chin, chou)
{
mtype hand;
byte cc;
do
  :: chin?1 -> skip;
  :: chin?2 -> skip;
  :: chin?3 -> cc = cc + 1;
                if
                  :: true -> hand = ROCK;
                  :: true -> hand = PAPER;
                  :: true -> hand = SCISSORS;
                  :: 2 == _pid -> hand = ROCK;
                  :: 1 == _pid -> hand = PAPER;
                  :: 2 == _pid -> hand = SCISSORS;
                fi;
                chou!hand;
  :: 10 == cc -> break;
od;
};

active proctype waiter() {
chan chou[2] = [1] of { byte };
chan chin[2] = [1] of { mtype };
mtype hand[2];
byte i;

run player(chou[0], chin[0]);
run player(chou[1], chin[1]);

printf("\n\t\t Player 1 |\tPlayer 2\n");

for (i: 0 .. 9) {
  chou[0]!1; chou[1]!1;
  chou[0]!2; chou[1]!2;
  chou[0]!3; chou[1]!3;
  chin[0]?hand[0]; chin[1]?hand[1];

  printf("Round %d: ", i);
  print_hand(hand[0]);
  printf("|");
  print_hand(hand[1]);

  if
    :: hand[0] == hand[1] -> printf(": tie\n");
    :: hand[0] % 3 == ((hand[1] + 2) % 3) -> printf(": 0 wins\n");
    score[0] = score[0] + 1;
    :: else -> printf(": 1 wins\n"); score[1] = score[1] + 1;
  fi;
}

printf("\n Summary: %d vs %d\n\n", score[0], score[1]);

// printf("\n Rock: %d Paper %d  Scissor %d\n\n", ROCK, PAPER, SCISSORS);
};
