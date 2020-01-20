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

backdoor_20percent <-  loadResultsFile("exp_traffic_20191122-202041.txt")
#add one day
backdoor_20percent$timestamp[109] = backdoor_20percent$timestamp[109] + 86400
backdoor_20percent$timestamp[111:200] = backdoor_20percent$timestamp[111:200] + 86400
backdoor_20percent$elapsed_time = ((backdoor_20percent$timestamp - backdoor_20percent$timestamp[1])/60)

backdoor_10percent <- loadResultsFile("exp_traffic_20191122-141715.txt")
backdoor_5percent <- loadResultsFile("exp_traffic_20191123-193202.txt")
backdoor_5percent$timestamp[155:200] = backdoor_5percent$timestamp[155:200] + 86400
backdoor_5percent$elapsed_time = ((backdoor_5percent$timestamp - backdoor_5percent$timestamp[1])/60)


"Epoch number ~ Test accuracy"
plot(backdoor_20percent$test_accuracy[backdoor_20percent$training_type == "normal"] ~ 
       backdoor_20percent$epoch_number[backdoor_20percent$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     main = "Testset performance\nwith p% malicious clients\nsequential merging")

lines(backdoor_20percent$test_accuracy[backdoor_20percent$training_type == "backdoor"] ~ 
        backdoor_20percent$epoch_number[backdoor_20percent$training_type == "backdoor"], 
      type = "l", 
      lty=2,
      col = "red")

lines(backdoor_10percent$test_accuracy[backdoor_10percent$training_type == "normal"] ~ 
        backdoor_10percent$epoch_number[backdoor_10percent$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_10percent$test_accuracy[backdoor_10percent$training_type == "backdoor"] ~ 
        backdoor_10percent$epoch_number[backdoor_10percent$training_type == "backdoor"], 
      type = "l", 
      lty=2,
      col = "blue")

lines(backdoor_5percent$test_accuracy[backdoor_5percent$training_type == "normal"] ~ 
        backdoor_5percent$epoch_number[backdoor_5percent$training_type == "normal"], 
      type = "l", 
      col = "green")

lines(backdoor_5percent$test_accuracy[backdoor_5percent$training_type == "backdoor"] ~ 
        backdoor_5percent$epoch_number[backdoor_5percent$training_type == "backdoor"], 
      type = "l", 
      lty=2,
      col = "green")
abline(h=95, lty=3)
legend("bottomright", 
       legend=c("benign test data (p=0.2)", 
                "malicious test data (p=0.2)",
                "benign test data (p=0.1)", 
                "malicious test data (p=0.1)", 
                "benign test data (p=0.05)", 
                "malicious test data (p=0.05)",
                "95% accuracy"), 
       col=c("red", "red", "blue", "blue", "green", "green","black"), 
       lty=c(1,2,1,2,1,2,3), cex=0.8)
