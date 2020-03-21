loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/gtsrb_notebooks/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  object$timestamp = strptime(object$timestamp, format="%H%M%S")
  object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

no_backdoor <- loadResultsFile("exp_gtsrb_20200225-152647.txt")
basic_100 <- loadResultsFile("exp_gtsrb_20200318-203612.txt")
basic_75 <- loadResultsFile("exp_gtsrb_20200305-060337.txt")
basic_50 <- loadResultsFile("exp_gtsrb_20200305-055529.txt")
basic_25 <- loadResultsFile("exp_gtsrb_20200305-232824.txt")

"Epoch number ~ Test accuracy"
plot(no_backdoor$test_accuracy[no_backdoor$training_type == "normal"] ~ 
       no_backdoor$epoch_number[no_backdoor$training_type == "normal"], 
     type = "l", 
     col = "black", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 100),
     ylim = c(0,100),
     main = "Benign testset performance\nwith p% malicious clients")

lines(basic_100$test_accuracy[basic_100$training_type == "normal"] ~ 
        basic_100$epoch_number[basic_100$training_type == "normal"], 
      type = "l", 
      col = "red")

lines(basic_75$test_accuracy[basic_75$training_type == "normal"] ~ 
        basic_75$epoch_number[basic_75$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(basic_50$test_accuracy[basic_50$training_type == "normal"] ~ 
        basic_50$epoch_number[basic_50$training_type == "normal"], 
      type = "l", 
      col = "green")

lines(basic_25$test_accuracy[basic_25$training_type == "normal"] ~ 
        basic_25$epoch_number[basic_25$training_type == "normal"], 
      type = "l", 
      col = "pink")


legend("bottomright", 
       c("no malicious clients", 
         "malicious clients containing 100% poisoned data",
         "malicious clients containing 75% poisoned data",
         "malicious clients containing 50% poisoned data",
         "malicious clients containing 25% poisoned data"),
       col=c("black", "red", "blue", "green", "pink"), 
       lty=c(1,1,1,1,1), cex=0.7)


"Epoch number ~ Test accuracy"
plot(no_backdoor$test_accuracy[no_backdoor$training_type == "backdoor"] ~ 
       no_backdoor$epoch_number[no_backdoor$training_type == "backdoor"], 
     type = "l", 
     col = "black", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 100),
     ylim = c(0,100),
     main = "Malicious testset performance\nwith p% malicious clients")

lines(basic_100$test_accuracy[basic_100$training_type == "backdoor"] ~ 
        basic_100$epoch_number[basic_100$training_type == "backdoor"], 
      type = "l", 
      col = "red")

lines(basic_75$test_accuracy[basic_75$training_type == "backdoor"] ~ 
        basic_75$epoch_number[basic_75$training_type == "backdoor"], 
      type = "l", 
      col = "blue")

lines(basic_50$test_accuracy[basic_50$training_type == "backdoor"] ~ 
        basic_50$epoch_number[basic_50$training_type == "backdoor"], 
      type = "l", 
      col = "green")

lines(basic_25$test_accuracy[basic_25$training_type == "backdoor"] ~ 
        basic_25$epoch_number[basic_25$training_type == "backdoor"], 
      type = "l", 
      col = "pink")


legend("left", 
       c( 
         "malicious clients containing 100% poisoned data",
         "malicious clients containing 75% poisoned data",
         "malicious clients containing 50% poisoned data",
         "malicious clients containing 25% poisoned data"),
       col=c("red", "blue", "green", "pink"), 
       lty=c(1,1,1,1), cex=0.7)

plot(no_backdoor$avg_training_loss[no_backdoor$training_type == "normal"] ~ 
       no_backdoor$epoch_number[no_backdoor$training_type == "normal"], 
     type = "l", 
     col = "black", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 100),
     ylim = c(0,10),
     main = "Malicious testset performance\nwith p% malicious clients")

lines(basic_75$avg_training_loss[basic_75$training_type == "backdoor"] ~ 
        basic_75$epoch_number[basic_75$training_type == "backdoor"], 
      type = "l", 
      col = "red")


