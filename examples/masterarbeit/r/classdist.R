classesTraffic <- c(606,664,2878,1338,1563,196,425,423,239,1551)
barplot(classesTraffic, 
        names.arg = 1:10,
        ylim = c(0,3000),
        main = "Class distribution of the Traffic sign dataset",
        ylab = "Number of observations",
        xlab = "Classes")

classesYale <- c(110,110,110,110,110,110,110,110,110,110,110,110,110,110,110)
barplot(classesYale, 
        names.arg = 1:15,
        ylim = c(0,120),
        main = "Class distribution of the Yale faces dataset",
        ylab = "Number of observations",
        xlab = "Classes")

classesBreakhis <- c(644, 774)
barplot(classesBreakhis, 
        names.arg = c("benign cancer", "malignant cancer"),
        ylim = c(0,800),
        main = "Class distribution of the BreakHis dataset",
        ylab = "Number of observations",
        xlab = "Classes")
