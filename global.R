# routine to ensure pixel intensity values stay in range
img_check <- function(img){
  
  # if RGB then dim[3] exists
  a1 = dim(img)[3]
  
  if (anyNA(a1)) {
    img = apply(img, 2, function(x){(x<0)*0 + (x>0)*x})
    img = apply(img, 2, function(x){(x>1)*1 + (x<1)*x})
    
  } else {
    
    for (i0 in 1:dim(img)[3]){
      img[,,i0] = apply(img[,,i0], 2, function(x){(x<0)*0 + (x>0)*x})
      img[,,i0] = apply(img[,,i0], 2, function(x){(x>1)*1 + (x<1)*x})     
    }
    
    return(img)
  } # if-else ends 
} # func ends


# routine to ensure pixel intensity values stay in range
img_check <- function(img){
  
  # if RGB then dim[3] exists
  a1 = dim(img)[3]
  
  if (anyNA(a1)) {
    img = apply(img, 2, function(x){(x<0)*0 + (x>0)*x})
    img = apply(img, 2, function(x){(x>1)*1 + (x<1)*x})
    
  } else {
    
    for (i0 in 1:dim(img)[3]){
      img[,,i0] = apply(img[,,i0], 2, function(x){(x<0)*0 + (x>0)*x})
      img[,,i0] = apply(img[,,i0], 2, function(x){(x>1)*1 + (x<1)*x})     
    }
    
    return(img)
  } # if-else ends 
} # func ends

show_recov_img <- function(im_gray, k=50){
  
  a0 = princomp(im_gray)
  
  recov_mat = a0$scores[, 1:k] %*% t(a0$loadings[, 1:k])
  recov_mat1 = apply(recov_mat, 2, function(x) {(x-min(x))/(max(x)-min(x))})
  
  a1 = as.raster(recov_mat1)
  # return(a1)  # commit
 
  #title1 = paste0("with ", k, " components.")
  return(list(a1, recov_mat))   
  #plot(a1);title(title1)  # returns raster plot & title
  
}  # func ends

# clear grDevice
# dev.off()  


show_recov_nmf <- function(im_gray, k=50){
  
  require(NMF)
  out_nmf <- nmf(im_gray, k) 
  
  w <- out_nmf@fit@W   # since A ~ WH
  h <- out_nmf@fit@H
  recov_mat <- w %*% h
  
  recov_mat1 = apply(recov_mat, 2, function(x) {(x-min(x))/(max(x)-min(x))})
  
  a1 = as.raster(recov_mat1)
  return(a1)
 # title1 = paste0("with ", k, " components.")
  #plot(a1);title(title1)  
  
}





