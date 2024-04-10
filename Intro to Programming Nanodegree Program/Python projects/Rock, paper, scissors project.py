# !/usr/bin/env python3/ Joseph Karl Magnussen
# I have structured this, 'Rock, Paper, Scissors' program to -
# pertain to 5 round matches, within which, a draw accounts for -
# no points and typo's are omitted from the score. Finally, -
# I have written this in a while loop to run indefinitely.

import random
while True:
    moves = ['rock', 'paper', 'scissors']

    def beats (one, two):
            return ((one == 'rock' and two == 'scissors') or
                    (one == 'scissors' and two == 'paper') or
                    (one == 'paper' and two == 'rock'))

    class Player:
        def move(self):
            return 'rock'

        def learn(self, my_move, their_move):
            pass
    
    class ReflectPlayer(Player):

        def move(self):
                if self.log == []:
                        return ('paper')
                return self.log[-1]

        def learn(self, my_move, their_move):
            self.log.append(their_move)
    
        def __init__(self):
            self.score = 0
            self.log = []

    class Random_Player(Player):
        def move (self):
            return (random.choice(moves))

    class HumanPlayer(Player):
        def move(self):
            move = input("Hey there! Rock, paper or scissors?")
            while move.lower().strip() not in moves:
                print("Sorry, I didn't understand that, please try again.")
                move = input("Please enter rock, paper, or scissors.")
            return move

    class CyclePlayer(Player):
        def move(self):
            if self.log == []:
                return ('paper')
            elif self.log == ['paper']:
                return 'scissors'
            elif self.log == ['rock']:
                return 'paper'
            elif self.log == ['scissors']:
                return 'rock'

    def learn(self, my_move, their_move):
        self.log = [my_move]
            
    def __init__(self):
        self.log = []

    class Game():   
        def __init__(self, p1, p2):
            self.p1 = HumanPlayer()
            self.p2 = p2
            self.p1_tally = 0
            self.p2_tally = 0

        def play_round(self):
            move1 = self.p1.move()
            move2 = self.p2.move()
            print(f"Player 1: {move1}  Player 2: {move2}")
            self.p1.learn(move1, move2)
            self.p2.learn(move2, move1)
            self.score(move1, move2)
        
        def score(self, move1, move2):
            if beats(move1, move2):
                self.p1_tally += 1
                print(f"You: {self.p1_tally}  Opponent: {self.p2_tally}")
            elif beats(move2, move1):
                self.p2_tally += 1
                print(f"You: {self.p1_tally}  Opponent: {self.p2_tally}")
            elif move1 == move2:
                print("Draw! No points to you or your opponent.")
            else:
                print("We'll omit that typo... Please try again.")

        def play_game(self):
            print("Game start!")
            for round in [1,2,3,4,5]:
                print(f"Round {round}:")
                self.play_round()
            if self.p1_tally > self.p2_tally:
                    print("You won the game!")
            elif self.p2_tally > self.p1_tally:
                    print ("You lost the game!")
            elif self.p1_tally == self.p2_tally:
                    print("Draw!")

    if __name__ == '__main__':
        game = Game(HumanPlayer(), Random_Player())
        game.play_game()
