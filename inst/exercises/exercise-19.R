
plot(mtcars$mpg, mtcars$disp)
mod <- lm(mpg ~ disp, data = mtcars)
coef(mod)
