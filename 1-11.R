

# Первый


help("runif")
?'hist'


# Второй


action <- cos(0)
reaction <- sin(3*pi/2)
env <- action + reaction

ls() # глобальные переменные

rnorm(20, mean = 0, sd = 1) # 20 норм. распред. чисел с м = 0, d = 1

balance <- function(action, reaction){ # создание функции
  return(action + reaction)
}

env <- balance(action, reaction)

ls()
rm(list = ls())
ls()


# Третий


v <- vector(length = 2) # создание вектора
v[1] <-  1
v[2] <-  2
v

x <- c(6:10) # вектор с использованием синтаксиса R
x

y <- c(v, 3, c(4, 5), x)
y

rep(seq(1, 3, by = 0.5), times = 3, length = 10)
#повторит последовательность от 1 до 3 с шагом 0.5, пока не станет 10 элементов


# Четвертый


hello <- "Hello World!"
hello

all.equal(0.1 + 0.05, 0.15) # правлильное сравнение чисел с плавающей точкой

# sequence of fifth and nines between 1 and 0

x <- seq(0, 1, 1/5)
y <- seq(0, 1, 1/9)
unique(sort(c(x, y))) # sort сортирует, unique удаляет повторы


# Пятый


ls()
typeof(x)

# естественное приведение logical-integer-double-character

b <-TRUE
b
as.numeric(b) # приведение

x <- c("one" = 1, "two" = 2, "four" = 4, 10, 11)
length(x)
length(x) <- 5
x
length(x) <- 10
x
names(x)
names(x) <- NULL
x
length(x) <- 3
x
sum(x) # невекторизованная функция
sqrt(x) # векторизованная функция


# Шестой


if (sqrt(3) > 1.5){
  print("Greater")
} else {
  print("Less")
}

ifelse(runif(10) > 0.5, "Орел", "Решка")

switch("синус",
       синус = sin(pi/6),
       косинус = cos(pi/2),
       0)

v <- 1:1000


# Седьмой


system.time({
  x <- 0
  for (i in v) x[i] =  sqrt(v[i])
})

print(x)
system.time({
  y <- sqrt(v)
})
print(y)

identical(x, y) # проверяет сходство
setdiff(x, y) # показывает различия


# Восьмой


.libPaths()
installed.packages()

require(grid)
grid.newpage()
grid.lines()

install.packages("xts", dependencies = TRUE) # скачает дополнительно все необходимые
library(xts)

update.packages() #обновит ВСЕ пакеты
sessionInfo()


# Девятый

rm(list = ls())

x <- seq(0, 50, by = 5)
x[] # то же что и просто х
x[4:5]
x[c(-2, -2, -7)] # 0 10 15 20 25 35 40 45 50
x[x > 5 & x < 18]

all(x > 0) # проверяет все значения х на условие
any(x > 3) # существет хотя бы одно

which (x >= 4) # указывает номера

names(x) <- x / 5
attr(x, "author") <- "me"
attributes(x)


# Десятый


# fizz-buzz

x <- 1:100
y <- 1:100
y[x %% 5 == 0] <- "buzz" # заменяет элементы кратные 5 в х на TRUE, затем заменяет в y соответствующие эл-ты на buzz
y[x %% 3 == 0] <- "fizz"
y[x %% 15 == 0] <- "fizz buzz"
y


# Одинннадцатый


x <- 2 ^ (0:10) # задал вектор из степеней двойки
x
log2(x)

set.seed(31)
x <- sample(1:100, 1e5, replace = TRUE)
x

# наибольшая разность соседей

maxdiff <- function(x){
  k = x[-1] - x[-length(x)]
  i <- which(k == max(k)) # находит все случаи, а не только первый
  print("Первый сосед: ")
  print(x[i])
  print("Второй сосед: ")
  print(x[i + 1])
  print("Разность :")
  print(max(k))
}

maxdiff(x)
