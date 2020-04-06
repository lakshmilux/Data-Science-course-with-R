library(recommenderlab)
data("MovieLense")
MovieLense[rowCounts(MovieLense)>100, colCounts(MovieLense)>120]-> sample_movie
sample(x=c(T,F),size=nrow(sample_movie),replace = T, prob = c(0.7,0.3)) ->split_movie
sample_movie[split_movie,]->recc_train
sample_movie[!split_movie,]->recc_test

Recommender(data = recc_train,method="UBCF")->recc_model_ubcf

n_recommended_ubcf<-10
predict(object=recc_model_ubcf,newdata=recc_test,n=n_recommended_ubcf)->recc_predicted_ubcf

###User-3
recc_predicted_ubcf@items[[3]]->user3_movie_numbers
recc_predicted_ubcf@itemLabels[user3_movie_numbers]

##user-5
recc_predicted_ubcf@items[[5]]->user5_movie_numbers
recc_predicted_ubcf@itemLabels[user5_movie_numbers]

h = MovieLense[rowCounts(MovieLense)>100
