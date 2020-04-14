
# Теория о матрицах

m <- matrix(1:6, nrow = 3)
dim(m)          # dim показывает размерность
dim(m) <- NULL

m
dim(m) <- c(2, 3)
m

m+5

m[2,, drop = FALSE]

colnames(m) <- paste0('col', 1:3)
rownames(m) <- paste0('row', 1:2)
m

n <- cbind(m, m+6)


apply(n, 1:2, function(x) sum(x^2))


# Склейка двух матриц

bind_diag <- function(m1, m2, fill){
  m3 <- matrix(fill,
               nrow = nrow(m1) + nrow(m2),
               ncol = ncol(m1) + ncol(m2))
  m3[1:nrow(m1), 1:ncol(m1)] <- m1
  m3[nrow(m1)+1:nrow(m2), ncol(m1) + 1:ncol(m2)] <- m2
  m3
}

m1 <- matrix(1:9, nrow = 3)
m2 <- matrix(1:25, ncol = 5)
bind_diag(m1, m2, fill = 0)


# Теория о списках

# Списки могут хранить разносортные объекты

l1 <- list(factor = 1:3, multiplier = "X2", result = matrix(2:7, nrow = 2)[1,])
is.null(l1$factor)
unlist(l1)

lapply(l1, length)

lapply(l1, paste, collapse = '->')


# List output

get_vector_with_max_sum_of_elements <- function(l){
  sum <- lapply(l, sum)
  ind <- which.max(sum)
  list(number = ind, element = l[[ind]])
}

gen_list <- function(n_elements, max_len, seed = 1){
  set.seed(seed)
  len <- sample(size = n_elements, x = 1:max_len)
  lapply(1:n_elements, function(i) rnorm(len[i]))
}
l1 <- gen_list(4, 10)
l1

output <- get_vector_with_max_sum_of_elements(l1)
output

# Data frame

new_frame <- data.frame(Value = seq(100, 200, 25), is = rep('-', 5), letter = LETTERS[1:5],
                        row.names = c("First", "Second", "Third", "Fourth", "Fifth"))
new_frame
str(new_frame)

dim(new_frame)

subset(new_frame, Value > 125)

merge(new_frame, new_frame, by = 'Value')

# Работа с датафреймом

rm(list = ls())

avian <- read.csv(file = "../../balli/Rcourse/R programming/avianHabitat.csv")
head(avian)
summary(avian)
any(!complete.cases(avian))
check_perc_range <- function(x){
  any(x < 0 | x > 100)
}
check_perc_range(avian$PDB)

names(avian)
percent_variables <- names(avian)[-(1:4)][c(T, F)]
avian$total_coverage <- rowSums(avian[,percent_variables])
avian$total_coverage
summary(avian$total_coverage)

# Работа со строками

string_1 <- c("Смелых героев трагичен конец. Выживет тот, кто сумеет акции все в портфель единый собрать",
"Пут и Колл в битве сошлись. Героев удел им помочь паритет обрести",
"Сможешь ли ключ к вратам ты найти?")
string_1

paste0(string_1, "!")

strsplit(string_1, ". ", fixed = TRUE)

grep("ероев", string_1)

install.packages("stringr")
library(stringr)
str_replace_all(string_1, "С", "S")
tolower(string_1)
toupper(string_1)

# Работа с директориями

getwd()        # выводит рабочую директори
list.files()
list.dirs(recursive = FALSE)

formatC(c(pi, exp(pi)), digits = 4, format = 'e')
cat(string_1)


# Factors

set.seed(1)
fact_1 <- factor(sample(1:100, 15, replace = TRUE))
fact_1

as.numeric(fact_1)
as.character(fact_1)
levels(fact_1)
fact_1[fact_1 == 21] <- 1
(fact_1 <- droplevels(fact_1))     # круглые скобки вызывают печать

mark <- c("poor", "bad", "satisfactory", "good", "excellent")
new_mark <- ordered(sample(mark, 16, replace = TRUE), mark)
new_mark

new_mark[new_mark >= "satisfactory"]

options(digits = 1)

set.seed(1)
rnorm(100)
cut(rnorm(100), -5:5)
table(cut(rnorm(100), -5:5))

head(warpbreaks)
tapply(warpbreaks$breaks, warpbreaks$wool, min)

# Работа с датафреймом. 2

rm(list = ls())

options(stringsAsFactors = F)
avian <- read.csv(file = "../../balli/Rcourse/R programming/avianHabitat.csv")
head(avian)
avian$Observer <- as.factor(avian$Observer)
summary(avian)
any(!complete.cases(avian))
check_perc_range <- function(x){
  any(x < 0 | x > 100)
}
check_perc_range(avian$PDB)

names(avian)
percent_variables <- names(avian)[str_detect(names(avian), "^P")]
percent_variables

avian$total_coverage <- rowSums(avian[,percent_variables])
avian$total_coverage

sapply(percent_variables, function(name) check_perc_range(avian[[name]]))

summary(avian$total_coverage)

View(avian)

avian$Site_name <- factor(str_replace(avian$Site, "[:digit:]+", ""))
tapply(avian$DBHt, avian$Site_name, mean)
