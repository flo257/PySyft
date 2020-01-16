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

backdoor_100 <- loadResultsFile("exp_traffic_20191221-160121.txt")
backdoor_50 <-loadResultsFile("exp_traffic_20191222-114051.txt")

backdoor_50 <-loadResultsFile("exp_traffic_20191222-114051.txt")
backdoor_25 <-loadResultsFile("exp_traffic_20191222-141343.txt")

"Epoch number ~ Test accuracy"
plot(backdoor_100$test_accuracy[backdoor_100$training_type == "normal"] ~ 
       backdoor_100$epoch_number[backdoor_100$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 50),
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
       legend=c("malicious clients at p=100%", 
                "malicious clients at p=50%",
                "malicious clients at p=25%"),
       col=c("red", "blue", "green"), 
       lty=c(1,1,1), cex=0.7)

plot(backdoor_100$test_accuracy[backdoor_100$training_type == "backdoor"] ~ 
       backdoor_100$epoch_number[backdoor_100$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 100),
     main = "Backdoored testset performance\nwith p% malicious data in backdoored clients")

lines(backdoor_50$test_accuracy[backdoor_50$training_type == "backdoor"] ~ 
        backdoor_50$epoch_number[backdoor_50$training_type == "backdoor"], 
      type = "l", 
      col = "blue")

lines(backdoor_25$test_accuracy[backdoor_25$training_type == "backdoor"] ~ 
        backdoor_25$epoch_number[backdoor_25$training_type == "backdoor"], 
      type = "l", 
      col = "green")

legend("topleft", 
       legend=c("malicious clients at p=100%", 
                "malicious clients at p=50%",
                "malicious clients at p=25%"),
       col=c("red", "blue", "green"), 
       lty=c(1,1,1), cex=0.7)

#trainloss
plot(backdoor_100$avg_test_loss[backdoor_100$training_type == "backdoor"] ~ 
       backdoor_100$epoch_number[backdoor_100$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Average testset loss",
     ylim = c(0,15),
     xlim = c(0, 100),
     main = "Average testset loss\nat p% malicious data in backdoored clients")

lines(backdoor_100$avg_test_loss[backdoor_100$training_type == "normal"] ~ 
        backdoor_100$epoch_number[backdoor_100$training_type == "normal"], 
      type = "l", 
      lty = 2,
      col = "red")

lines(backdoor_50$avg_test_loss[backdoor_50$training_type == "backdoor"] ~ 
        backdoor_50$epoch_number[backdoor_50$training_type == "backdoor"], 
      type = "l", 
      col = "blue")

lines(backdoor_50$avg_test_loss[backdoor_50$training_type == "normal"] ~ 
        backdoor_50$epoch_number[backdoor_50$training_type == "normal"], 
      type = "l", 
      lty = 2,
      col = "blue")

lines(backdoor_25$avg_test_loss[backdoor_25$training_type == "backdoor"] ~ 
        backdoor_25$epoch_number[backdoor_25$training_type == "backdoor"], 
      type = "l", 
      col = "green")

lines(backdoor_25$avg_test_loss[backdoor_25$training_type == "normal"] ~ 
        backdoor_25$epoch_number[backdoor_25$training_type == "normal"], 
      type = "l", 
      lty = 2,
      col = "green")

legend("topright", 
       legend=c("backdoored testset loss, malicious clients at p=100%", 
                "backdoored testset loss, malicious clients at p=50%",
                "backdoored testset loss, malicious clients at p=25%",
                "benign testset loss, malicious clients at p=100%",
                "benign testset loss, malicious clients at p=50%",
                "benign testset loss, malicious clients at p=25%"),
       col=c("red", "blue", "green", "red", "blue", "green"), 
       lty=c(1,1,1,2,2,2), cex=0.6)

