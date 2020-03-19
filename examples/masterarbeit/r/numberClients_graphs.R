loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/gtsrb_notebooks/", filename, sep=""),
                      #skip=11,
                      #header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

client_1 <- loadResultsFile("exp_gtsrb_20200225-091236.txt")
client_5 <- loadResultsFile("exp_gtsrb_20200224-164321.txt")
client_10 <- loadResultsFile("exp_gtsrb_20200224-112615.txt")

"Epoch number ~ Test accuracy"
plot(client_1$V6[1:100] ~ client_1$V2[1:100], 
     type = "l", 
     col = "red", 
     ylim = c(0,100),
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     lwd = 2,
     main = "Epoch number vs. Test accuracy")
lines(client_5$V6[1:100] ~ client_5$V2[1:100], 
      type = "l", 
      lwd = 2,
      col = "blue")
lines(client_10$V6[1:100] ~ client_10$V2[1:100], 
      type = "l", 
      lwd = 2,
      col = "green")
abline(h=95, col="black", lty = 2)

legend("bottomright", 
       legend=c("1 client", 
                "5 cients",
                "10 clients",
                "95% accuracy"),
       col=c("red", "blue", "green", "black"), 
       lty=c(1,1,1,2), cex=0.7)



"Epoch number ~ Test accuracy"
plot(client_1$V4[1:100] ~ client_1$V2[1:100], 
     type = "l", 
     col = "red", 
     ylim = c(0,4),
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     lwd = 2,
     main = "Epoch number vs. Test accuracy")
lines(client_5$V4[1:100] ~ client_5$V2[1:100], 
      type = "l", 
      lwd = 2,
      col = "blue")
lines(client_10$V4[1:100] ~ client_10$V2[1:100], 
      type = "l", 
      lwd = 2,
      col = "green")
abline(h=95, col="black", lty = 2)

legend("bottomright", 
       legend=c("1 client", 
                "5 cients",
                "10 clients",
                "95% accuracy"),
       col=c("red", "blue", "green", "black"), 
       lty=c(1,1,1,2), cex=0.7)

