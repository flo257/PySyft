loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/results/yale/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  object$timestamp = strptime(object$timestamp, format="%H%M%S")
  object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

clients_5 <- loadResultsFile("exp_yale_20200116-104619.txt")
clients_10 <- loadResultsFile("exp_yale_20200116-123756.txt")

"Epoch number ~ Test accuracy"
plot(clients_10$test_accuracy ~ 
       clients_10$epoch_number, 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 1000),
     ylim = c(0,100),
     main = "STRETCHED: Benign testset performance\nat different number of clients using federated aggregation")

clients_5$epoch_number = clients_5$epoch_number * 3.33

lines(clients_5$test_accuracy ~ 
        clients_5$epoch_number, 
      type = "l", 
      col = "blue")
abline(h=95, col="black", lty = 2)

legend("bottomright", 
       legend=c("10 clients", 
                "5 cients",
                "95% accuracy"),
       col=c("red", "blue", "black"), 
       lty=c(1,1,2), cex=0.7)


"Epoch number ~ Train loss"
plot(clients_10$avg_training_loss ~ 
       clients_10$epoch_number, 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     xlim = c(0, 1000),
     ylim = c(0,8),
     main = "STRETCHED: Training lossat different number of clients\nusing federated averaging")

lines(clients_5$avg_training_loss ~ 
        clients_5$epoch_number, 
      type = "l", 
      col = "blue")

legend("right", 
       legend=c("10 clients", 
                "5 cients"),
       col=c("red", "blue"), 
       lty=c(1,1), cex=0.7)

