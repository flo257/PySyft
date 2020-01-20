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

backdoor_4_1 <- loadResultsFile("exp_traffic_20191221-160121.txt")
backdoor_7_1 <- loadResultsFile("exp_traffic_20200107-142100.txt")

"Epoch number ~ Test accuracy"
plot(backdoor_4_1$test_accuracy[backdoor_4_1$training_type == "normal"] ~ 
       backdoor_4_1$epoch_number[backdoor_4_1$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 100),
     ylim = c(0,100),
     main = "Testset performance\nwith p% malicious clients")

lines(backdoor_7_1$test_accuracy[backdoor_7_1$training_type == "normal"] ~ 
        backdoor_7_1$epoch_number[backdoor_7_1$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_7_1$test_accuracy[backdoor_7_1$training_type == "backdoor"] ~ 
        backdoor_7_1$epoch_number[backdoor_7_1$training_type == "backdoor"], 
      type = "l", 
      lty = 2, 
      col = "blue")

lines(backdoor_4_1$test_accuracy[backdoor_4_1$training_type == "backdoor"] ~ 
        backdoor_4_1$epoch_number[backdoor_4_1$training_type == "backdoor"], 
      type = "l", 
      lty = 2, 
      col = "red")
abline(h=95, lty=3)

legend("right", 
       c("benign testset at p = 20%", 
         "malicious testset at p = 20%",
         "benign testset at p = 12.5%",
         "malicious testset at p = 12.5%",
         "95% accuracy"),
       col=c("red", "red", "blue", "blue", "black"), 
       lty=c(1,2,1,2,3), cex=0.5)



