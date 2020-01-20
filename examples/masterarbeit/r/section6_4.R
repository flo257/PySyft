loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/results/traffic/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  object$timestamp = strptime(object$timestamp, format="%H%M%S")
  object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

backdoor_6_50 <- loadResultsFile("exp_traffic_20200109-201907.txt")
backdoor_6_100 <- loadResultsFile("exp_traffic_20200109-102924.txt")
backdoor_4_50 <- loadResultsFile("exp_traffic_20191220-104730.txt")
backdoor_4_100 <- loadResultsFile("exp_traffic_20191223-174802.txt")

"Epoch number ~ Test accuracy : 100%"
plot(backdoor_6_100$test_accuracy[backdoor_6_100$training_type == "normal"] ~ 
       backdoor_6_100$epoch_number[backdoor_6_100$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 50),
     ylim = c(0,100),
     main = "Testset performance\nwith 100% malicious data in backdoored clients")

lines(backdoor_6_100$test_accuracy[backdoor_6_100$training_type == "backdoor"] ~ 
        backdoor_6_100$epoch_number[backdoor_6_100$training_type == "backdoor"], 
      type = "l", 
      col = "red",
      lty = 2)

lines(backdoor_4_100$test_accuracy[backdoor_6_100$training_type == "normal"] ~ 
        backdoor_4_100$epoch_number[backdoor_6_100$training_type == "normal"], 
      type = "l", 
      col = "blue",
      lty = 1)

lines(backdoor_4_100$test_accuracy[backdoor_6_100$training_type == "backdoor"] ~ 
        backdoor_4_100$epoch_number[backdoor_6_100$training_type == "backdoor"], 
      type = "l", 
      col = "blue",
      lty = 2)

abline(h=95, lty=3)


legend("bottomright", 
       legend=c("benign testset: #benign = 6, #malicious = 1", 
                "malicious testset: #benign = 6, #malicious = 1",
                "benign testset: #benign = 4, #malicious = 1", 
                "malicious testset: #benign = 4, #malicious = 1",
                "95% accuracy"),
       col=c("red", "red", "blue", "blue", "black"), 
       lty=c(1,1,2,2,3), cex=0.7)




"Epoch number ~ Test accuracy 50%"
plot(backdoor_6_50$test_accuracy[backdoor_6_50$training_type == "normal"] ~ 
       backdoor_6_50$epoch_number[backdoor_6_50$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 50),
     ylim = c(0,100),
     main = "Testset performance\nwith 50% malicious data in backdoored clients")

lines(backdoor_6_50$test_accuracy[backdoor_6_50$training_type == "backdoor"] ~ 
        backdoor_6_50$epoch_number[backdoor_6_50$training_type == "backdoor"], 
      type = "l", 
      col = "red",
      lty = 2)

lines(backdoor_4_50$test_accuracy[backdoor_4_50$training_type == "normal"] ~ 
        backdoor_4_50$epoch_number[backdoor_4_50$training_type == "normal"], 
      type = "l", 
      col = "blue",
      lty = 1)

lines(backdoor_4_50$test_accuracy[backdoor_4_50$training_type == "backdoor"] ~ 
        backdoor_4_50$epoch_number[backdoor_4_50$training_type == "backdoor"], 
      type = "l", 
      col = "blue",
      lty = 2)

abline(h=95, lty=3)

legend("bottomright", 
       legend=c("benign testset: #benign = 6, #malicious = 1", 
                "malicious testset: #benign = 6, #malicious = 1",
                "benign testset: #benign = 4, #malicious = 1", 
                "malicious testset: #benign = 4, #malicious = 1",
                "95% accuracy"),
       col=c("red", "red", "blue", "blue", "black"), 
       lty=c(1,1,2,2,3), cex=0.7)

