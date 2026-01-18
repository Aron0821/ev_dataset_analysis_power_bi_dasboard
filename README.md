# ⚡ EV Data Analysis Dashboard

<p align="center">
  <img src="image/final_dashboard.png" width="900" alt="EV Data Analysis Dashboard"/>
</p>

## 📌 Project Overview

The **EV Data Analysis Dashboard** is an interactive Business Intelligence (BI) solution built using **Power BI** to analyze trends in Electric Vehicle (EV) adoption.  
This dashboard provides insights into EV growth over time, manufacturer dominance, EV type distribution, city-wise adoption, and the relationship between actual and predicted electric ranges.

The project is designed as a **data-driven decision support system**, enabling users to explore EV data dynamically using slicers and visual interactions.

---

## 🎯 Objectives

- Analyze **Electric Vehicle growth trends** over the years  
- Identify **top EV manufacturers**  
- Visualize **EV type distribution** (BEV vs PHEV)  
- Understand **city-wise and state-wise EV adoption**  
- Compare **actual vs predicted electric ranges**  
- Enable **interactive filtering** across all visuals using slicers  

---

## 🧩 Key Features

- 📊 Interactive Power BI dashboard  
- 🔁 Fully connected slicers (EV Type, Model Year, Make, State)  
- 🗺️ Geographic visualization using maps  
- 📈 Trend analysis with line and scatter charts  
- 🧠 Prediction comparison for EV range analysis  

---

## 🛠️ Tools & Technologies

- **Power BI Desktop**
- **PostgreSQL** (Data Source)
- **SQL** (Data modeling & transformations)
- **DAX** (Measures & calculations)
- **GitHub** (Version control & documentation)

---

## 📂 Data Model Overview

The project follows a **star-schema-based data model**, including:

### Fact Tables
- `ev_yearly_growth`
- `ev_make_share`
- `ev_type_distribution`
- `ev_city_distribution`
- `ev_range_prediction`

### Dimension Tables
- `dim_model_year`
- `dim_make`
- `dim_ev_type`
- `dim_state`

All slicers are connected through dimension tables to ensure **cross-filtering across all visuals**.

---

## 📈 Dashboard Insights

- EV adoption has shown **rapid growth in recent years**
- **Battery Electric Vehicles (BEV)** dominate the market
- A few manufacturers account for a large market share
- Urban regions show higher EV adoption
- Predicted electric ranges closely align with actual values

---

## 🚀 How to Use

1. Open the Power BI dashboard
2. Use slicers to filter by:
   - EV Type
   - Model Year
   - Manufacturer
   - State
3. Observe how all visuals update dynamically
4. Explore insights across charts, maps, and trend lines

---

## 📌 Project Status

✅ Completed  
📊 Ready for academic submission and portfolio showcase  

---

## 👤 Author

**Aron Shakha**  
Final Year Project  
Electric Vehicle Data Analysis using Power BI

---

## 📄 License

This project is created for **academic and learning purposes**.
