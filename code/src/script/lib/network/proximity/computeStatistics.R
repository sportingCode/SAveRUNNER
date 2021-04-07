computeStatistics <- function(distribution,observation,plot=F,filename=NULL){
  
  m <- mean(distribution, na.rm = T)
  sd <- sd(distribution, na.rm = T)
  
  z <- (observation - m) / sd
  
  pval = pnorm(z, lower.tail = T) # H1 = be less than expected by chance

  # ######################################
  # the xpd parameter is "A logical value or NA. 
  # If FALSE, all plotting is clipped to the plot region 
  # if TRUE, all plotting is clipped to the figure region
  # if NA, all plotting is clipped to the device region"
  
  if(plot){
    
    par(xpd=F)
    
    xmin <- min((m-3*sd),observation)
    xmax = max((m+3*sd),observation)
    
    fun <- function(x) dnorm(x,m,sd)
    
    pdf(file = filename)
    
    plot <- curve(fun, xlim = c(xmin,xmax),
                  xlab = "Network proximity", 
                  ylab = "Probability density", 
                  n = 1000)
    
    polygon(plot, col = "grey")
    
    abline(v = observation, lty = 2, lwd = 2, col = "red")
    
    legend("topright",
           paste("Observation =", format(observation, digits = 3), "\n", 
                 "p-value =", format(pval, digits=1)),
           text.col=2, 
           text.font = 2, 
           bty="o", 
           xjust = 0.5, 
           yjust = 0.5)
    
    dev.off()
    
  }
  
  return(pval)
  
}