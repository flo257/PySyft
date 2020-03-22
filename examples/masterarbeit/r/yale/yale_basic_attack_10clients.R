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

clients_10_0 <- loadResultsFile("exp_yale_20200320-091248.txt")
clients_9_1_green_1_100 <- loadResultsFile("exp_yale_20200320-173907.txt")
clients_8_2_green_1_100 <- loadResultsFile("exp_yale_20200320-182046.txt")
clients_7_3_green_1_100 <- loadResultsFile("exp_yale_20200320-190311.txt")

plot(clients_10_0$test_accuracy[clients_10_0$training_type == "normal"] ~ clients_10_0$epoch_number[clients_10_0$training_type == "normal"], 
     type = "l", 
     col = "black", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Benign testset performance\nbasic attack strategy\n10 client network")
lines(clients_9_1_green_1_100$test_accuracy[clients_9_1_green_1_100$training_type == "normal"] ~ clients_9_1_green_1_100$epoch_number[clients_9_1_green_1_100$training_type == "normal"], 
      type = "l", 
      col = "red")
lines(clients_8_2_green_1_100$test_accuracy[clients_8_2_green_1_100$training_type == "normal"] ~ clients_8_2_green_1_100$epoch_number[clients_8_2_green_1_100$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(clients_7_3_green_1_100$test_accuracy[clients_7_3_green_1_100$training_type == "normal"] ~ clients_7_3_green_1_100$epoch_number[clients_7_3_green_1_100$training_type == "normal"], 
      type = "l", 
      col = "green")
legend("bottomright", legend=c("10 benign clients",
                               "9 benign client, 1 malicious client", 
                               "8 benign client, 2 malicious client",
                               "7 benign client, 3 malicious client"),
       col=c("black", "red", "blue", "green"), lty=c(1,1,1,1), cex=0.6)

#backdoor
plot(clients_10_0$test_accuracy[clients_10_0$training_type == "backdoor"] ~ clients_10_0$epoch_number[clients_10_0$training_type == "backdoor"], 
     type = "l", 
     col = "black", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Malicious testset performance\nbasic attack strategy\n10 client network")
lines(clients_9_1_green_1_100$test_accuracy[clients_9_1_green_1_100$training_type == "backdoor"] ~ clients_9_1_green_1_100$epoch_number[clients_9_1_green_1_100$training_type == "backdoor"], 
      type = "l", 
      col = "red")
lines(clients_8_2_green_1_100$test_accuracy[clients_8_2_green_1_100$training_type == "backdoor"] ~ clients_8_2_green_1_100$epoch_number[clients_8_2_green_1_100$training_type == "backdoor"], 
      type = "l", 
      col = "blue")
lines(clients_7_3_green_1_100$test_accuracy[clients_7_3_green_1_100$training_type == "backdoor"] ~ clients_7_3_green_1_100$epoch_number[clients_7_3_green_1_100$training_type == "backdoor"], 
      type = "l", 
      col = "green")
legend("right", legend=c("10 benign clients",
                         "9 benign client, 1 malicious client", 
                         "8 benign client, 2 malicious client",
                         "7 benign client, 3 malicious client"),
       col=c("black", "red", "blue", "green"), lty=c(1,1,1,1), cex=0.6)
