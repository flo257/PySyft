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

backdoor_sequential <-  loadResultsFile("exp_traffic_20191122-202041.txt")
#elapsed time wrong
backdoor_aggregation <-  loadResultsFile("exp_traffic_20191206-151859.txt")
#elapsed time wrong

#Plot 1"
plot(backdoor_sequential$test_accuracy[backdoor_sequential$training_type == "normal"] ~ 
       backdoor_sequential$epoch_number[backdoor_sequential$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     main = "Sequential Training vs. Federated Averaging\nat 20% malicious clients")

lines(backdoor_aggregation$test_accuracy[backdoor_aggregation$training_type == "normal"] ~ 
        backdoor_aggregation$epoch_number[backdoor_aggregation$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_sequential$test_accuracy[backdoor_sequential$training_type == "backdoor"] ~ 
        backdoor_sequential$epoch_number[backdoor_sequential$training_type == "backdoor"], 
      type = "l",
      lty = 2,
      col = "red")

lines(backdoor_aggregation$test_accuracy[backdoor_aggregation$training_type == "backdoor"] ~ 
        backdoor_aggregation$epoch_number[backdoor_aggregation$training_type == "backdoor"], 
      type = "l",
      lty = 2,
      col = "blue")



legend("bottomright", 
       legend=c("sequential training: benign testset accuracy", 
                "federated averaging: benign testset accuracy",
                "sequential averaging: backdoor testset accuracy",
                "federated averaging: backdoor testset accuracy"),
       col=c("red", "blue", "red", "blue"), 
       x = "right",
       lty=c(1,1,2,2), cex=0.7)

#Plot 2"
plot(backdoor_sequential$avg_test_loss[backdoor_sequential$training_type == "normal"] ~ 
       backdoor_sequential$epoch_number[backdoor_sequential$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset loss",
     main = "Testset loss \nof benign testset")

lines(backdoor_aggregation$avg_test_loss[backdoor_aggregation$training_type == "normal"] ~ 
        backdoor_aggregation$epoch_number[backdoor_aggregation$training_type == "normal"], 
      type = "l", 
      col = "blue")

legend("right", 
       legend=c("sequential training", 
                "federated averaging"),
       col=c("red", "blue"),
       lty=c(1,1), cex=0.7)

plot(backdoor_aggregation$avg_test_loss[backdoor_aggregation$training_type == "backdoor"] ~ 
       backdoor_aggregation$epoch_number[backdoor_aggregation$training_type == "backdoor"], 
     type = "l", 
     col = "blue", 
     xlab = "Epoch number", 
     ylab = "Testset loss",
     ylim=c(-1,50),
     main = "Testset loss \nof malicious testset")

lines(backdoor_sequential$avg_test_loss[backdoor_sequential$training_type == "backdoor"] ~ 
        backdoor_sequential$epoch_number[backdoor_sequential$training_type == "backdoor"], 
      type = "l",
      col = "red")

legend("right", 
       legend=c("sequential training", 
                "federated averaging"),
       col=c("red", "blue"),
       lty=c(1,1), cex=0.7)
