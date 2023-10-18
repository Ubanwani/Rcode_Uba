# dframe
mydata <- data.frame(
  person = c("Stan", "Francine", "Steve", "Roger", "Hayley", "Klaus"),
  sex = factor(c("M", "F", "M", "M", "F", "M")),
  funny = factor(c("High", "Med", "Low", "High", "Med", "Med"))
)

mydata$person

age <- c(41, 41, 15, 1600, 21, 60)
mydata <- cbind(mydata, age)
