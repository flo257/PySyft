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

percent_0_5 <- loadResultsFile("exp_traffic_20200226-095932.txt")
percent_1 <- loadResultsFile("exp_traffic_20200124-190249.txt")

"Epoch number ~ test accuracy"
plot(percent_0_5$test_accuracy[percent_0_5$training_type == "normal"] ~ percent_0_5$epoch_number[percent_0_5$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(40,100),
     xlim = c(0,100),
     main = "Benign testset performane\nof green squared backdoors\nusing model replacement (at 50% poisoned data)")
lines(percent_1$test_accuracy[percent_1$training_type == "normal"] ~ percent_1$epoch_number[percent_1$training_type == "normal"], 
      type = "l", 
      col = "blue")

abline(h=95, lty=2)
legend("bottomright", legend=c("size: 0.5%", "size: 1%", "95% accuracy"),
       col=c("red", "blue", "black"), lty=c(1,1,2), cex=0.8)

"Epoch number ~ test accuracy"
plot(percent_0_5$test_accuracy[percent_0_5$training_type == "backdoor"] ~ percent_0_5$epoch_number[percent_0_5$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(40,100),
     xlim = c(0,100),
     main = "Malicious testset performane\nof green squared backdoors\nusing model replacement (at 50% poisoned data)")
lines(percent_1$test_accuracy[percent_1$training_type == "backdoor"] ~ percent_1$epoch_number[percent_1$training_type == "backdoor"], 
      type = "l", 
      col = "blue")
abline(h=95, lty=2)
legend("bottomright", legend=c("size: 0.5%", "size: 1%", "95% accuracy"),
       col=c("red", "blue", "black"), lty=c(1,1,2), cex=0.8)

abline(h=95, lty=2)
