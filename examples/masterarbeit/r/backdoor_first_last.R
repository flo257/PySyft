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

backdoor_100_first <-  loadResultsFile("exp_traffic_20191125-140135.txt")
backdoor_100_last <-  loadResultsFile("exp_traffic_20191122-202041.txt")
backdoor_100_last$timestamp[109] = backdoor_100_last$timestamp[109] + 86400
backdoor_100_last$timestamp[111:200] = backdoor_100_last$timestamp[111:200] + 86400
backdoor_100_last$elapsed_time = ((backdoor_100_last$timestamp - backdoor_100_last$timestamp[1])/60)


"Epoch number ~ Test accuracy"
plot(backdoor_100_first$test_accuracy[backdoor_100_first$training_type == "normal"] ~ 
       backdoor_100_first$epoch_number[backdoor_100_first$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     main = "Testset performance\nwith 20% malicious clients")

lines(backdoor_100_first$test_accuracy[backdoor_100_first$training_type == "backdoor"] ~ 
        backdoor_100_first$epoch_number[backdoor_100_first$training_type == "backdoor"], 
      type = "l", 
      lty=2,
      col = "red")

lines(backdoor_100_last$test_accuracy[backdoor_100_last$training_type == "normal"] ~ 
        backdoor_100_last$epoch_number[backdoor_100_last$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_100_last$test_accuracy[backdoor_100_last$training_type == "backdoor"] ~ 
        backdoor_100_last$epoch_number[backdoor_100_last$training_type == "backdoor"], 
      type = "l", 
      lty=2,
      col = "blue")
abline(h=95, lty=3)

legend("bottomright", 
       legend=c("benign test data (backdoors trained first)", 
                "malicious test data (backdoors trained first)",
                "benign test data (backdoors trained last)", 
                "malicious test data (backdoors trained last)",
                "95% accuracy"),
       col=c("red", "red", "blue", "blue","black"), 
       lty=c(1,2,1,2,3), cex=0.6)

"Epoch number ~ Test accuracy"
plot(backdoor_100_last$avg_training_loss[backdoor_100_last$training_type == "normal"] ~ 
       backdoor_100_last$epoch_number[backdoor_100_last$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Avg. train loss",
     main = "Average train loss\nwith 20% malicious clients")

lines(backdoor_100_last$avg_training_loss[backdoor_100_last$training_type == "backdoor"] ~ 
        backdoor_100_last$epoch_number[backdoor_100_last$training_type == "backdoor"], 
      type = "l", 
      col = "blue")

legend("topright", 
       legend=c("benign data train loss", 
                "malicious data train loss"),
       col=c("red", "blue"), 
       lty=c(1,1), cex=0.8)
