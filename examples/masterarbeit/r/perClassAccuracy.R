loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/results/", filename, sep=""),
                      skip=11,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  
  return(object)
}

class_50_20 <- loadResultsFile("../classAccuarcy_50_20_basic.txt")
class_20_20 <- loadResultsFile("../classAccuarcy_20_20_basic.txt")
class_50_20_aggregation <- loadResultsFile("../classAccuarcy_50_20_aggregation.txt")
class_20_20_aggregation <- loadResultsFile("../classAccuarcy_20_20_aggregation.txt")


x <- 1:100

#50/50 split

#1
#22
#35
#-36
#-41
#-60
#86
#-91
#100
#-109
matplot(x, 
        y= class_50_20_aggregation[1:100,], 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        ylim = c(-0.15,1),
        col = c("grey", 
               "grey", 
               "grey", 
               "red", 
               "green", 
               "blue", 
               "grey", 
               "yellow",
               "grey", 
               "orange"),
        main = "Performance comparison\n50% classes (at 50% of the data)\nare exclusively known by 20% of the clients"
)

legend("bottom", 
       legend=c("(colorful) classes known to 20% of the clients", 
                "(grey) classes known to 80% of the clients"),
       col=c("red", "grey"), 
       lty=c(1,1), cex=0.5)

#80/20 split (22, 36)
matplot(x, 
        y= class_20_20[1:15,], 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        col = c("grey", 
                "red", 
                "grey", 
                "red", 
                "grey", 
                "grey", 
                "grey", 
                "grey",
                "grey", 
                "grey"),
        main = "Performance comparison\n20% classes (at 20% of the data)\nare exclusively known by 20% of the clients"
)

legend("bottomright", 
       legend=c("classes only known to 20% of the clients", 
                "classes known by all clients"),
       col=c("red", "grey"), 
       lty=c(1,1,1), cex=0.7)


#80/20 split (22, 36) - aggregation
matplot(x, 
        y= class_20_20_aggregation, 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        col = c("grey", 
                "red", 
                "grey", 
                "red", 
                "grey", 
                "grey", 
                "grey", 
                "grey",
                "grey", 
                "grey"),
        main = "Performance comparison\n20% classes (at 20% of the data)\nare exclusively known by 20% of the clients"
)

legend("bottomright", 
       legend=c("classes only known to 20% of the clients", 
                "classes known by all clients"),
       col=c("red", "grey"), 
       lty=c(1,1,1), cex=0.6)


