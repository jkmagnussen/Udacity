import time
answer = input("Would you like to play? (yes/no) ")
if answer.lower().strip() == "yes":
    time.sleep(1)
    answer = input("You reach a crossroads, would you like to go left or right?").lower().strip()
    if answer == "left":
        time.sleep(1)
        answer = input("You encounter a monster! Would you like to run or attack? ").lower().strip()
        if answer == "attack":
            time.sleep(1)
            print("You're unarmed, the monster defeats you... GAME OVER!")
        else:
            print("Good choice, you got away safely. Phew...")
            time.sleep(1)
            answer = input("You stumble across an abandoned car, would you like to try to start it?").lower().strip()
            if answer == "yes":
                time.sleep(1)
                print("You pull open the dusty door, turn the key, start the engine and escape safely... YOU WIN! ")
            else:
                print("That was your only means of escape, are you crazy?! GAME OVER!")

    elif answer == "right":

        print("You trip over a rock and injure your leg, you cant continue... GAME OVER! ")
else:
    print("That's too bad!")
