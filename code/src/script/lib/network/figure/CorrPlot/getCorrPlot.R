getCorrPlot <- function(data,pval,list,pval_thr,filename_out){
  
  lapply(names(list),function(x){
    
    y <- list[[x]]
    y <- y[order(y$drug),]
    
    tl.col = "black"
    
    y <- data.frame(y)
    colnames(y) = "drug"
    
    if(nrow(y)==1){
      
      data <- as.matrix(data[,y[,"drug"]])
      pval <- as.matrix(pval[,y[,"drug"]])
      
      colnames(data) <- y["drug"]
      colnames(pval) <- y["drug"]
      
    }else{
      
      data <- data[,y[,"drug"]]
      pval <- pval[,y[,"drug"]]
      
    }
    
    x <- gsub(pattern = " ", x = x, replacement = "_")
    
    pdf(file = paste0(filename_out,"_",x,".pdf"))
    
    corrplot(data, is.corr = F, 
             method = "circle", 
             p.mat = pval, 
             sig.level = pval_thr,
             tl.cex = 0.6,
             tl.col = tl.col,
             insig = "blank",
             #insig = "pch", pch = "·", pch.col = "white", pch.cex = 1,
             na.label = "square", na.label.col = "white", 
             cl.cex = 0.6, 
             col = brewer.pal(n = 10, name = "RdBu"))
    
    dev.off()
    
  })
}
