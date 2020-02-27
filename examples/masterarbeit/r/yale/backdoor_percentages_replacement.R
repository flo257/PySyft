loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/results/yale/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  object$timestamp = strptime(object$timestamp, format="%H%M%S")
  object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

backdoor_4_1_100 <- loadResultsFile("exp_yale_20200117-095427.txt")
backdoor_4_1_50 <- loadResultsFile("exp_yale_20200119-094913.txt")
backdoor_4_1_25 <- loadResultsFile("exp_yale_20200122-211037.txt")
no_backdoors <- loadResultsFile("exp_yale_20200116-104619.txt")

backdoor_4_1_100_tattoo <- loadResultsFile("exp_yale_20200123-215554.txt")
backdoor_4_1_75_tattoo <- loadResultsFile("exp_yale_20200124-073314.txt")
backdoor_4_1_50_tattoo <- loadResultsFile("exp_yale_20200123-161525.txt")
backdoor_4_1_25_tattoo <- loadResultsFile("exp_yale_20200123-081530.txt")

"GLASSES"
"Epoch number ~ Test accuracy BENIGN"
plot(backdoor_4_1_100$test_accuracy[backdoor_4_1_100$training_type == "normal"] ~ 
       backdoor_4_1_100$epoch_number[backdoor_4_1_100$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     ylim = c(0,100),
     main = "Benign testset performance\nwith p% malicious data (type: glasses)\nin backdoored clients")

lines(backdoor_4_1_50$test_accuracy[backdoor_4_1_50$training_type == "normal"] ~ 
        backdoor_4_1_50$epoch_number[backdoor_4_1_50$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_4_1_25$test_accuracy[backdoor_4_1_25$training_type == "normal"] ~ 
        backdoor_4_1_25$epoch_number[backdoor_4_1_25$training_type == "normal"], 
      type = "l", 
      col = "green")

lines(no_backdoors$test_accuracy ~ 
        no_backdoors$epoch_number, 
      type = "l", 
      col = "black")

abline(h=95, lty = 2)


legend("right", 
       legend=c("malicious clients contain 100% backdoored data", 
                "malicious clients contain 50% backdoored data",
                "malicious clients contain 25% backdoored data",
                "no malicious clients",
                "95% accuracy"),
       col=c("red", "blue", "green","black","black"), 
       lty=c(1,1,1,1,2), cex=0.5)


"Epoch number ~ Test accuracy BACKDOOR"
plot(backdoor_4_1_100$test_accuracy[backdoor_4_1_100$training_type == "backdoor"] ~ 
       backdoor_4_1_100$epoch_number[backdoor_4_1_100$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     ylim = c(0,100),
     lty = 3,
     main = "Malicious testset performance\nwith p% malicious data (type: glasses)\nin backdoored clients")
lo100 <- loess(backdoor_4_1_100$test_accuracy[backdoor_4_1_100$training_type == "backdoor"] ~ 
                 backdoor_4_1_100$epoch_number[backdoor_4_1_100$training_type == "backdoor"])
lines(predict(lo100), col='red', lwd=2)

lines(backdoor_4_1_50$test_accuracy[backdoor_4_1_50$training_type == "backdoor"] ~ 
        backdoor_4_1_50$epoch_number[backdoor_4_1_50$training_type == "backdoor"], 
      type = "l", 
      lty = 3,
      col = "blue")
lo50 <- loess(backdoor_4_1_50$test_accuracy[backdoor_4_1_50$training_type == "backdoor"] ~ 
                 backdoor_4_1_50$epoch_number[backdoor_4_1_50$training_type == "backdoor"])
lines(predict(lo50), col='blue', lwd=2)

lines(backdoor_4_1_25$test_accuracy[backdoor_4_1_25$training_type == "backdoor"] ~ 
        backdoor_4_1_25$epoch_number[backdoor_4_1_25$training_type == "backdoor"], 
      type = "l", 
      lty = 3,
      col = "green")
lo25 <- loess(backdoor_4_1_25$test_accuracy[backdoor_4_1_25$training_type == "backdoor"] ~ 
                backdoor_4_1_25$epoch_number[backdoor_4_1_25$training_type == "backdoor"])
lines(predict(lo25), col='green', lwd=2)

abline(h=95, lty = 2)

legend("bottom", 
       legend=c("malicious clients contain 100% backdoored data", 
                "malicious clients contain 50% backdoored data",
                "malicious clients contain 25% backdoored data",
                "95% accuracy"),
       col=c("red", "blue", "green", "black"), 
       lty=c(3,3,3,2), cex=0.5)



"TATTOO"
"Epoch number ~ Test accuracy BENIGN"
plot(backdoor_4_1_100_tattoo$test_accuracy[backdoor_4_1_100_tattoo$training_type == "normal"] ~ 
       backdoor_4_1_100_tattoo$epoch_number[backdoor_4_1_100_tattoo$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     ylim = c(0,100),
     main = "Benign testset performance\nwith p% malicious data (type: tattoo)\nin backdoored clients")

lines(backdoor_4_1_75_tattoo$test_accuracy[backdoor_4_1_75_tattoo$training_type == "normal"] ~ 
        backdoor_4_1_75_tattoo$epoch_number[backdoor_4_1_75_tattoo$training_type == "normal"], 
      type = "l", 
      col = "yellow")

lines(backdoor_4_1_50_tattoo$test_accuracy[backdoor_4_1_50_tattoo$training_type == "normal"] ~ 
        backdoor_4_1_50_tattoo$epoch_number[backdoor_4_1_50_tattoo$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_4_1_25_tattoo$test_accuracy[backdoor_4_1_25_tattoo$training_type == "normal"] ~ 
        backdoor_4_1_25_tattoo$epoch_number[backdoor_4_1_25_tattoo$training_type == "normal"], 
      type = "l", 
      col = "green")

lines(no_backdoors$test_accuracy ~ 
        no_backdoors$epoch_number, 
      type = "l", 
      col = "black")

abline(h=95, lty = 2)


legend("right", 
       legend=c("malicious clients contain 100% backdoored data", 
                "malicious clients contain 75% backdoored data",
                "malicious clients contain 50% backdoored data",
                "malicious clients contain 25% backdoored data",
                "no malicious clients",
                "95% accuracy"),
       col=c("red", "yellow","blue", "green","black","black"), 
       lty=c(1,1,1,1,1,2), cex=0.4)


"Epoch number ~ Test accuracy BACKDOOR"
plot(backdoor_4_1_100_tattoo$test_accuracy[backdoor_4_1_100_tattoo$training_type == "backdoor"] ~ 
       backdoor_4_1_100_tattoo$epoch_number[backdoor_4_1_100_tattoo$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     ylim = c(0,100),
     main = "Malicious testset performance\nwith p% malicious data (type: tattoo)\nin backdoored clients")

lines(backdoor_4_1_75_tattoo$test_accuracy[backdoor_4_1_75_tattoo$training_type == "backdoor"] ~ 
        backdoor_4_1_75_tattoo$epoch_number[backdoor_4_1_75_tattoo$training_type == "backdoor"], 
      type = "l", 
      col = "yellow")

lines(backdoor_4_1_50_tattoo$test_accuracy[backdoor_4_1_50_tattoo$training_type == "backdoor"] ~ 
        backdoor_4_1_50_tattoo$epoch_number[backdoor_4_1_50_tattoo$training_type == "backdoor"], 
      type = "l", 
      col = "blue")

lines(backdoor_4_1_25_tattoo$test_accuracy[backdoor_4_1_25_tattoo$training_type == "backdoor"] ~ 
        backdoor_4_1_25_tattoo$epoch_number[backdoor_4_1_25_tattoo$training_type == "backdoor"], 
      type = "l", 
      col = "green")

abline(h=95, lty = 2)

legend("left", 
       legend=c("malicious clients contain 100% backdoored data", 
                "malicious clients contain 75% backdoored data",
                "malicious clients contain 50% backdoored data",
                "malicious clients contain 25% backdoored data",
                "95% accuracy"),
       col=c("red", "yellow","blue", "green", "black"), 
       lty=c(1,1,1,1,2), cex=0.4)

