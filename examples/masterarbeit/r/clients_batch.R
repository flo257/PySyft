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

client_1_32 <- loadResultsFile("exp_traffic_20191121-162310.txt")
client_1_64 <- loadResultsFile("exp_traffic_20191121-144634.txt")

client_5_32 <- loadResultsFile("exp_traffic_20191121-113201.txt")
client_5_64 <- loadResultsFile("exp_traffic_20191121-100638.txt")

"Epoch number ~ Test accuracy"
plot(client_1_32$test_accuracy ~ client_1_32$epoch_number, 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     main = "Epoch number vs. Test accuracy")
lines(client_1_64$test_accuracy ~ client_1_64$epoch_number, 
      type = "l", 
      col = "blue")
lines(client_5_32$test_accuracy ~ client_5_32$epoch_number, 
      type = "l", 
      lty = 2,
      col = "black")
lines(client_5_64$test_accuracy ~ client_5_64$epoch_number, 
      type = "l", 
      lty = 2,
      col = "green")

legend("bottomright", legend=c("no. of clients = 1, batch size = 32", 
                               "no. of clients = 1, batch size = 64", 
                               "no. of clients = 5, batch size = 32",
                               "no. of clients = 5, batch size = 64"),
       col=c("red", "blue", "black", "green"), lty=c(1,1,2,2), cex=0.8)

# Elapsed Time vs. Test accuracy
plot(client_1_32$test_accuracy ~ client_1_32$elapsed_time, 
     type = "l", 
     col = "red",
     xlab = "Elapsed Time (in minutes)",
     ylab = "Test accuracy",
     main = "Elapsed Time vs. Test accuracy")
lines(client_1_64$test_accuracy ~ client_1_64$elapsed_time, 
      type = "l", 
      col = "blue")
lines(client_5_32$test_accuracy ~ client_5_32$elapsed_time, 
      type = "l", 
      lty = 2,
      col = "black")
lines(client_5_64$test_accuracy ~ client_5_64$elapsed_time, 
      type = "l", 
      lty = 2,
      col = "green")
legend("bottomright", legend=c("no. of clients = 1, batch size = 32", 
                               "no. of clients = 1, batch size = 64", 
                               "no. of clients = 5, batch size = 32",
                               "no. of clients = 5, batch size = 64"),
       col=c("red", "blue", "black", "green"), lty=c(1,1,2,2), cex=0.8)

# epoch_number ~ elapsed_time
plot(client_1_32$epoch_number ~ client_1_32$elapsed_time, 
     type = "l", 
     col = "red",
     xlab = "Elapsed Time (in minutes)",
     ylab = "Epoch number",
     main = "Elapsed Time vs. Epoch number") 
lines(client_1_64$epoch_number ~ client_1_64$elapsed_time, 
      type = "l", 
      col = "blue")
lines(client_5_32$epoch_number ~ client_5_32$elapsed_time, 
      type = "l", 
      lty = 2,
      col = "black")
lines(client_5_64$epoch_number ~ client_5_64$elapsed_time, 
      type = "l", 
      lty = 2,
      col = "green")
legend("bottomright", legend=c("no. of clients = 1, batch size = 32", 
                               "no. of clients = 1, batch size = 64", 
                               "no. of clients = 5, batch size = 32",
                               "no. of clients = 5, batch size = 64"),
       col=c("red", "blue", "black", "green"), lty=c(1,1,2,2), cex=0.8)

