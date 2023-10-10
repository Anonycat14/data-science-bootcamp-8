
## here is where the score for each game stored.
weapons <- c("rock","scissor","paper")
round <- 0
win <- 0
lose <- 0
draw <- 0
          ## ask user if they wanna play fighter game ?
play_game <- function (){
  print("Hi there! i'm looking for new fighter, are you in?")
  print("press YES to continue press NO if you not dare enough")
  
  fighter_res <- tolower(readLines("stdin",n=1))
          ## try to dare a user, and hope they will join
  if (fighter_res == "NO" | fighter_res =="no") {
    print("its understandable only fighter in here") 
    print("read it ^.^")
   break
          ## make user little bit nervous ^^
}  else if (fighter_res == "YES" | fighter_res=="yes") {
    print(" HAHAHA  our GrandMaster are waiting for you. Let's start, just press DONE if you wanna run away ")
   } 
             ## use while loop to run a game, explain the rules and set the outcome for each different sutuation !
    while (TRUE) {
      print("_________")
    print("choose your weapon")
    print("rock,paper,scissor, or done to run away")

          ## if the player have choose there weapon, and the bot also randomly to choose choose 1 weapon.
      player_res <- tolower(readLines("stdin",n=1))
      gm_res <- sample(weapons,1)
      
           ## if the player press "DONE" the game will be end and the total score will show on time.
      if(player_res == "done" | player_res == "DONE"){
          print("see you next battle")
          print("please come back whenever you ready!")
          print(paste("Rounds battles: ", round, "Times"))
          print(paste("win totals: ", win,"Times"))
          print(paste("draw totals: ", draw,"Times"))
          print(paste("lose totals: ",lose,"Times"))
        
          break
        }
      
         ## explain the rules and set the outcome for each different situations !
      
      if (player_res != "DONE" | player_res != "done"){
      print(paste("you choose ",player_res))
      print(paste("GM choose ", gm_res))
        
        if (player_res == "paper" & gm_res == "paper"){
          print("draw!")
          round <- round +1
          draw <- draw +1
         } 
        
        if (player_res == "rock" & gm_res == "rock"){
          print("draw!")
          round <- round +1
          draw <- draw +1
        }
        
        if (player_res == "scissor" & gm_res == "scissor"){
          print("draw!")
          round <- round +1
          draw <- draw +1
         }

        if (player_res == "paper" & gm_res == "rock"){
          print("you win!, its not bad")
          round <- round +1
          win <- win +1
         }

        if (player_res == "scissor" & gm_res == "paper"){
          print("you win!, its not bad")
          round <- round +1
          win <- win +1
         }

        if (player_res == "rock" & gm_res == "scissor"){
          print("you win!, its not bad")
          round <- round +1
          win <- win +1
         }

        if (player_res == "scissor" & gm_res == "rock"){
          print("you lose!, HAHAHA")
          round <- round +1
          lose <- lose +1
         }

        if (player_res == "paper" & gm_res == "scissor"){
          print("you lose!, HAHAHA")
          round <- round +1
          lose <- lose +1
         }

        if (player_res == "rock" & gm_res == "paper"){
          print("you lose!, HAHAHA")
          round <- round +1
          lose <- lose +1
        }
                # if user choose an available weapons. here is the wake up call to stay in the rules! ^^
        else if (!(player_res %in% c("paper", "rock", "scissor"))) {
  print("Please choose an available weapons")
}
        
    }  
  }
}
     ## to run a game use the function below
play_game()
