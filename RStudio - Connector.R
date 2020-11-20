#### MySQL and SQL Server Connection

install.packages("RMariaDB")

library(RMariaDB)

birdstrikesDb <- dbConnect(RMariaDB::MariaDB(), user = 'User1', password = 'Y2u2r2i2', dbname = 'firstdb', host = 'localhost') 

table <- dbListTables(birdstrikesDb)

query <- paste("SELECT * FROM birdstrikes")

rs = dbSendQuery(birdstrikesDb,query)

# fetch the result of the query in a data frame
dbRows<-dbFetch(rs)

#close connection
dbDisconnect(birdstrikesDb)

