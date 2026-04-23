# 🍕 Analysing Food Delivery Data Using R

> A data analysis project exploring food delivery operational metrics using R, ggplot2, and dplyr — built as part of Project Based Learning on R.

---

## 📌 Project Overview

Online food delivery platforms generate massive amounts of operational and customer data every day. This project analyses a real-world food delivery dataset (37,231 records) to uncover patterns in delivery performance, customer satisfaction, and traffic impact using R programming.

**Author:** S. Laharika  
**Roll No:** 23EG110C55  
**Course:** B.Tech (CSE-DS)

---

## 🎯 Objectives

- Analyse food delivery data using R programming
- Study delivery time distribution across orders
- Evaluate customer ratings and satisfaction trends
- Analyse the impact of road traffic density on delivery time
- Compare delivery performance across cities and delivery person age groups

---

## 📂 Dataset Description

| Feature | Description |
|--------|-------------|
| `Delivery_person_Age` | Age of the delivery executive |
| `Delivery_person_Ratings` | Customer rating given to the delivery person |
| `Time_taken_min` | Time (in minutes) taken to complete the delivery |
| `Road_traffic_density` | Traffic level (Low / Medium / High / Jam) |
| `Weather_conditions` | Weather at time of delivery |
| `City` | Type of city (Urban / Metropolitian / Semi-Urban) |
| `multiple_deliveries` | Number of orders handled in a single trip |

**Total Records:** 37,231 delivery entries

---

## 🛠️ Tools & Libraries

| Tool | Purpose |
|------|---------|
| **R / RStudio** | Core programming environment |
| **ggplot2** | Data visualisation (histograms, boxplots, pie charts, bar charts, line graphs) |
| **dplyr** | Data manipulation and transformation |

---

## 📊 Visualisations Produced

1. **Delivery Time Distribution** — Histogram showing frequency of delivery durations
2. **Delivery Person Ratings Distribution** — Distribution of ratings given by customers
3. **Orders by Road Traffic Density** — Pie chart of order share across traffic levels
4. **Multiple Deliveries Distribution** — Distribution of simultaneous delivery counts
5. **Average Ratings by City** — City-wise comparison of average delivery ratings
6. **Ratings by Age Group** — Boxplot comparing ratings across delivery person age groups

---

## 🚀 How to Run

### Prerequisites

Make sure you have R and RStudio installed:
- [Download R](https://cran.r-project.org/)
- [Download RStudio](https://posit.co/download/rstudio-desktop/)

### Steps

```r
# 1. Install required packages (run once)
install.packages("ggplot2")
install.packages("dplyr")

# 2. Load libraries
library(ggplot2)
library(dplyr)

# 3. Open project_r.R in RStudio

# 4. Run the script — a file picker will open to select your CSV dataset
# Select your food delivery CSV file when prompted
zomato_data <- read.csv(file.choose())
```

> 💡 The dataset used is a Zomato/food delivery CSV. You can use the [Food Delivery Dataset from Kaggle](https://www.kaggle.com/datasets/gauravmalik26/food-delivery-dataset).

---

## 📁 Project Structure

```
food-delivery-analysis-r/
│
├── project_r.R                              # Main R analysis script
├── README.md                                # Project documentation
├── ANALYSING_FOOD_DELIVERY_DATA_USING_R.pptx  # Presentation slides
└── data/
    └── food_delivery_data.csv               # Dataset (add manually)
```

---

## 📈 Key Findings

- Most deliveries are completed within **20–35 minutes**
- Customer ratings are generally **high (above 4.5)**
- **Traffic density significantly affects** delivery time
- **Urban areas** show slightly better delivery performance
- Delivery performance is **consistent across all age groups**

---

## 📜 License

This project is submitted for academic purposes under B.Tech (CSE-DS). Feel free to use and reference with attribution.

---

## 🙏 Acknowledgements

- Dataset sourced from publicly available food delivery data
- R Community and CRAN package authors for ggplot2 and dplyr
