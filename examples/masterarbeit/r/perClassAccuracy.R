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

x <- 1:15

matplot(x, 
        y= class_50_20[1:15,], 
        type = "l", 
        lty = 1,
        xlab = "Epoch number", 
        ylab = "Test accuracy",
        col = c("grey", 
               "grey", 
               "grey", 
               "red", 
               "red", 
               "red", 
               "grey", 
               "red",
               "grey", 
               "red"),
        main = "Performance comparison\nof classes being distributed non-iid"
        )


1
22
35
-36
-41
-60
86
-91
100
-109
