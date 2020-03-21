loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/gtsrb_notebooks/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  return(object)
}
no_backdoor <- loadResultsFile("exp_gtsrb_20200225-152647.txt")
green_1_125 <- loadResultsFile("exp_gtsrb_20200304-062118.txt")
green_1_25 <- loadResultsFile("exp_gtsrb_20200303-145824.txt")
green_1_50 <- loadResultsFile("exp_gtsrb_20200227-145350.txt")
green_1_75 <- loadResultsFile("exp_gtsrb_20200303-145647.txt")
green_1_100 <- loadResultsFile("exp_gtsrb_20200304-062110.txt")

plot(green_1_125$test_accuracy[green_1_125$training_type == "normal"] ~ green_1_125$epoch_number[green_1_125$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Benign testset performance\nat different 4/1 model replacement\ngreen 1 percent")
lines(green_1_25$test_accuracy[green_1_25$training_type == "normal"] ~ green_1_25$epoch_number[green_1_25$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(green_1_50$test_accuracy[green_1_50$training_type == "normal"] ~ green_1_50$epoch_number[green_1_50$training_type == "normal"], 
      type = "l", 
      col = "green")
lines(green_1_75$test_accuracy[green_1_75$training_type == "normal"] ~ green_1_75$epoch_number[green_1_75$training_type == "normal"], 
      type = "l", 
      col = "brown")
lines(green_1_100$test_accuracy[green_1_100$training_type == "normal"] ~ green_1_100$epoch_number[green_1_100$training_type == "normal"], 
      type = "l", 
      col = "orange")
lines(no_backdoor$test_accuracy[no_backdoor$training_type == "normal"] ~ no_backdoor$epoch_number[no_backdoor$training_type == "normal"], 
      type = "l", 
      col = "black")
abline(h=95, lty = 2)
legend("bottomright", legend=c(
  "0% malicious data",
  "12.5% malicious data", 
  "25% malicious data", 
  "50% malicious data",
  "75% malicious data",
  "100% malicious data"),
  col=c("black", "red", "blue", "green", "brown", "orange"), lty=c(1,1,1,1,1), cex=0.55)



plot(green_1_125$test_accuracy[green_1_125$training_type == "backdoor"] ~ green_1_125$epoch_number[green_1_125$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Malicious testset performance\nat different 4/1 model replacement\ngreen 1 percent")
lines(green_1_25$test_accuracy[green_1_25$training_type == "backdoor"] ~ green_1_25$epoch_number[green_1_25$training_type == "backdoor"], 
      type = "l", 
      col = "blue")
lines(green_1_50$test_accuracy[green_1_50$training_type == "backdoor"] ~ green_1_50$epoch_number[green_1_50$training_type == "backdoor"], 
      type = "l", 
      col = "green")
lines(green_1_75$test_accuracy[green_1_75$training_type == "backdoor"] ~ green_1_75$epoch_number[green_1_75$training_type == "backdoor"], 
      type = "l", 
      col = "brown")
lines(green_1_100$test_accuracy[green_1_100$training_type == "backdoor"] ~ green_1_100$epoch_number[green_1_100$training_type == "backdoor"], 
      type = "l", 
      col = "orange")
abline(h=95, lty=2)
legend("bottomright", legend=c("12.5% malicious data", 
                               "25% malicious data", 
                               "50% malicious data",
                               "75% malicious data",
                               "100% malicious data"),
       col=c("red", "blue", "green", "brown", "orange"), lty=c(1,1,1,1,1), cex=0.6)


#BLACK

black_1_125 <- loadResultsFile("exp_gtsrb_20200310-154035.txt")
black_1_25 <- loadResultsFile("exp_gtsrb_20200309-173030.txt")
black_1_50 <- loadResultsFile("exp_gtsrb_20200309-173225.txt")
black_1_75 <- loadResultsFile("exp_gtsrb_20200310-073100.txt")
black_1_100 <- loadResultsFile("exp_gtsrb_20200310-221645.txt")

plot(black_1_125$test_accuracy[black_1_125$training_type == "normal"] ~ black_1_125$epoch_number[black_1_125$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Benign testset performance\nat different 4/1 model replacement\nblack 1 percent")
lines(black_1_25$test_accuracy[black_1_25$training_type == "normal"] ~ black_1_25$epoch_number[black_1_25$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(black_1_50$test_accuracy[black_1_50$training_type == "normal"] ~ black_1_50$epoch_number[black_1_50$training_type == "normal"], 
      type = "l", 
      col = "green")
lines(black_1_75$test_accuracy[black_1_75$training_type == "normal"] ~ black_1_75$epoch_number[black_1_75$training_type == "normal"], 
      type = "l", 
      col = "brown")
lines(black_1_100$test_accuracy[black_1_100$training_type == "normal"] ~ black_1_100$epoch_number[black_1_100$training_type == "normal"], 
      type = "l", 
      col = "orange")
lines(no_backdoor$test_accuracy[no_backdoor$training_type == "normal"] ~ no_backdoor$epoch_number[no_backdoor$training_type == "normal"], 
      type = "l", 
      col = "black")
abline(h=95, lty = 2)
legend("topleft", legend=c(
  "0% malicious data",
  "12.5% malicious data", 
  "25% malicious data", 
  "50% malicious data",
  "75% malicious data",
  "100% malicious data"),
  col=c("black", "red", "blue", "green", "brown", "orange"), lty=c(1,1,1,1,1), cex=0.55)


plot(black_1_125$test_accuracy[black_1_125$training_type == "backdoor"] ~ black_1_125$epoch_number[black_1_125$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Malicious testset performance\nat different 4/1 model replacement\nblack 1 percent")
lines(black_1_25$test_accuracy[black_1_25$training_type == "backdoor"] ~ black_1_25$epoch_number[black_1_25$training_type == "backdoor"], 
      type = "l", 
      col = "blue")
lines(black_1_50$test_accuracy[black_1_50$training_type == "backdoor"] ~ black_1_50$epoch_number[black_1_50$training_type == "backdoor"], 
      type = "l", 
      col = "green")
lines(black_1_75$test_accuracy[black_1_75$training_type == "backdoor"] ~ black_1_75$epoch_number[black_1_75$training_type == "backdoor"], 
      type = "l", 
      col = "brown")
lines(black_1_100$test_accuracy[black_1_100$training_type == "backdoor"] ~ black_1_100$epoch_number[black_1_100$training_type == "backdoor"], 
      type = "l", 
      col = "orange")
abline(h=95,lty=2)
legend("left", legend=c("12.5% malicious data", 
                        "25% malicious data", 
                        "50% malicious data",
                        "75% malicious data",
                        "100% malicious data"),
       col=c("red", "blue", "green", "brown", "orange"), lty=c(1,1,1,1,1), cex=0.5)


#GREEN 0_5
green_0_5_125 <- loadResultsFile("exp_gtsrb_20200308-082156.txt")
green_0_5_25 <- loadResultsFile("exp_gtsrb_20200308-081922.txt")
green_0_5_50 <- loadResultsFile("exp_gtsrb_20200227-203454.txt")
green_0_5_75 <- loadResultsFile("exp_gtsrb_20200307-183049.txt")
green_0_5_100 <- loadResultsFile("exp_gtsrb_20200307-183021.txt")

plot(green_0_5_125$test_accuracy[green_0_5_125$training_type == "normal"] ~ green_0_5_125$epoch_number[green_0_5_125$training_type == "normal"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Benign testset performance\nat different 4/1 model replacement\ngreen 0.5 percent")
lines(green_0_5_25$test_accuracy[green_0_5_25$training_type == "normal"] ~ green_0_5_25$epoch_number[green_0_5_25$training_type == "normal"], 
      type = "l", 
      col = "blue")
lines(green_0_5_50$test_accuracy[green_0_5_50$training_type == "normal"] ~ green_0_5_50$epoch_number[green_0_5_50$training_type == "normal"], 
      type = "l", 
      col = "green")
lines(green_0_5_75$test_accuracy[green_0_5_75$training_type == "normal"] ~ green_0_5_75$epoch_number[green_0_5_75$training_type == "normal"], 
      type = "l", 
      col = "brown")
lines(green_0_5_100$test_accuracy[green_0_5_100$training_type == "normal"] ~ green_0_5_100$epoch_number[green_0_5_100$training_type == "normal"], 
      type = "l", 
      col = "orange")
lines(no_backdoor$test_accuracy[no_backdoor$training_type == "normal"] ~ no_backdoor$epoch_number[no_backdoor$training_type == "normal"], 
      type = "l", 
      col = "black")
abline(h=95, lty = 2)
legend("topleft", legend=c(
  "0% malicious data",
  "12.5% malicious data", 
  "25% malicious data", 
  "50% malicious data",
  "75% malicious data",
  "100% malicious data"),
  col=c("black", "red", "blue", "green", "brown", "orange"), lty=c(1,1,1,1,1), cex=0.55)


plot(green_0_5_125$test_accuracy[green_0_5_125$training_type == "backdoor"] ~ green_0_5_125$epoch_number[green_0_5_125$training_type == "backdoor"], 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "Malicious testset performance\nat different 4/1 model replacement\ngreen 0.5 percent")
lines(green_0_5_25$test_accuracy[green_0_5_25$training_type == "backdoor"] ~ green_0_5_25$epoch_number[green_0_5_25$training_type == "backdoor"], 
      type = "l", 
      col = "blue")
lines(green_0_5_50$test_accuracy[green_0_5_50$training_type == "backdoor"] ~ green_0_5_50$epoch_number[green_0_5_50$training_type == "backdoor"], 
      type = "l", 
      col = "green")
lines(green_0_5_75$test_accuracy[green_0_5_75$training_type == "backdoor"] ~ green_0_5_75$epoch_number[green_0_5_75$training_type == "backdoor"], 
      type = "l", 
      col = "brown")
lines(green_0_5_100$test_accuracy[green_0_5_100$training_type == "backdoor"] ~ green_0_5_100$epoch_number[green_0_5_100$training_type == "backdoor"], 
      type = "l", 
      col = "orange")
abline(h=95,lty=2)
legend("left", legend=c("12.5% malicious data", 
                        "25% malicious data", 
                        "50% malicious data",
                        "75% malicious data",
                        "100% malicious data"),
       col=c("red", "blue", "green", "brown", "orange"), lty=c(1,1,1,1,1), cex=0.5)



