loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/results/traffic/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #add one day
  #object$timestamp[3:25] = object$timestamp[3:25] + 86400
  object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

batch_64 <-  loadResultsFile("exp_traffic_20191220-181435.txt")
batch_64$timestamp[117:232] = batch_64$timestamp[117:232] + 86400
batch_64$elapsed_time = ((batch_64$timestamp - batch_64$timestamp[1])/60)
batch_8 <- loadResultsFile("exp_traffic_20200111-183015.txt")
batch_8$timestamp[15:24] = batch_8$timestamp[15:24] + 86400
batch_8$elapsed_time = ((batch_8$timestamp - batch_8$timestamp[1])/60)


"Epoch number ~ Test accuracy"
plot(batch_64$test_accuracy[1:50] ~ batch_64$epoch_number[1:50], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     ylim = c(20,100),
     main = "Epoch number vs. Test accuracy")

lines(batch_8$test_accuracy ~ batch_8$epoch_number, 
      type = "l", 
      col = "green")

abline(h = 95, col = "blue", lty = 2)

legend("bottomright", legend=c("batch size = 64", "batch size = 8", "95% accuracy"),
       col=c("red", "green", "blue"), lty=c(1,1,2), cex=0.8)

# Elapsed Time vs. Test accuracy
plot(batch_8$test_accuracy ~ batch_8$elapsed_time, 
     type = "l", 
     col = "green",
     xlab = "Elapsed Time (in minutes)",
     ylab = "Test accuracy",
     main = "Elapsed Time vs. Test accuracy")

lines(batch_64$test_accuracy ~ batch_64$elapsed_time, 
      type = "l", 
      col = "red")
abline(h = 95, col = "blue", lty = 2)

legend("bottomright", legend=c("batch size = 64", "batch size = 8", "95% accuracy"),
       col=c("red", "green", "blue"), lty=c(1,1,2), cex=0.8)

# epoch_number ~ elapsed_time
plot(batch_8$epoch_number ~ batch_8$elapsed_time, 
     type = "l", 
     col = "red",
     xlab = "Elapsed Time (in minutes)",
     ylab = "Epoch number",
     main = "Elapsed Time vs. Epoch number") 

lines(batch_64$epoch_number ~ batch_64$elapsed_time, 
      type = "l", 
      col = "green")

abline(h = 20, col = "blue", lty = 2)

legend("bottomright", legend=c("batch size = 8", "batch size = 64"),
       col=c("red", "green"), lty=1, cex=0.8)

