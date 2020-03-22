loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/yale_total_notebooks/", filename, sep=""),
                      skip=8,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  return(object)
}

clients_10_0 <- loadResultsFile("exp_yale_20200320-091322.txt")
clients_9_1_green_1_125 <- loadResultsFile("exp_yale_20200320-170002.txt")
clients_9_1_green_1_25 <- loadResultsFile("exp_yale_20200320-155935.txt")
clients_9_1_green_1_50 <- loadResultsFile("exp_yale_20200321-142724.txt")
clients_9_1_green_1_75 <- loadResultsFile("exp_yale_20200320-150555.txt")
clients_9_1_green_1_100 <- loadResultsFile("exp_yale_20200320-155216.txt")

plot(clients_10_0$test_accuracy[clients_10_0$training_type == "normal"] ~ clients_10_0$epoch_number[clients_10_0$training_type == "normal"], 
     type = "l", 
     col = "black", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Benign testset performance\nat different 9/1 model replacement\ngreen 1 percent")
lines(clients_9_1_green_1_125$test_accuracy[clients_9_1_green_1_125$training_type == "normal"] ~ clients_9_1_green_1_125$epoch_number[clients_9_1_green_1_125$training_type == "normal"], 
      type = "l", 
      col = "red")
lines(clients_9_1_green_1_25$test_accuracy[clients_9_1_green_1_25$training_type == "normal"] ~ clients_9_1_green_1_25$epoch_number[clients_9_1_green_1_25$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(clients_9_1_green_1_50$test_accuracy[clients_9_1_green_1_50$training_type == "normal"] ~ clients_9_1_green_1_50$epoch_number[clients_9_1_green_1_50$training_type == "normal"], 
      type = "l", 
      col = "green")
lines(clients_9_1_green_1_75$test_accuracy[clients_9_1_green_1_75$training_type == "normal"] ~ clients_9_1_green_1_75$epoch_number[clients_9_1_green_1_75$training_type == "normal"], 
      type = "l", 
      col = "brown")
lines(clients_9_1_green_1_100$test_accuracy[clients_9_1_green_1_100$training_type == "normal"] ~ clients_9_1_green_1_100$epoch_number[clients_9_1_green_1_100$training_type == "normal"], 
      type = "l", 
      col = "orange")
legend("right", legend=c("0% malicious data",
                        "12.5% malicious data",
                        "25% malicious data", 
                        "50% malicious data",
                        "75% malicious data",
                        "100% malicious data"),
       col=c("black","red", "blue", "green", "brown", "orange"), lty=c(1,1,1,1), cex=0.5)

#backdoor
plot(clients_10_0$test_accuracy[clients_10_0$training_type == "backdoor"] ~ clients_10_0$epoch_number[clients_10_0$training_type == "backdoor"], 
     type = "l", 
     col = "black", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Malicious testset performance\nat different 9/1 model replacement\ngreen 1 percent")
lines(clients_9_1_green_1_125$test_accuracy[clients_9_1_green_1_125$training_type == "backdoor"] ~ clients_9_1_green_1_125$epoch_number[clients_9_1_green_1_125$training_type == "backdoor"], 
      type = "l", 
      col = "red")
lines(clients_9_1_green_1_25$test_accuracy[clients_9_1_green_1_25$training_type == "backdoor"] ~ clients_9_1_green_1_25$epoch_number[clients_9_1_green_1_25$training_type == "backdoor"], 
      type = "l", 
      col = "blue")
lines(clients_9_1_green_1_50$test_accuracy[clients_9_1_green_1_50$training_type == "backdoor"] ~ clients_9_1_green_1_50$epoch_number[clients_9_1_green_1_50$training_type == "backdoor"], 
      type = "l", 
      col = "green")
lines(clients_9_1_green_1_75$test_accuracy[clients_9_1_green_1_75$training_type == "backdoor"] ~ clients_9_1_green_1_75$epoch_number[clients_9_1_green_1_75$training_type == "backdoor"], 
      type = "l", 
      col = "brown")
lines(clients_9_1_green_1_100$test_accuracy[clients_9_1_green_1_100$training_type == "backdoor"] ~ clients_9_1_green_1_100$epoch_number[clients_9_1_green_1_100$training_type == "backdoor"], 
      type = "l", 
      lty = 1,
      col = "orange")
legend("bottomright", legend=c(
  "25% malicious data", 
  "50% malicious data",
  "75% malicious data",
  "100% malicious data"),
  col=c("blue", "green", "brown", "orange"), lty=c(1,1,1,1), cex=0.5)

