####
#### Vector lengths and angles.
####

## Example vectors.
x <- c(2, -1, 1)
y <- c(3, 0, 1)

## Arithmetic.
2 * x
x + y

## Lengths.
L_x <- sqrt(sum(x ^ 2))
L_x <- sqrt(t(x) %*% x)
L_y <- sqrt(t(y) %*% y)

L_2x <- sqrt(t(2 * x) %*% (2 * x))
L_2x <- 2 * L_x

## Angle.
theta <- acos((t(x) %*% y) / (L_x * L_y)) * 360 / (2 * pi)

## Linear independence.
x_1 <- c(2, -1, 1)
x_2 <- c(3, 0, 1)
x_3 <- c(1, 0, 2)

solve(cbind(x_1, x_2, x_3), rep(0, 3))
solve(cbind(x_1, x_2, x_1 - 0.5 * x_2), rep(0, 3))

####
#### Matrix operations.
####

## Example matrices and vectors.
A <- matrix(c(2, 0, 4, 3, -2, 1), nrow = 3)
B <- matrix(c(-1, 3, 2, 5), nrow = 2)
u <- c(-3, 5)
v <- c(1, -2, 3)

## Transpose.
t(A)

## Arithmetic.
2 * A
A + A

AB <- A %*% B
AB[1, 2]
A[1, ] %*% B[, 2]

A %*% u
t(v) %*% A
v %*% t(u)
t(v) %*% A %*% u

## Identity.
Id <- diag(2)
Id %*% B
B %*% Id

## Inverse.
BI <- solve(B)
round(BI %*% B)
round(B %*% BI)

solve(diag(rep(10, 3)))

## Orthogonality.
Q <- (1 / sqrt(2)) * matrix(c(1, 1, 1, -1), nrow = 2)
Q %*% t(Q)
t(Q) %*% Q

##
## Eigenvalues and eigenvectors.
##

A <- matrix(c(2, 1, 1, 2), nrow = 2)

## Using R's built-in 'eigen' function.
ee <- eigen(A)

A %*% ee$vectors[, 1]
ee$values[1] * ee$vectors[, 1]

A %*% ee$vectors[, 2]
ee$values[2] * ee$vectors[, 2]

t(ee$vectors) %*% ee$vectors

## Using characteristic equation (see Supplement 2A in textbook). The determinant of 
## A - lambda I is lambda^2 - 4lambda + 3, with roots (eigenvalues) 3 and 1.
lambda <- (4 + c(1, -1) * sqrt(16 - 12)) / 2

## Solving A x = lambda x for eigenvectors x_1 and x_2, we have the two systems of 
## linear equations:
##
##   -x_11 + x_21 = 0
##   x_11 - x_21 = 0
##
## and
##
##   x_12 + x_22 = 0
##   x_12 + x_22 = 0
##
## Both have many solutions. Arbitrarily setting x_11 = x_12 = 1, we have x_21 = 1 and 
## x_22 = -1. Normalizing to unit length, we have e_1' = [1 / sqrt(2), 1 / sqrt(2)] and 
## e_2' = [1 / sqrt(2), -1 / sqrt(2)]. Note that the signs of the second eigenvector are 
## switched relative to the output of 'eigen'. This is not a problem. Both definitions
## satisfy the relationship Ax = lambda x.
e_1 <- (1 / sqrt(2)) * c(1, 1)
e_2 <- (1 / sqrt(2)) * c(1, -1)

A %*% e_1
lambda[1] * e_1

A %*% e_2
lambda[2] * e_2

## Positive definiteness.
A <- matrix(c(1, -1, -1, 4), nrow = 2)
ee <- eigen(A)
all(ee$values > 0)

P <- ee$vectors
Lambda <- diag(ee$values)
P %*% Lambda %*% t(P)



