# Step 1: Load required libraries
library(bkmr)
library(ggplot2)
library(readxl)

# Step 2: Load dataset
data <- read_excel("Combination TM and EM.xlsx")

# Step 3: Define response variable and exposures
# Response: Preeclampsia (binary outcome)
# Exposures: Heavy metals (Copper, Selenium, Molybdenum, Manganese, Cobalt)
y <- data$Preeclampsia
Z <- as.matrix(data[, c("Copper", "Selenium", "Molybednum", "Manganese", "Cobalt")])

# Step 4: Handle missing values by replacing with median of each column
Z[is.na(Z)] <- apply(Z, 2, median, na.rm = TRUE)

# Step 5: Log-transform exposures to reduce skewness (add constant to avoid log(0))
Z <- log(Z + 0.01)   # 0.01 ensures positivity

# Step 6: Fit the BKMR model
set.seed(123)
fit <- kmbayes(y = y, Z = Z, iter = 5000, verbose = FALSE, varsel = TRUE)

# Step 7: Define exposure pairs for bivariate interaction analysis as there are 25 graoh with 20 graph which are distinct each two values represent a pair
# For example 1,2 pair represent Copper(1) with Selenium(2)  and the next pair 1,3 reresent graph between copper(1) and Molybdenum(3)
z.pairs <- matrix(
  c(1, 2, 1, 3, 1, 4, 1, 5,
    2, 1, 2, 3, 2, 4, 2, 5,
    3, 1, 3, 2, 3, 4, 3, 5,
    4, 1, 4, 2, 4, 3, 4, 5,
    5, 1, 5, 2, 5, 3, 5, 4),
  nrow = 20, byrow = TRUE
)

# Step 8: Compute bivariate predictor-response functions
pred.resp.bivar <- PredictorResponseBivar(fit = fit, Z = Z, z.pairs = z.pairs, method = "approx")

# Step 9: Calculate responses at specific quantiles (25th, 50th, 75th percentiles)
pred.resp.bivar.levels <- PredictorResponseBivarLevels(
  pred.resp.df = pred.resp.bivar, Z = Z, qs = c(0.25, 0.50, 0.75)
)

# Step 10: Clean results by removing invalid rows (NA, Inf, -Inf)
pred.resp.bivar.levels <- pred.resp.bivar.levels[
  !is.na(pred.resp.bivar.levels$est) &
  !is.na(pred.resp.bivar.levels$z1) &
  !is.infinite(pred.resp.bivar.levels$est) &
  !is.infinite(pred.resp.bivar.levels$z1),
]

# Step 11: Plot bivariate exposure-response functions
ggplot(pred.resp.bivar.levels, aes(z1, est, color = quantile, group = quantile)) +
  geom_line(linewidth = 1) +
  facet_grid(variable2 ~ variable1) +
  labs(
    x = "Exposure 1",
    y = "Estimated Response",
    color = "Quantile",
    title = "h(exposure1 | quantiles of exposure2)"
  )
