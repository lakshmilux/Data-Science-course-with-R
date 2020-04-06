# To load the 'ratings' and 'movies' dataset from their respective file paths

ratings <- read.csv('C:\\Users\\Intellipaat-Team\\Desktop\\DESKTOP\\rcmt\\R-project\\ratings.csv')

movies <- read.csv('C:\\Users\\Intellipaat-Team\\Desktop\\DESKTOP\\rcmt\\R-project\\movies.csv', stringsAsFactors = FALSE)

#------------------------------------------------------------------------------------------------------------------------------------

#To create a list of all the movies rated less often(only include top 30% rated movies)

library(dplyr)

df_movie_summary = ratings %>% group_by(movieId) %>% summarise(count = n(),mean(rating))


movie_benchmark = round(quantile(df_movie_summary$count,0.70, names = FALSE),0)

drop_movie_list = df_movie_summary[df_movie_summary$count < movie_benchmark,1]

#To create a dataframe of all the movies rated less often

drop_movie_list = as.data.frame(drop_movie_list)

#--------------------------------------------------------------------------------------------------------------------------------------------------------
#To create a list of all the inactive users(users who rate less often)

df_movie_summary1 = ratings %>% group_by(userId) %>% summarise(count = n(),mean(userId))


cust_benchmark = round(quantile(df_movie_summary1$count,0.70, names = FALSE),0)

drop_cust_list = df_movie_summary1[df_movie_summary1$count < cust_benchmark,1]

#To create a dataframe of the users who rate less often
drop_cust_list = as.data.frame(drop_cust_list)

#--------------------------------------------------------------------------------------------------------------------------------------------
#To remove all the movies rated less often and users who rate less often

library(dplyr)

ratings = anti_join(ratings, drop_movie_list, by = "movieId")
ratings = anti_join(ratings, drop_cust_list, by = "userId")



#--------------------------------------------------------------------------------------------------------------------------------------


#Create ratings matrix for 'ratings' matrix with Rows = userId, Columns = movieId

library(reshape2)
ratingmat <- dcast(ratings, userId~movieId, value.var = "rating", na.rm=FALSE)
ratingmat <- as.matrix(ratingmat[,-1]) #remove userIds



#Convert rating matrix into a recommenderlab sparse matrix
library(recommenderlab)
ratingmat <- as(ratingmat, "realRatingMatrix")

#Normalize the data
ratingmat_norm <- normalize(ratingmat)

#----------------------------------------------------------------------------------------------------------------------------
#Create Recommender Model. "SVD" stands for Singular Value Decomposition
recommender_model <- Recommender(ratingmat_norm, method = "SVD")
recom <- predict(recommender_model, ratingmat[5], n=10) #Obtain top 10 recommendations for 10th user in dataset
recom_list <- as(recom, "list") #convert recommenderlab object to readable list



#Obtain recommendations
recom_result <- matrix(0,10)

for (i in c(1:10)){
  recom_result[i] <- movies[as.integer(recom_list[[1]][i]),2]
}


#Print top 10 recommendations
recom_result

#------------------------------------------------------------------------------------------------------------------------------------------------------------
#To calculate the evaluation metrics for the SVD model using thhe 5-fold cross-validation

evaluation_scheme <- evaluationScheme(ratingmat, method="cross-validation", k=5, given=3, goodRating = 5) #k=3 meaning a 3-fold cross validation.

#To calculate evaluation metrics for top 1,3,5, and 10 recommendations
evaluation_results <- evaluate(evaluation_scheme, method="SVD", n=c(1,3,5,10))

eval_results <- getConfusionMatrix(evaluation_results)[[1]]

#To print the evaluation results

eval_results
