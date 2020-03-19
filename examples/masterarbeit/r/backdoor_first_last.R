loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/gtsrb_notebooks/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";")
                      #colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

"BACKDOORS 4/1"
"BACKDOORS LAST 4/1"
backdoor_4_1_last <-  loadResultsFile("exp_gtsrb_20200229-071144.txt")

in_between_normal <- backdoor_4_1_last$X7[backdoor_4_1_last$X1=="normal"]
in_between_backdoor <- backdoor_4_1_last$X6[backdoor_4_1_last$X1=="backdoor"]

after_normal <- backdoor_4_1_last$X9[backdoor_4_1_last$X1=="normal"]
after_backdoor <- backdoor_4_1_last$X9[backdoor_4_1_last$X1=="backdoor"]

test <- c(rbind(in_between_normal, after_normal))
test2 <- c(rbind(in_between_backdoor, after_backdoor))

"Benign testset"
plot(test,
     type = "l",
     col ="grey",
     main = "Backdoors last in 4/1 - benign testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_normal ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_normal ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("benign testest acc. after all benign clients,\nbefore training malicious clients", 
                               "benign testest acc. after training also malicious clients"),
       col=c("red", "blue", "green"), lty=c(3,3), lwd = 3, cex=0.6)

"Malicious testset"
plot(test2,
     type = "l",
     col ="grey",
     main = "Backdoors last in 4/1 - malicious testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_backdoor ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_backdoor ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("malicious testest acc. after all benign clients,\nbefore training malicious clients", 
                               "malicious testest acc. after training also malicious clients"),
       col=c("red", "blue"), lty=c(3,3), lwd = 3, cex=0.65)


"BACKDOORS FIRST 4/1"
backdoor_4_1_first <-  loadResultsFile("exp_gtsrb_20200228-152630.txt")

in_between_normal <- backdoor_4_1_first$X6[backdoor_4_1_first$X1=="normal"]
in_between_backdoor <- backdoor_4_1_first$X7[backdoor_4_1_first$X1=="backdoor"]

after_normal <- backdoor_4_1_first$X9[backdoor_4_1_first$X1=="normal"]
after_backdoor <- backdoor_4_1_first$X9[backdoor_4_1_first$X1=="backdoor"]

test <- c(rbind(in_between_normal, after_normal))
test2 <- c(rbind(in_between_backdoor, after_backdoor))

"Benign testset"
plot(test,
     type = "l",
     col ="grey",
     main = "Backdoors first in 4/1 - benign testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_normal ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_normal ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("benign testest acc. after malicious clients,\nbut before training all benign clients", 
                               "benign testest acc. after training also benign clients"),
       col=c("red", "blue", "green"), lty=c(3,3), lwd = 3, cex=0.6)

"Malicious testset"
plot(test2,
     type = "l",
     col ="grey",
     main = "Backdoors first in 4/1 - malicious testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_backdoor ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_backdoor ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("Malicious testest acc. after malicious clients,\nbut before training all benign clients", 
                               "Malicious testest acc. after training also benign clients"),
       col=c("red", "blue", "green"), lty=c(3,3), lwd = 3, cex=0.6)








"BACKDOORS 9/1"
"BACKDOORS LAST 9/1"
backdoor_4_1_last <-  loadResultsFile("exp_gtsrb_20200305-234618.txt")

in_between_normal <- backdoor_4_1_last$X7[backdoor_4_1_last$X1=="normal"]
in_between_backdoor <- backdoor_4_1_last$X6[backdoor_4_1_last$X1=="backdoor"]

after_normal <- backdoor_4_1_last$X9[backdoor_4_1_last$X1=="normal"]
after_backdoor <- backdoor_4_1_last$X9[backdoor_4_1_last$X1=="backdoor"]

test <- c(rbind(in_between_normal, after_normal))
test2 <- c(rbind(in_between_backdoor, after_backdoor))

"Benign testset"
plot(test,
     type = "l",
     col ="grey",
     main = "Backdoors last in 9/1 - benign testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_normal ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_normal ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("benign testest acc. after all benign clients,\nbefore training malicious clients", 
                               "benign testest acc. after training also malicious clients"),
       col=c("red", "blue", "green"), lty=c(3,3), lwd = 3, cex=0.6)

"Malicious testset"
plot(test2,
     type = "l",
     col ="grey",
     main = "Backdoors last in 9/1 - malicious testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_backdoor ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_backdoor ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("malicious testest acc. after all benign clients,\nbefore training malicious clients", 
                               "malicious testest acc. after training also malicious clients"),
       col=c("red", "blue"), lty=c(3,3), lwd = 3, cex=0.6)


"BACKDOORS FIRST 9/1"
backdoor_4_1_first <-  loadResultsFile("exp_gtsrb_20200308-160728.txt")

in_between_normal <- backdoor_4_1_first$X6[backdoor_4_1_first$X1=="normal"]
in_between_backdoor <- backdoor_4_1_first$X7[backdoor_4_1_first$X1=="backdoor"]

after_normal <- backdoor_4_1_first$X9[backdoor_4_1_first$X1=="normal"]
after_backdoor <- backdoor_4_1_first$X9[backdoor_4_1_first$X1=="backdoor"]

test <- c(rbind(in_between_normal, after_normal))
test2 <- c(rbind(in_between_backdoor, after_backdoor))

"Benign testset"
plot(test,
     type = "l",
     col ="grey",
     main = "Backdoors first in 9/1 - benign testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_normal ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_normal ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("benign testest acc. after malicious clients,\nbut before training all benign clients", 
                               "benign testest acc. after training also benign clients"),
       col=c("red", "blue", "green"), lty=c(3,3), lwd = 3, cex=0.6)

"Malicious testset"
plot(test2,
     type = "l",
     col ="grey",
     main = "Backdoors first in 9/1 - malicious testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_backdoor ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_backdoor ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("Malicious testest acc. after malicious clients,\nbut before training all benign clients", 
                               "Malicious testest acc. after training also benign clients"),
       col=c("red", "blue", "green"), lty=c(3,3), lwd = 3, cex=0.6)
















"BACKDOORS 19/1"
"BACKDOORS LAST 19/1"
backdoor_4_1_last <-  loadResultsFile("exp_gtsrb_20200310-152626.txt")

in_between_normal <- backdoor_4_1_last$X7[backdoor_4_1_last$X1=="normal"]
in_between_backdoor <- backdoor_4_1_last$X6[backdoor_4_1_last$X1=="backdoor"]

after_normal <- backdoor_4_1_last$X9[backdoor_4_1_last$X1=="normal"]
after_backdoor <- backdoor_4_1_last$X9[backdoor_4_1_last$X1=="backdoor"]

test <- c(rbind(in_between_normal, after_normal))
test2 <- c(rbind(in_between_backdoor, after_backdoor))

"Benign testset"
plot(test,
     type = "l",
     col ="grey",
     main = "Backdoors last in 19/1 - benign testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_normal ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_normal ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("benign testest acc. after all benign clients,\nbefore training malicious clients", 
                               "benign testest acc. after training also malicious clients"),
       col=c("red", "blue", "green"), lty=c(3,3), lwd = 3, cex=0.6)

"Malicious testset"
plot(test2,
     type = "l",
     col ="grey",
     main = "Backdoors last in 19/1 - malicious testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_backdoor ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_backdoor ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("malicious testest acc. after all benign clients,\nbefore training malicious clients", 
                               "malicious testest acc. after training also malicious clients"),
       col=c("red", "blue"), lty=c(3,3), lwd = 3, cex=0.6)


"BACKDOORS FIRST 19/1"
backdoor_4_1_first <-  loadResultsFile("exp_gtsrb_20200308-161012.txt")

in_between_normal <- backdoor_4_1_first$X6[backdoor_4_1_first$X1=="normal"]
in_between_backdoor <- backdoor_4_1_first$X7[backdoor_4_1_first$X1=="backdoor"]

after_normal <- backdoor_4_1_first$X9[backdoor_4_1_first$X1=="normal"]
after_backdoor <- backdoor_4_1_first$X9[backdoor_4_1_first$X1=="backdoor"]

test <- c(rbind(in_between_normal, after_normal))
test2 <- c(rbind(in_between_backdoor, after_backdoor))

"Benign testset"
plot(test,
     type = "l",
     col ="grey",
     main = "Backdoors first in 19/1 - benign testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_normal ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_normal ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("benign testest acc. after malicious clients,\nbut before training all benign clients", 
                               "benign testest acc. after training also benign clients"),
       col=c("red", "blue", "green"), lty=c(3,3), lwd = 3, cex=0.6)

"Malicious testset"
plot(test2,
     type = "l",
     col ="grey",
     main = "Backdoors first in 19/1 - malicious testset",
     xlab = "Tested point of time",
     ylab = "Testset accuracy",
     ylim = c(0,100),
     lty = 1)
values_1_3_5 <- c(1:100)*2-1
values_2_4_6 <- c(1:100)*2

points(in_between_backdoor ~ values_1_3_5,
       col = "red",
       pch = 20,
       cex = 0.5)
points(after_backdoor ~ values_2_4_6,
       col = "blue",
       pch = 20,
       cex = 0.5)

legend("bottomright", legend=c("Malicious testest acc. after malicious clients,\nbut before training all benign clients", 
                               "Malicious testest acc. after training also benign clients"),
       col=c("red", "blue", "green"), lty=c(3,3), lwd = 3, cex=0.6)


#comparision malicious testset in networks with 4, 9 or 19 benign clients trained FIRST
backdoor_4_1_first <-  loadResultsFile("exp_gtsrb_20200228-152630.txt")
backdoor_9_1_first <-  loadResultsFile("exp_gtsrb_20200308-160728.txt")
backdoor_19_1_first <-  loadResultsFile("exp_gtsrb_20200308-161012.txt")

plot(backdoor_4_1_first$X9[backdoor_4_1_first$X1=="backdoor"],
     type = "l",
     col ="red",
     main = "Comparision malicious testset in networks\nat 4, 9 or 19 benign clients trained FIRST",
     xlab = "Tested point of time",
     ylab = "epochs",
     ylim = c(0,100),
     lty = 1)
lines(backdoor_9_1_first$X9[backdoor_9_1_first$X1=="backdoor"],
      col = "blue")
lines(backdoor_19_1_first$X9[backdoor_19_1_first$X1=="backdoor"],
      col = "green")
abline(h=95,
       lty = 2)
legend("right", legend=c("4 benign clients, 1 attacker", "9 benign clients, 1 attacker", "19 benign clients, 1 attacker", "95% accuracy"),
       col=c("red", "blue", "green", "black"), lty=c(1,1,1,2), cex=0.8)

plot(backdoor_4_1_first$X9[backdoor_4_1_first$X1=="normal"],
     type = "l",
     col ="red",
     main = "Comparision normal testset in networks\nat 4, 9 or 19 benign clients trained FIRST",
     xlab = "Tested point of time",
     ylab = "epochs",
     ylim = c(0,100),
     lty = 1)
lines(backdoor_9_1_first$X9[backdoor_9_1_first$X1=="normal"],
      col = "blue")
lines(backdoor_19_1_first$X9[backdoor_19_1_first$X1=="normal"],
      col = "green")
abline(h=95,
       lty = 2)
legend("right", legend=c("4 benign clients, 1 attacker", "9 benign clients, 1 attacker", "19 benign clients, 1 attacker", "95% accuracy"),
       col=c("red", "blue", "green", "black"), lty=c(1,1,1,2), cex=0.8)
