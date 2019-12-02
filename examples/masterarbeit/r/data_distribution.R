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

equal <-  loadResultsFile("exp_traffic_20191121-190642.txt")
percent20 <-  loadResultsFile("exp_traffic_20191125-121706.txt")
percent20 <- percent20[1:25,]

"Epoch number ~ Test accuracy"
plot(equal$test_accuracy ~ equal$epoch_number, 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     main = "Testset performance\nwith 20% malicious clients")

lines(percent20$test_accuracy ~ percent20$epoch_number, 
      type = "l",
      col = "blue")

lines(backdoor_100_last$test_accuracy[backdoor_100_last$training_type == "normal"] ~ 
        backdoor_100_last$epoch_number[backdoor_100_last$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_100_last$test_accuracy[backdoor_100_last$training_type == "backdoor"] ~ 
        backdoor_100_last$epoch_number[backdoor_100_last$training_type == "backdoor"], 
      type = "l", 
      lty=2,
      col = "blue")

legend("bottomright", 
       legend=c("benign test data (backdoors trained first)", 
                "malicious test data (backdoors trained first)",
                "benign test data (backdoors trained last)", 
                "malicious test data (backdoors trained last)"),
       col=c("red", "red", "blue", "blue"), 
       lty=c(1,2,1,2), cex=0.6)
