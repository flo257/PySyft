loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/gtsrb_notebooks/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  return(object)
}

clients_10_0 <- loadResultsFile("exp_gtsrb_20200302-140305.txt")
clients_9_1_green_1_25 <- loadResultsFile("exp_gtsrb_20200303-183227.txt")
clients_9_1_green_1_50 <- loadResultsFile("exp_gtsrb_20200303-100605.txt")
clients_9_1_green_1_75 <- loadResultsFile("exp_gtsrb_20200304-174927.txt")
clients_9_1_green_1_100 <- loadResultsFile("exp_gtsrb_20200304-175046.txt")

plot(clients_9_1_green_1_25$test_accuracy[clients_9_1_green_1_25$training_type == "normal"] ~ clients_9_1_green_1_25$epoch_number[clients_9_1_green_1_25$training_type == "normal"], 
     type = "l", 
     col = "blue", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Benign testset performance\nat different 9/1 model replacement\ngreen 1 percent")
lines(clients_9_1_green_1_50$test_accuracy[clients_9_1_green_1_50$training_type == "normal"] ~ clients_9_1_green_1_50$epoch_number[clients_9_1_green_1_50$training_type == "normal"], 
      type = "l", 
      col = "green")
lines(clients_9_1_green_1_75$test_accuracy[clients_9_1_green_1_75$training_type == "normal"] ~ clients_9_1_green_1_75$epoch_number[clients_9_1_green_1_75$training_type == "normal"], 
      type = "l", 
      col = "brown")
lines(clients_9_1_green_1_100$test_accuracy[clients_9_1_green_1_100$training_type == "normal"] ~ clients_9_1_green_1_100$epoch_number[clients_9_1_green_1_100$training_type == "normal"], 
      type = "l", 
      col = "orange")
lines(clients_10_0$test_accuracy[clients_10_0$training_type == "normal"] ~ clients_10_0$epoch_number[clients_10_0$training_type == "normal"], 
      type = "l", 
      col = "black")
abline(h=95, lty = 2)
legend("left", legend=c("0% malicious data",
  "25% malicious data", 
                               "50% malicious data",
                               "75% malicious data",
                               "100% malicious data"),
       col=c("black", "blue", "green", "brown", "orange"), lty=c(1,1,1,1), cex=0.6)

#backdoor
plot(clients_9_1_green_1_25$test_accuracy[clients_9_1_green_1_25$training_type == "backdoor"] ~ clients_9_1_green_1_25$epoch_number[clients_9_1_green_1_25$training_type == "backdoor"], 
     type = "l", 
     col = "blue", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Malicious testset performance\nat different 9/1 model replacement\ngreen 1 percent")
lines(clients_9_1_green_1_50$test_accuracy[clients_9_1_green_1_50$training_type == "backdoor"] ~ clients_9_1_green_1_50$epoch_number[clients_9_1_green_1_50$training_type == "backdoor"], 
      type = "l", 
      col = "green")
lines(clients_9_1_green_1_75$test_accuracy[clients_9_1_green_1_75$training_type == "backdoor"] ~ clients_9_1_green_1_75$epoch_number[clients_9_1_green_1_75$training_type == "backdoor"], 
      type = "l", 
      col = "brown")
lines(clients_9_1_green_1_100$test_accuracy[clients_9_1_green_1_100$training_type == "backdoor"] ~ clients_9_1_green_1_100$epoch_number[clients_9_1_green_1_100$training_type == "backdoor"], 
      type = "l", 
      col = "orange")


abline(h=95, lty = 2)
legend("right", legend=c("0% malicious data",
                        "25% malicious data", 
                        "50% malicious data",
                        "75% malicious data",
                        "100% malicious data"),
       col=c("blue", "green", "brown", "orange"), lty=c(1,1,1,1), cex=0.6)

       