loadResultsFile <- function(filename){
  object = read.table(paste("/Users/floriannuding/PySyft-fork/examples/masterarbeit/yale_total_notebooks/", filename, sep=""),
                      skip=8,
                      header = TRUE,
                      sep = ";",
                      colClasses=c("character", "numeric", "numeric", "numeric", "numeric", "character"))
  #object$timestamp = strptime(object$timestamp, format="%H%M%S")
  #object$elapsed_time = ((object$timestamp - object$timestamp[1])/60)
  return(object)
}

clients_10_seq <- loadResultsFile("exp_yale_20200320-091322.txt")
clients_5_seq <- loadResultsFile("exp_yale_20200317-095112.txt")
clients_1_seq <- loadResultsFile("exp_yale_20200321-132011.txt")

clients_10_agg <- loadResultsFile("exp_yale_20200320-091248.txt")
clients_5_agg <- loadResultsFile("exp_yale_20200320-110135.txt")
clients_2_agg <- loadResultsFile("exp_yale_20200321-111208.txt")

#seq
plot(clients_10_seq$test_accuracy ~ clients_10_seq$epoch_number, 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "seq reference")
lines(clients_5_seq$test_accuracy ~ clients_5_seq$epoch_number, 
      type = "l", 
      col = "blue")
lines(clients_1_seq$test_accuracy ~ clients_1_seq$epoch_number, 
      type = "l", 
      col = "green")
legend("bottomright", legend=c("10 clients",
                               "5 clients", 
                               "1 client"),
       col=c("red", "blue", "green"), lty=c(1,1,1), cex=0.8)

#agg
plot(clients_10_agg$test_accuracy ~ clients_10_agg$epoch_number, 
     type = "l", 
     col = "red", 
     xlab = "Epoch number", 
     ylab = "Testset accuracy",
     ylim = c(0,100),
     xlim = c(0,100),
     main = "agg reference")
lines(clients_5_agg$test_accuracy ~ clients_5_agg$epoch_number, 
      type = "l", 
      col = "blue")
lines(clients_2_agg$test_accuracy ~ clients_2_agg$epoch_number, 
      type = "l", 
      col = "green")
legend("bottomright", legend=c("10 clients",
                        "5 clients", 
                        "2 clients"),
       col=c("red", "blue", "green"), lty=c(1,1,1), cex=0.8)
