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

backdoor_basic <- loadResultsFile("exp_traffic_20191221-160121.txt")
backdoor_replacement <- loadResultsFile("exp_traffic_20191223-174802.txt")

"Epoch number ~ Test accuracy"
plot(backdoor_basic$test_accuracy[backdoor_basic$training_type == "normal"] ~ 
       backdoor_basic$epoch_number[backdoor_basic$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 100),
     ylim = c(0,100),
     main = "Performance comparison\non basic attack and model replacement\nREPEAT EXPERIMENTS")

lines(backdoor_replacement$test_accuracy[backdoor_replacement$training_type == "normal"] ~ 
        backdoor_replacement$epoch_number[backdoor_replacement$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_basic$test_accuracy[backdoor_basic$training_type == "backdoor"] ~ 
        backdoor_basic$epoch_number[backdoor_basic$training_type == "backdoor"], 
      type = "l", 
      lty = 2,
      col = "red")

lines(backdoor_replacement$test_accuracy[backdoor_replacement$training_type == "backdoor"] ~ 
        backdoor_replacement$epoch_number[backdoor_replacement$training_type == "backdoor"], 
      type = "l", 
      lty = 2,
      col = "blue")

abline(h=95, lty=3)

legend("bottomright", 
       legend=c("basic attack (benign testset)", 
                "model replacement (benign testset)",
                "basic attack (malicious testset)", 
                "model replacement (malicious testset)",
                "95% accuracy"),
       col=c("red", "blue", "red", "blue","black"), 
       lty=c(1,1,2,2.3), cex=0.6)
