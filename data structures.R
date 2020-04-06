d = read.csv(file.choose())
attach(d)
fruits = c("aple","guav","bana","mango")
fruits
typeof(fruits)
hundrd = c(1:100)
hundrd = as.numeric(hundrd)
hundrd
log_gm = as.logical("T","F","T","F","F")
log_gm
typeof(log_gm)

jumbo = list(c(LETTERS[1:4]),as.numeric(c(55:60)),as.logical(c("T","F")))
jumbo
jumbo[[1]][3]
jumbo[[2]][[2]]
jumbo[[3]][[1]]

n = c(1:16)
fm = matrix(data = n,nrow = 4,byrow = T)
fm

arr = array(data = c(1:32),dim = c(4,4,2))
arr
