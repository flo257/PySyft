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

client_2 <- loadResultsFile("exp_traffic_20191221-145047.txt")
client_5 <- loadResultsFile("exp_traffic_20191220-144732.txt")
client_8 <- loadResultsFile("exp_traffic_20191220-181435.txt")

"Epoch number ~ Avg train loss"
plot(client_8$avg_training_loss[client_8$training_type == "normal"] ~ client_8$epoch_number[client_8$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Avg. train loss",
     ylim = c(0, 2.5),
     xlim = c(0,100),
     main = "Epoch number vs. Average Training loss")
lines(client_5$avg_training_loss[client_5$training_type == "normal"] ~ client_5$epoch_number[client_5$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(client_2$avg_training_loss[client_2$training_type == "normal"] ~ client_2$epoch_number[client_2$training_type == "normal"], 
      type = "l", 
      col = "green")

legend("right", legend=c("no. of clients = 8", "no. of clients = 5", "no. of clients = 2","95% accuracy"),
       col=c("red", "blue", "green"), lty=c(1,1,1), cex=0.8)

"Epoch number ~ test accuracy"
plot(client_8$test_accuracy[client_8$training_type == "normal"] ~ client_8$epoch_number[client_8$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(40,100),
     xlim = c(0,100),
     main = "Epoch number vs. Testset accuracy")
lines(client_5$test_accuracy[client_5$training_type == "normal"] ~ client_5$epoch_number[client_5$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(client_2$test_accuracy[client_2$training_type == "normal"] ~ client_2$epoch_number[client_2$training_type == "normal"], 
      type = "l", 
      col = "green")
abline(h=95, lty=2)
legend("bottomright", legend=c("no. of clients = 8", "no. of clients = 5", "no. of clients = 2", "95% accuracy"),
       col=c("red", "blue", "green", "black"), lty=c(1,1,1,2), cex=0.8)


# epoch_number ~ elapsed_time
plot(client_8$elapsed_time[client_8$training_type == "normal"][1:100] ~ client_8$epoch_number[client_8$training_type == "normal"][1:100], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     main = "Epoch number vs. Testset accuracy")
lines(client_5$elapsed_time[client_5$training_type == "normal"] ~ client_5$epoch_number[client_5$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(client_2$elapsed_time[client_2$training_type == "normal"] ~ client_2$epoch_number[client_2$training_type == "normal"], 
      type = "l", 
      col = "green")
legend("right", legend=c("no. of clients = 8", "no. of clients = 5", "no. of clients = 2"),
       col=c("red", "blue", "green"), lty=1, cex=0.8)

# epoch_number ~ elapsed_time
plot(client_2$epoch_number[1:40] ~ client_2$elapsed_time[1:40], 
     type = "l", 
     col = "green",
     xlab = "Elapsed Time (in minutes)",
     ylab = "Epoch number",
     main = "Elapsed Time vs. Epoch number\n learning rate = 0.1") 
lines(client_5$epoch_number[1:40] ~ client_5$elapsed_time[1:40], 
      type = "l", 
      col = "blue")
lines(client_10$epoch_number[1:40] ~ client_10$elapsed_time[1:40], 
      type = "l", 
      col = "red")
legend("bottomright", legend=c("no. of clients = 2", "no. of clients = 5", "no. of clients = 10"),
       col=c("green", "blue", "red"), lty=1, cex=0.8)

"Epoch number ~ test accuracy"
plot(client_10$test_accuracy[1:45] ~ client_10$elapsed_time[1:45], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test set accuracy",
     xlim = c(0, 500),
     main = "Epoch number vs. Test set accuracy\nlearning rate = 0.1")
lines(clients_10_batchsize8$test_accuracy[clients_10_batchsize8$training_type == "normal"] ~ clients_10_batchsize8$elapsed_time[clients_10_batchsize8$training_type == "normal"], 
      type = "l", 
      lty = 2,
      col = "red")
legend("bottomright", legend=c("no. of clients = 10, batch size = 64", "no. of clients = 10, batch size = 8"),
       col=c("red", "red"), lty=c(1,2), cex=0.8)
