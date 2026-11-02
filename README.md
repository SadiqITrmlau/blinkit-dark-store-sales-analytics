<div align="center">

<!-- Animated Typing Title (Blinkit Green Color) -->
<a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.herokuapp.com?font=Segoe+UI&weight=700&size=36&duration=2500&pause=500&color=0C831F&center=true&vCenter=true&width=800&lines=Blinkit+Dark+Store+Analytics;Solving+10-Minute+Delivery+Delays;End-to-End+Data+Project" alt="Typing SVG" /></a>

**A Data Analysis Project to track Service Level Agreement (SLA) breaches and operational delays in quick commerce.**

<!-- Blinkit Theme Colored Tech Badges -->
![Python](https://img.shields.io/badge/Python-0C831F?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-F8CD15?style=for-the-badge&logo=mysql&logoColor=black)
![Power BI](https://img.shields.io/badge/Power_BI-0C831F?style=for-the-badge&logo=powerbi&logoColor=white)

</div>

---

### 📦 About This Project
Blinkit promises to deliver groceries in 10 minutes. However, during busy evening hours, some orders take too long. 

The goal of this project is to act as a **Data Analyst** to find out *why* these delays happen. I created a fake dataset of 10,000+ orders, put it into a MySQL database, and built a Power BI dashboard to find the main problem. 

Does the delivery rider take too much time on the road? Or does the store team take too long to pack the bag? This project finds the answer.

---

### 🛠️ Tools & Skills Used
* **Data Generation:** Python (`Faker` library) to create realistic store data.
* **Database Management:** MySQL (Used CTEs, Window Functions, and Joins).
* **Data Visualization:** Power BI (Data Modeling, DAX measures, and Conditional Formatting).

---

### 💡 Key Discoveries (The "Aha!" Moment)
After analyzing the data, I found three main things:
1. 🔴 **The Problem Time:** Most SLA breaches (delays over 10 minutes) happen between **7:00 PM and 9:00 PM**.
2. 🔍 **The Root Cause:** During these hours, the rider's travel time is normal. But the **Pick & Pack time inside the store doubles**.
3. ✅ **The Solution:** Blinkit needs to add more warehouse staff between 7 PM and 9 PM to pack bags faster.

---

### 📊 Dashboard Preview
*(A complete view of the Power BI Dashboard showing the Matrix Heatmap and KPIs)*

<div align="center">
  
  <!-- NOTE: Replace the link below with your actual dashboard image link or a GIF of you clicking the dashboard! -->
  <img src="Blinkit_Dashboard.png" alt="Blinkit Power BI Dashboard" width="850"/>

</div>

> **Pro Tip:** Want to make this even better? Record a 10-second GIF of your screen clicking the filters on your Power BI dashboard and replace the image above with that GIF!

---

### 🚀 How to Run This Project
If you want to view my code, follow these simple steps:
1. Open the `SQL_Queries` folder to see my 4 main SQL files (Schema setup, CTEs, Window Functions, and Joins).
2. Download the `.pbix` file to interact with the Power BI dashboard.
3. Check the `Python_Script` folder to see how I generated the mock dataset.

<br>

<div align="center">
  <p><b>Built with 💛 and 💚 for Data Analytics</b></p>
  <a href="https://www.linkedin.com/in/sadiq-khan-it/"><img src="https://img.shields.io/badge/LinkedIn-Connect-0C831F?style=for-the-badge&logo=linkedin"/></a>
</div>
