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

loadResultsFile2 <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/gtsrb_notebooks/", filename, sep=""),
                      #skip=11,
                      #header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

client_2 <- loadResultsFile("exp_gtsrb_20200225-185926.txt")
client_5 <- loadResultsFile("exp_gtsrb_20200225-152647.txt")
client_5_seq <- loadResultsFile2("exp_gtsrb_20200224-164321.txt")
client_8 <- loadResultsFile("exp_gtsrb_20200302-140305.txt")
client_8_seq <- loadResultsFile2("exp_gtsrb_20200224-112615.txt")

"Epoch number ~ Avg train loss"
plot(client_8$avg_training_loss[client_8$training_type == "normal"] ~ client_8$epoch_number[client_8$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Avg. train loss",
     ylim = c(0, 4),
     xlim = c(0,100),
     main = "Epoch number vs. Average Training loss")
lines(client_5$avg_training_loss[client_5$training_type == "normal"] ~ client_5$epoch_number[client_5$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(client_2$avg_training_loss[client_2$training_type == "normal"] ~ client_2$epoch_number[client_2$training_type == "normal"], 
      type = "l", 
      col = "green")

legend("right", legend=c("2 clients", "5 clients", "10 clients"),
       col=c("green", "blue", "red"), lty=c(1,1,1), cex=0.8)

"Epoch number ~ test accuracy"
plot(client_2$test_accuracy[client_2$training_type == "normal"] ~ client_2$epoch_number[client_2$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Epoch number vs. Testset accuracy")
lines(client_5$test_accuracy[client_5$training_type == "normal"] ~ client_5$epoch_number[client_5$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(client_8$test_accuracy[client_8$training_type == "normal"] ~ client_8$epoch_number[client_8$training_type == "normal"], 
      type = "l", 
      col = "green")
abline(h=95, lty=2)
legend("bottomright", legend=c("2 clients", "5 clients", "10 clients", "95% accuracy"),
       col=c("red", "blue", "green", "black"), lty=c(1,1,1,2), cex=0.8)


#comparison
plot(client_5$test_accuracy[client_5$training_type == "normal"] ~ client_5$epoch_number[client_5$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Comparison of 5 clients in sequential and aggregation")

lines(client_5_seq$V6[client_5_seq$V1 == "normal"] ~ client_5_seq$V2[client_5_seq$V1 == "normal"], 
      type = "l", 
      col = "blue")

abline(h=95, lty=2)
legend("bottomright", legend=c("5 clients using federated aggregation", "5 clients using sequential learning", "95% accuracy"),
       col=c("red", "blue", "black"), lty=c(1,1,2), cex=0.8)


plot(client_8$test_accuracy[client_8$training_type == "normal"] ~ client_8$epoch_number[client_8$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Comparison of 10 clients in sequential and aggregation")

lines(client_8_seq$V6[client_8_seq$V1 == "normal"] ~ client_8_seq$V2[client_8_seq$V1 == "normal"], 
      type = "l", 
      col = "blue")

abline(h=95, lty=2)
legend("bottomright", legend=c("10 clients using federated aggregation", "10 clients using sequential learning", "95% accuracy"),
       col=c("red", "blue", "black"), lty=c(1,1,2), cex=0.8)

