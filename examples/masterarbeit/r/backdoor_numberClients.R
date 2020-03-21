loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/gtsrb_notebooks/", filename, sep=""),
                      #skip=11,
                      header = TRUE,
                      sep = ";")
                      #colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
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

backdoor_20percent <-  loadResultsFile("exp_gtsrb_20200229-071144.txt")
backdoor_10percent <- loadResultsFile("exp_gtsrb_20200305-234618.txt")
backdoor_5percent <- loadResultsFile("exp_gtsrb_20200310-152626.txt")
backdoor_0 <- loadResultsFile2("exp_gtsrb_20200224-112615.txt")

"Epoch number ~ Test accuracy"
plot(backdoor_20percent$X9[backdoor_20percent$X1 == "normal"] ~ 
       backdoor_20percent$X2[backdoor_20percent$X1 == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     ylim = c(0,100),
     main = "Benign testset performance\nwith p% malicious clients\nsequential merging")

lines(backdoor_10percent$X9[backdoor_10percent$X1 == "normal"] ~ 
        backdoor_10percent$X2[backdoor_10percent$X1 == "normal"], 
      type = "l", 
      col = "blue")

lines(backdoor_5percent$X9[backdoor_5percent$X1 == "normal"] ~ 
        backdoor_5percent$X2[backdoor_5percent$X1 == "normal"], 
      type = "l", 
      col = "green")

lines(backdoor_0$V6 ~ 
        backdoor_0$V2, 
      type = "l", 
      col = "black")

abline(h=95, lty=2)
legend("bottomright", 
       legend=c("benign test data (p=20%)", 
                "benign test data (p=10%)", 
                "benign test data (p=5%)", 
                "benign test data (no backdoor)"), 
       col=c("red", "blue", "green","black"), 
       lty=c(1,1,1,1), cex=0.8)


"Epoch number ~ Test accuracy"
plot(backdoor_20percent$X9[backdoor_20percent$X1 == "backdoor"] ~ 
       backdoor_20percent$X2[backdoor_20percent$X1 == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     ylim = c(90,100),
     main = "Malicious testset performance\nwith p% malicious clients\nsequential merging")

lines(backdoor_10percent$X9[backdoor_10percent$X1 == "backdoor"] ~ 
        backdoor_10percent$X2[backdoor_10percent$X1 == "backdoor"], 
      type = "l", 
      col = "blue")

lines(backdoor_5percent$X9[backdoor_5percent$X1 == "backdoor"] ~ 
        backdoor_5percent$X2[backdoor_5percent$X1 == "backdoor"], 
      type = "l", 
      col = "green")

abline(h=95, lty=2)
legend("bottomright", 
       legend=c("benign test data (p=20%)", 
                "benign test data (p=10%)", 
                "benign test data (p=5%)"), 
       col=c("red", "blue", "green"), 
       lty=c(1,1,1), cex=0.8)
