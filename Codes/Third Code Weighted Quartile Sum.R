#STEP1: Load required libraries
library(readxl)
library(gWQS)
library(ggplot2)
# Step 2: Read data and define mixture components

data <- read_excel("C:\\Desktop\\EM_New.xlsx")
> metals <- c("Copper", "Selenium", "Molybednum", "Manganese", "Cobalt","Age",
+ "BMI")
# Step 3: Fit the WQS regression model
 wqs <- gwqs(Preeclampsia ~ wqs,mix_name = metals,
            data = data,
            q = 10, 
            validation = 0.6, 
            b = 100,  # Increased bootstrap samples
            b1_pos = TRUE, 
            rh = 100, 
            family = "gaussian", 
            seed = 2016)
# Step 4: Summarize model and extract final weights
summary(wqs)
wqs$final_weights

# Step 5: Prepare weights dataframe for plotting
# Update your weights_data to include all 7 components
weights_data <- data.frame(
  chemical = c("Copper", "Age", "BMI", "Manganese", "Selenium", "Cobalt", "Molybednum"),
  weight = c(0.7592820, 0.1142811, 0.0662428, 0.0466387, 0.0134661, 0.0000892, 0.0000001)
)

# STEP6:
# Create a colorful barplot with custom x-axis range and 7 colors
ggplot(weights_data, aes(x = weight, y = reorder(chemical, weight))) +
  geom_bar(stat = "identity", 
          fill = c("#9966CC", "#FF9933", "#33CC99", "#56B4E9", "#009E73", "#F0E442", "#CC79A7")) +
  geom_vline(xintercept = 0.2, linetype = "dashed", color = "red", size = 0.8) +  # Add red dashed line
  theme_minimal() +
  xlim(0, 1.0) +  # Set x-axis limit to accommodate the largest weight
  labs(x = "Weights",
       y = "",
       title = "Heavy Metals and Covariates WQS Weights") +
  theme(panel.grid.major = element_line(color = "gray90"),
        panel.grid.minor = element_line(color = "gray95"),
        panel.border = element_rect(fill = NA, color = "gray90"),
        plot.title = element_text(hjust = 0.5, face = "bold"),
        axis.text = element_text(size = 10),
        axis.title.x = element_text(size = 12, face = "bold"))



