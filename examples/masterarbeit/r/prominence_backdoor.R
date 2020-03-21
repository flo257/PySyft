loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/results/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";")
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

percentage_0_5_last <- loadResultsFile("../gtsrb_notebooks/exp_gtsrb_20200302-090026.txt")
percentage_1_last <- loadResultsFile("../gtsrb_notebooks/exp_gtsrb_20200229-071144.txt")

percentage_0_5_first <- loadResultsFile("../gtsrb_notebooks/exp_gtsrb_20200228-093808.txt")
percentage_1_first <- loadResultsFile("../gtsrb_notebooks/exp_gtsrb_20200228-152630.txt")


"Epoch number ~ Test accuracy"
plot(percentage_0_5_last$X9[percentage_0_5_last$X1 == "normal"] ~ percentage_0_5_last$X2[percentage_0_5_last$X1 == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Test accuracy",
     main = "Testset performance\nwith 20% malicious clients")


"Epoch number ~ Test accuracy"
plot(percentage_1_last$X9[percentage_1_last$X1 == "normal"] ~ percentage_1_last$X2[percentage_1_last$X1 == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylim = c(0,100),
     ylab = "Test accuracy",
     main = "Testset performance\nwith 20% malicious clients at 1% green backdoors\nmalicious clients trained last")

lines(percentage_1_last$X9[percentage_1_last$X1 == "backdoor"] ~ percentage_1_last$X2[percentage_1_last$X1 == "backdoor"], 
      type = "l",
      col = "blue")

"Epoch number ~ Test accuracy"
plot(percentage_0_5_last$X9[percentage_0_5_last$X1 == "normal"] ~ percentage_0_5_last$X2[percentage_0_5_last$X1 == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylim = c(0,100),
     ylab = "Test accuracy",
     main = "Testset performance\nwith 20% malicious clients at 0.5% green backdoors\nmalicious clients trained last")

lines(percentage_0_5_last$X9[percentage_0_5_last$X1 == "backdoor"] ~ percentage_0_5_last$X2[percentage_0_5_last$X1 == "backdoor"], 
      type = "l",
      col = "blue")

"Epoch number ~ Test accuracy"
plot(percentage_0_5_first$X9[percentage_0_5_first$X1 == "normal"] ~ percentage_0_5_first$X2[percentage_0_5_first$X1 == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylim = c(0,100),
     ylab = "Test accuracy",
     main = "Testset performance\nwith 20% malicious clients at 0.5% green backdoors\nmalicious clients trained first")

lines(percentage_0_5_first$X9[percentage_0_5_first$X1 == "backdoor"] ~ percentage_0_5_first$X2[percentage_0_5_first$X1 == "backdoor"], 
      type = "l",
      col = "blue")

"Epoch number ~ Test accuracy"
plot(percentage_1_first$X9[percentage_1_first$X1 == "normal"] ~ percentage_1_first$X2[percentage_1_first$X1 == "normal"], 
     type = "l", 
     col = "blue", 
     xlab = "Epoch number", 
     ylim = c(0,100),
     ylab = "Test accuracy",
     main = "Benign testset performance\nof green squared backdoors\nin sequential learning")
lines(percentage_0_5_first$X9[percentage_0_5_first$X1 == "normal"] ~ percentage_0_5_first$X2[percentage_0_5_first$X1 == "normal"], 
      type = "l",
      col = "red")
abline(h=95, lty = 2)

legend("bottomright", 
       legend=c("size: 0.5%", 
                "size: 1%",
                "95% accuracy"),
       col=c("red", "blue", "black"), 
       lty=c(1,1,2), cex=0.8)



"Epoch number ~ Test accuracy"
plot(percentage_1_first$X9[percentage_1_first$X1 == "backdoor"] ~ percentage_1_first$X2[percentage_1_first$X1 == "backdoor"], 
     type = "l", 
     col = "blue", 
     xlab = "Epoch number", 
     ylim = c(0,100),
     ylab = "Test accuracy",
     main = "Malicious testset performance\nof green squared backdoors\nin sequential learning")
lines(percentage_0_5_first$X9[percentage_0_5_first$X1 == "backdoor"] ~ percentage_0_5_first$X2[percentage_0_5_first$X1 == "backdoor"], 
      type = "l",
      col = "red")
abline(h=95, lty = 2)

legend("bottomright", 
       legend=c("size: 0.5%", 
                "size: 1%",
                "95% accuracy"),
       col=c("red", "blue", "black"), 
       lty=c(1,1,2), cex=0.8)
