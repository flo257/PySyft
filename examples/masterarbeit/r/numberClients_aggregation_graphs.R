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

client_2 <- loadResultsFile("exp_traffic_20191202-165243.txt")
client_5 <- loadResultsFile("exp_traffic_20191202-110129.txt")
client_10 <- loadResultsFile("exp_traffic_20191202-125420.txt")

"Epoch number ~ Avg train loss"
plot(client_10$avg_training_loss[1:75] ~ client_10$epoch_number[1:75], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Avg. train loss",
     ylim = c(0, 2.5),
     main = "Epoch number vs. Average Training loss\nlearning rate = 0.1")
lines(client_5$avg_training_loss ~ client_5$epoch_number, 
      type = "l", 
      col = "blue")
lines(client_2$avg_training_loss ~ client_2$epoch_number, 
      type = "l", 
      col = "green")
legend("bottomright", legend=c("no. of clients = 2", "no. of clients = 5", "no. of clients = 10"),
       col=c("green", "blue", "red"), lty=1, cex=0.8)

"Epoch number ~ test accuracy"
plot(client_10$test_accuracy[1:60] ~ client_10$epoch_number[1:60], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test set accuracy",
     ylim = c(0, 100),
     main = "Epoch number vs. Test set accuracy\nlearning rate = 0.1")
lines(client_5$test_accuracy ~ client_5$epoch_number, 
      type = "l", 
      col = "blue")
lines(client_2$test_accuracy ~ client_2$epoch_number, 
      type = "l", 
      col = "green")
legend("bottomright", legend=c("no. of clients = 2", "no. of clients = 5", "no. of clients = 10"),
       col=c("green", "blue", "red"), lty=1, cex=0.8)

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

