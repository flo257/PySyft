loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/gtsrb_notebooks/", filename, sep=""),
                      #skip=11,
                      #header = TRUE,
                      sep = ";")
                      #colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

first_80_20 <- loadResultsFile("exp_gtsrb_perClassAccuracy_20200311-090415.txt")
last_80_20 <- loadResultsFile("exp_gtsrb_perClassAccuracy_20200312-163037.txt")

first_50_50 <- loadResultsFile("exp_gtsrb_perClassAccuracy_20200312-095036.txt")
last_50_50 <- loadResultsFile("exp_gtsrb_perClassAccuracy_20200312-162036.txt")

original <- loadResultsFile("exp_gtsrb_perClassAccuracy_20200225-152647.txt")

first_20clients_80_20 <- loadResultsFile("exp_gtsrb_perClassAccuracy_20200318-110957.txt")
first_20clients_50_50 <- loadResultsFile("exp_gtsrb_perClassAccuracy_20200318-112229.txt")


#80_20 first
colors = array(1:43)
colors[1:43] = "grey"
colors[2] = "red"
colors[7] = "red"
colors[14] = "red"
colors[19] = "red"
colors[23] = "red"
colors[28] = "red"
colors[33] = "red"
colors[38] = "red"
colors[42] = "red"
matplot(1:100, 
        y= 100*first_20clients_80_20[1:100,], 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        ylim = c(0,100),
        col = colors,
        main = "5 CLIENTS: 80_20 aggregation"
)
legend("left", 
       legend=c("classes known to 20% of the clients", 
                "classes known to all clients"),
       col=c("red", "grey"), 
       lty=c(1,1), cex=0.5)

#original
matplot(1:100, 
        y= 100*original[1:100,], 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        ylim = c(0,100),
        col = colors,
        main = "80_20 first split on original data - aggregation"
)
legend("bottomright", 
       legend=c("20% of the classes used in distribution experiments", 
                "all other classes"),
       col=c("red", "grey"), 
       lty=c(1,1), cex=0.7)

#80_20 last
matplot(1:100, 
        y= 100*last_80_20[1:100,], 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        ylim = c(0,100),
        col = colors,
        main = "80_20 last"
)
legend("bottomright", 
       legend=c("classes known to 20% of the clients", 
                "classes known to all clients"),
       col=c("red", "grey"), 
       lty=c(1,1), cex=0.7)


colors[1:43] = "grey"

for (i in 1:43) {
  if(i %% 2 == 0){
    colors[i] = "red"
  }
}

matplot(1:100, 
        y= 100*first_20clients_50_50[1:100,], 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        ylim = c(0,100),
        col = colors,
        main = "50_50 aggregation"
)
legend("left", 
       legend=c("classes known to 20% of the clients", 
                "classes known to all clients"),
       col=c("red", "grey"), 
       lty=c(1,1), cex=0.7)

#50_50 last
matplot(1:100, 
        y= 100*last_50_50[1:100,], 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        ylim = c(0,100),
        col = colors,
        main = "50_50 last"
)
legend("bottomright", 
       legend=c("classes known to 20% of the clients", 
                "classes known to all clients"),
       col=c("red", "grey"), 
       lty=c(1,1), cex=0.7)

#original
matplot(1:100, 
        y= 100*original[1:100,], 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        ylim = c(0,100),
        col = colors,
        main = "50_50 first split on original data"
)

legend("bottomright", 
       legend=c("50% of the classes used in distribution experiments", 
                "all other classes"),
       col=c("red", "grey"), 
       lty=c(1,1), cex=0.7)
