install.packages('rsconnect')
library(rsconnect)
rsconnect::setAccountInfo(name='muhanyang',
                          token='E2D22499E258A2633C502C73B5CE15AE',
                          secret='Ax9HBVvOhUnxjaOzEiwLkf71yEAr9waCxrlKKZBN')
rsconnect::deployApp('/Users/muhanyang/website-using-shiny')
