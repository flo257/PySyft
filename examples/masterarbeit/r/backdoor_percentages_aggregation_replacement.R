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

backdoor_100 <- loadResultsFile("exp_traffic_20191223-174802.txt")
backdoor_75 <-loadResultsFile("exp_traffic_20200109-175513.txt")
backdoor_50 <-loadResultsFile("exp_traffic_20191220-104730.txt")
backdoor_25 <-loadResultsFile("exp_traffic_20191220-091548.txt")
backdoor_12 <-loadResultsFile("exp_traffic_20191220-121735.txt")

"Epoch number ~ Test accuracy"
plot(backdoor_100$test_accuracy[backdoor_100$training_type == "normal"] ~ 
       backdoor_100$epoch_number[backdoor_100$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 50),
     ylim = c(0,100),
     main = "Benign testset performance\nwith p% malicious data in backdoored clients")

lines(backdoor_75$test_accuracy[backdoor_75$training_type == "normal"] ~ 
        backdoor_75$epoch_number[backdoor_75$training_type == "normal"], 
      type = "l", 
      col = "black")

lines(backdoor_50$test_accuracy[backdoor_50$training_type == "normal"] ~ 
        backdoor_50$epoch_number[backdoor_50$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_25$test_accuracy[backdoor_25$training_type == "normal"] ~ 
        backdoor_25$epoch_number[backdoor_25$training_type == "normal"], 
      type = "l", 
      col = "green")

lines(backdoor_12$test_accuracy[backdoor_12$training_type == "normal"] ~ 
        backdoor_12$epoch_number[backdoor_12$training_type == "normal"], 
      type = "l", 
      col = "yellow")

abline(h=95, lty=3)

legend("bottomright", 
       legend=c("malicious clients at p=100%", 
                "malicious clients at p=75%",
                "malicious clients at p=50%",
                "malicious clients at p=25%",
                "malicious clients at p=12.5%",
                "95% accuracy"),
       col=c("red", "black", "blue", "green", "yellow","black"), 
       lty=c(1,1,1,1,1,3), cex=0.7)

plot(backdoor_100$test_accuracy[backdoor_100$training_type == "backdoor"] ~ 
       backdoor_100$epoch_number[backdoor_100$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 43),
     ylim = c(00,100),
     main = "Backdoored testset performance\nwith p% malicious data in backdoored clients")

lines(backdoor_75$test_accuracy[backdoor_75$training_type == "backdoor"] ~ 
        backdoor_75$epoch_number[backdoor_75$training_type == "backdoor"], 
      type = "l", 
      lty = 2,
      col = "black")

lines(backdoor_50$test_accuracy[backdoor_50$training_type == "backdoor"] ~ 
        backdoor_50$epoch_number[backdoor_50$training_type == "backdoor"], 
      type = "l", 
      col = "blue")

lines(backdoor_25$test_accuracy[backdoor_25$training_type == "backdoor"] ~ 
        backdoor_25$epoch_number[backdoor_25$training_type == "backdoor"], 
      type = "l", 
      col = "green")

lines(backdoor_12$test_accuracy[backdoor_12$training_type == "backdoor"] ~ 
        backdoor_12$epoch_number[backdoor_12$training_type == "backdoor"], 
      type = "l", 
      col = "yellow")

abline(h=95, lty=3)

legend("bottomright", 
       legend=c("malicious clients at p=100%", 
                "malicious clients at p=75%",
                "malicious clients at p=50%",
                "malicious clients at p=25%",
                "malicious clients at p=12.5%",
                "95% accuracy"),
       col=c("red", "black", "blue", "green", "yellow","black"), 
       lty=c(1,1,1,1,1,3), cex=0.7)

#trainloss
plot(backdoor_100$avg_test_loss[backdoor_100$training_type == "backdoor"] ~ 
       backdoor_100$epoch_number[backdoor_100$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Average malicioustestset loss",
     ylim = c(0,6),
     xlim = c(0, 45),
     main = "Average malicious testset loss\nat p% malicious data in backdoored clients")

lines(backdoor_75$avg_test_loss[backdoor_75$training_type == "backdoor"] ~ 
        backdoor_75$epoch_number[backdoor_75$training_type == "backdoor"], 
      type = "l", 
      col = "black")

lines(backdoor_50$avg_test_loss[backdoor_50$training_type == "backdoor"] ~ 
        backdoor_50$epoch_number[backdoor_50$training_type == "backdoor"], 
      type = "l", 
      col = "blue")

lines(backdoor_25$avg_test_loss[backdoor_25$training_type == "backdoor"] ~ 
        backdoor_25$epoch_number[backdoor_25$training_type == "backdoor"], 
      type = "l", 
      col = "green")

lines(backdoor_12$avg_test_loss[backdoor_12$training_type == "backdoor"] ~ 
        backdoor_12$epoch_number[backdoor_12$training_type == "backdoor"], 
      type = "l", 
      col = "yellow")

legend("topright", 
       legend=c(
                "benign testset loss, malicious clients at p=100%",
                "benign testset loss, malicious clients at p=75%",
                "benign testset loss, malicious clients at p=50%",
                "benign testset loss, malicious clients at p=25%",
                "benign testset loss, malicious clients at p=12.5%"),
       col=c("red","black" ,"blue", "green", "yellow", "red", "black", "blue", "green", "yellow"), 
       lty=c(1,1,1,1,1,2,2,2,2,2), cex=0.6)








#trainloss
plot(backdoor_100$avg_test_loss[backdoor_100$training_type == "normal"] ~ 
       backdoor_100$epoch_number[backdoor_100$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Average benign testset loss",
     ylim = c(0,6),
     xlim = c(0, 45),
     main = "Average benign testset loss\nat p% malicious data in backdoored clients")

lines(backdoor_75$avg_test_loss[backdoor_75$training_type == "normal"] ~ 
        backdoor_75$epoch_number[backdoor_75$training_type == "normal"], 
      type = "l", 
      col = "black")

lines(backdoor_50$avg_test_loss[backdoor_50$training_type == "normal"] ~ 
        backdoor_50$epoch_number[backdoor_50$training_type == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_25$avg_test_loss[backdoor_25$training_type == "normal"] ~ 
        backdoor_25$epoch_number[backdoor_25$training_type == "normal"], 
      type = "l", 
      col = "green")

lines(backdoor_12$avg_test_loss[backdoor_12$training_type == "normal"] ~ 
        backdoor_12$epoch_number[backdoor_12$training_type == "normal"], 
      type = "l", 
      col = "yellow")

legend("topright", 
       legend=c(
                "benign testset loss, malicious clients at p=100%",
                "benign testset loss, malicious clients at p=75%",
                "benign testset loss, malicious clients at p=50%",
                "benign testset loss, malicious clients at p=25%",
                "benign testset loss, malicious clients at p=12.5%"),
       col=c("red","black" ,"blue", "green", "yellow", "red", "black", "blue", "green", "yellow"), 
       lty=c(1,1,1,1,1,2,2,2,2,2), cex=0.7)

