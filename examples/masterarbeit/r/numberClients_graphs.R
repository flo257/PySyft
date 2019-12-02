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

client_1 <- loadResultsFile("exp_traffic_20191121-144634.txt")
client_5 <- loadResultsFile("exp_traffic_20191121-100638.txt")
client_10 <- loadResultsFile("exp_traffic_20191121-190642.txt")

"Epoch number ~ Test accuracy"
plot(client_1$test_accuracy[1:25] ~ client_1$epoch_number[1:25], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     main = "Epoch number vs. Test accuracy")
lines(client_5$test_accuracy[1:25] ~ client_5$epoch_number[1:25], 
      type = "l", 
      col = "blue")
lines(client_10$test_accuracy[1:25] ~ client_10$epoch_number[1:25], 
      type = "l", 
      col = "green")
legend("bottomright", legend=c("no. of clients = 1", "no. of clients = 5", "no. of clients = 10"),
       col=c("red", "blue", "green"), lty=1, cex=0.8)

# Elapsed Time vs. Test accuracy
plot(client_1$test_accuracy[1:40] ~ client_1$elapsed_time[1:40], 
     type = "l", 
     col = "red",
     xlab = "Elapsed Time (in minutes)",
     ylab = "Test accuracy",
     main = "Elapsed Time vs. Test accuracy")
lines(client_5$test_accuracy[1:40] ~ client_5$elapsed_time[1:40], 
      type = "l", 
      col = "blue")
lines(client_10$test_accuracy[1:40] ~ client_10$elapsed_time[1:40], 
      type = "l", 
      col = "green")
legend("bottomright", legend=c("no. of clients = 1", "no. of clients = 5", "no. of clients = 10"),
       col=c("red", "blue", "green"), lty=1, cex=0.8)

# epoch_number ~ elapsed_time
plot(client_1$epoch_number[1:40] ~ client_1$elapsed_time[1:40], 
     type = "l", 
     col = "red",
     xlab = "Elapsed Time (in minutes)",
     ylab = "Epoch number",
     main = "Elapsed Time vs. Epoch number") 
lines(client_5$epoch_number[1:40] ~ client_5$elapsed_time[1:40], 
      type = "l", 
      col = "blue")
lines(client_10$epoch_number[1:40] ~ client_10$elapsed_time[1:40], 
      type = "l", 
      col = "green")
legend("bottomright", legend=c("no. of clients = 1", "no. of clients = 5", "no. of clients = 10"),
       col=c("red", "blue", "green"), lty=1, cex=0.8)

