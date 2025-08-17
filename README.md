BKMR Analysis on Medical Data
This repository demonstrates the application of Bayesian Kernel Machine Regression (BKMR) for medical data analysis using R programming.

We focus on studying the impact of heavy metal concentrations in blood on disease outcomes (preeclampsia: coded as 1 = positive, 0 = negative). BKMR is particularly useful for analyzing multi-exposure mixtures and identifying non-linear and interactive effects.

The project was inspired by the research paper "Associations of Mixed Metal Exposure with Chronic Kidney Disease from NHANES 2011–2018" (Nature Journal), which discussed the theory but did not provide a practical implementation. Here, we attempt to bridge that gap with code and reproducible analysis.

📂 Dataset
The repository includes the Excel file used for the analysis.

⚠️ Note on Privacy:
The dataset provided only contains the structure (column names, headers, and formatting) but no real values. This is done intentionally to protect sensitive medical information.

📊 Analysis Overview
Blood Metal Mixture – Total Population: Initial BKMR model analyzing heavy metal mixture exposure in the total study population.

Bivariate Analysis: It also Demonstrates the interaction plot of the BKMR model. Explores how blood metal mixture exposures jointly influence disease risk at different quartiles.

Weighted Quantile Sum (WQS) Regression: An extension including age and BMI alongside heavy metals. It allows comparison of WQS with BKMR for mixture analysis.


