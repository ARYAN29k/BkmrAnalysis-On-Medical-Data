BKMR Analysis on Medical Data
This repository demonstrates the application of Bayesian Kernel Machine Regression (BKMR) for medical data analysis using R programming.

We focus on studying the impact of heavy metal concentrations in blood on disease outcomes (preeclampsia: coded as 1 = positive, 0 = negative). BKMR is particularly useful for analyzing multi-exposure mixtures and identifying non-linear and interactive effects.

The project was inspired by the research paper "Associations of Mixed Metal Exposure with Chronic Kidney Disease from NHANES 2011–2018" (Nature Journal), which discussed the theory but did not provide a practical implementation. Here, we attempt to bridge that gap with code and reproducible analysis.

📂 Dataset
The repository includes the Excel file used for the analysis.


⚠️ Note on Privacy:
The dataset provided only contains the structure (column names, headers, and formatting) but no real values. This is done intentionally to protect sensitive medical information.

📊 Analysis Overview

Code1: Blood Metal Mixture – Total Population: Initial BKMR model analyzing heavy metal mixture exposure in the total study population.

![First Code Univariate](https://github.com/user-attachments/assets/9ee89da1-80c4-4086-8a69-495c829a7998)

Code2: Bivariate Analysis: It also Demonstrates the interaction plot of the BKMR model. Explores how blood metal mixture exposures jointly influence disease risk at different quartiles.

![Second Code Bivariate](https://github.com/user-attachments/assets/55049275-eb1c-43ca-8fa2-88109a495c31)

Code3: Weighted Quantile Sum (WQS) Regression: An extension including age and BMI alongside heavy metals. It allows comparison of WQS with BKMR for mixture analysis.

![Third Code Weighted Quartile Sum](https://github.com/user-attachments/assets/28ccdb67-b6e0-441f-9543-b63c0c778cc1)


Requirements:
# Install required packages (run this once)
install.packages(c("readxl", "gWQS", "ggplot2", "bkmr"))




