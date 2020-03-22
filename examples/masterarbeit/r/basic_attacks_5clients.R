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

clients_5_0 <- loadResultsFile("exp_gtsrb_20200225-152647.txt")
clients_4_1_green_1_100 <- loadResultsFile("exp_gtsrb_20200318-203612.txt")
clients_3_2_green_1_100 <- loadResultsFile("exp_gtsrb_20200320-085236.txt")
clients_2_3_green_1_100 <- loadResultsFile("exp_gtsrb_20200320-003449.txt")

plot(clients_5_0$test_accuracy[clients_5_0$training_type == "normal"] ~ clients_5_0$epoch_number[clients_5_0$training_type == "normal"], 
     type = "l", 
     col = "black", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Benign testset performance\nbasic attack strategy\n10 client network")
lines(clients_4_1_green_1_100$test_accuracy[clients_4_1_green_1_100$training_type == "normal"] ~ clients_4_1_green_1_100$epoch_number[clients_4_1_green_1_100$training_type == "normal"], 
      type = "l", 
      col = "red")
lines(clients_3_2_green_1_100$test_accuracy[clients_3_2_green_1_100$training_type == "normal"] ~ clients_3_2_green_1_100$epoch_number[clients_3_2_green_1_100$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(clients_2_3_green_1_100$test_accuracy[clients_2_3_green_1_100$training_type == "normal"] ~ clients_2_3_green_1_100$epoch_number[clients_2_3_green_1_100$training_type == "normal"], 
      type = "l", 
      col = "green")
legend("right", legend=c("5 benign clients",
                               "4 benign client, 1 malicious client", 
                               "3 benign client, 2 malicious client",
                               "2 benign client, 3 malicious client"),
       col=c("black", "red", "blue", "green"), lty=c(1,1,1,1), cex=0.7)

#backdoor
plot(clients_5_0$test_accuracy[clients_5_0$training_type == "backdoor"] ~ clients_5_0$epoch_number[clients_5_0$training_type == "backdoor"], 
     type = "l", 
     col = "black", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Malicious testset performance\nbasic attack strategy\n10 client network")
lines(clients_4_1_green_1_100$test_accuracy[clients_4_1_green_1_100$training_type == "backdoor"] ~ clients_4_1_green_1_100$epoch_number[clients_4_1_green_1_100$training_type == "backdoor"], 
      type = "l", 
      col = "red")
lines(clients_3_2_green_1_100$test_accuracy[clients_3_2_green_1_100$training_type == "backdoor"] ~ clients_3_2_green_1_100$epoch_number[clients_3_2_green_1_100$training_type == "backdoor"], 
      type = "l", 
      col = "blue")
lines(clients_2_3_green_1_100$test_accuracy[clients_2_3_green_1_100$training_type == "backdoor"] ~ clients_2_3_green_1_100$epoch_number[clients_2_3_green_1_100$training_type == "backdoor"], 
      type = "l", 
      col = "green")
legend("bottomright", legend=c("5 benign clients",
                         "4 benign client, 1 malicious client", 
                         "3 benign client, 2 malicious client",
                         "2 benign client, 3 malicious client"),
       col=c("black", "red", "blue", "green"), lty=c(1,1,1,1), cex=0.5)
