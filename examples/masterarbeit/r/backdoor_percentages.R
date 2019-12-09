loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/results/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  object$timestamp = strptime(object$timestamp, format="%H%M%S")
  object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

backdoor_100 <-  loadResultsFile("exp_traffic_20191122-202041.txt")
backdoor_100$timestamp[109] = backdoor_100$timestamp[109] + 86400
backdoor_100$timestamp[111:200] = backdoor_100$timestamp[111:200] + 86400
backdoor_100$elapsed_time = ((backdoor_100$timestamp - backdoor_100$timestamp[1])/60)
backdoor_50 <-loadResultsFile("exp_traffic_20191126-123859.txt")
backdoor_25 <-loadResultsFile("exp_traffic_20191126-182816.txt")

"Epoch number ~ Test accuracy"
plot(backdoor_100$test_accuracy[backdoor_100$training_type == "normal"] ~ 
       backdoor_100$epoch_number[backdoor_100$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     main = "Benign testset performance\nwith p% malicious data in backdoored clients")

lines(backdoor_50$test_accuracy[backdoor_50$training_type == "normal"] ~ 
        backdoor_50$epoch_number[backdoor_50$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_25$test_accuracy[backdoor_25$training_type == "normal"] ~ 
        backdoor_25$epoch_number[backdoor_25$training_type == "normal"], 
      type = "l", 
      col = "green")



legend("bottomright", 
       legend=c("malicious clients contain 100% backdoored data", 
                "malicious clients contain 50% backdoored data",
                "malicious clients contain 25% backdoored data"),
       col=c("red", "blue", "green"), 
       lty=c(1,1,1), cex=0.7)

plot(backdoor_100$test_accuracy[backdoor_100$training_type == "backdoor"] ~ 
       backdoor_100$epoch_number[backdoor_100$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     ylim = c(97, 100),
     main = "Backdoored testset performance\nwith p% malicious data in backdoored clients")

lines(backdoor_50$test_accuracy[backdoor_50$training_type == "backdoor"] ~ 
        backdoor_50$epoch_number[backdoor_50$training_type == "backdoor"], 
      type = "l", 
      col = "blue")

lines(backdoor_25$test_accuracy[backdoor_25$training_type == "backdoor"] ~ 
        backdoor_25$epoch_number[backdoor_25$training_type == "backdoor"], 
      type = "l", 
      col = "green")

legend("bottomright", 
       legend=c("malicious clients contain 100% backdoored data", 
                "malicious clients contain 50% backdoored data",
                "malicious clients contain 25% backdoored data"),
       col=c("red", "blue", "green"), 
       lty=c(1,1,1), cex=0.7)
