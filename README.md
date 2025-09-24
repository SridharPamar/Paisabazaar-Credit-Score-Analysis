# 📊 Paisabazaar Credit Score Analysis with ETL Pipeline

## 🧠 Objective

The objective of this project is to perform comprehensive **Exploratory Data Analysis (EDA)** on a customer credit dataset to uncover key trends in demographics, credit behavior, and financial risk indicators. Additionally, an automated **ETL pipeline** is built to ingest, clean, and load data into PostgreSQL, and update the Power BI dashboard seamlessly.

---

## 🗂️ Folder Structure

```
PAISABAZAAR-DASHBOARD/
│
├── dashboard/                  # Power BI Dashboard files
│   └── Power_BI_Dashboard.pbix
│
├── dashboard_snaps/           # PNG/JPG images of Power BI dashboard insights
│   └── Customer Demographics & Credit Score Overview.png
│   └── Loan & Credit Behavior.png
│
├── data_cleaned/              # Final cleaned dataset
│   └── cleaned_data.csv
│
├── data_raw/                  # Incoming raw dataset
│   └── dataset.csv
│
├── env/                       # Environment folder (excluded via .gitignore)
│
├── etl_pipeline/              # Scripts to automate data flow
│   ├── fetch_new_data.py
│   ├── upload_to_postgres.py
│   └── run_pipeline.py
│
├── notebook/                  # Jupyter Notebooks for EDA & testing
│   ├── data_cleaning_notebook.ipynb
│   └── postgresql_upload.ipynb
│
├── sql_queries/               # SQL queries used in Power BI
│   └── *.sql
│
├── .gitignore
├── requirements.txt
└── README.md
```

---

## ⚙️ ETL Pipeline Overview

The automated ETL process follows this flow:

1. **Raw Data Upload**  
   Place the new dataset in `data_raw/dataset.csv`.

2. **Run ETL Pipeline**  
   The script performs data cleaning, deduplication, and stores clean data in `data_cleaned/cleaned_data.csv`.

3. **Upload to PostgreSQL**  
   Cleaned data is pushed to the database (`Credit_Score_Analysis`).

4. **Power BI Refresh**  
   Power BI fetches updated records from PostgreSQL.

### ▶️ Run the full pipeline:

```bash
python etl_pipeline/run_pipeline.py
```

---

## 🧰 Tech Stack

- **Python**: For scripting ETL and automation
- **PostgreSQL**: Data storage and integration with Power BI
- **Power BI**: For creating insightful dashboards
- **Jupyter Notebook**: EDA and script development
- **.env**: For storing DB credentials (excluded via `.gitignore`)

---

## 📊 Customer Demographics & Credit Score Overview Dashboard

### 🔹 1. KPI Cards

**Metrics Displayed:**

- Average Annual Income: ₹38.09K  
- Total Credit Inquiries: 580K  
- Avg Credit Cards: 5  
- Total Customers: 13K  

📌 **Insights:**

- Customers show **moderate annual income** and **high credit inquiry activity**.  
- Average of 5 credit cards per customer indicates **moderate-to-heavy credit usage**.

✅ **Recommendations:**

- Monitor credit inquiries per customer to flag **potential over-leveraging**.  
- Offer **credit education** to help customers manage inquiries and improve eligibility.

---

### 🔹 2. Credit Score vs Annual Income

📌 **Insights:**

- Customers with **Good credit score** have the **highest annual income** (₹46K).  
- Income drops progressively for Standard (₹37K) and Poor (₹32K) score groups.

✅ **Recommendations:**

- Design **income-based customer segmentation strategies**.  
- Use this insight to **predict credit risk** based on income brackets for new applicants.

---

### 🔹 3. Distribution of Credit Score

📌 **Insights:**

- **Standard**: 46.66%  
- **Poor**: 33.3%  
- **Good**: 20.05%  

The majority of customers fall under the **Standard** and **Poor** categories, indicating a moderate-to-high credit risk base.

✅ **Recommendations:**

- Prioritize **credit improvement programs** for **Poor** and **Standard** segments.  
- Design **financial literacy initiatives** to support upward credit movement.  
- Retain **Good credit customers** while converting others gradually.

---

### 🔹 4. Credit Utilization Ratio vs Credit Score 

📌 **Insights:**

- Good: 32.7%  
- Standard: 32.3%  
- Poor: 31.9%  

Utilization ratios are quite close across all score groups.

✅ **Recommendations:**

- Explore other differentiators like **delayed payments** or **credit inquiries**.  
- Educate customers to keep utilization **below 30%** to boost scores.

---

### 🔹 5. Top 10 Occupations with Highest Good Credit Score

📌 **Insights:**

- **Engineers, Journalists, Architects, and Developers** have the most Good scores.  
- However, even these occupations have many in Standard or Poor segments.

✅ **Recommendations:**

- Offer **custom credit solutions** to professions with better history.  
- Study deeper **within-occupation credit habits** for risk targeting.

---

### 🔹 6. Credit Score Across Age Groups 

📌 **Insights:**

- **Senior Adults (45–56)** have the most **Good scores**.  
- **Young Adults (25–34)** and **Young (14–24)** have the most **Poor scores**.

✅ **Recommendations:**

- Create **starter credit tools** for younger age groups.  
- Launch **credit awareness drives** in schools and early careers.  
- Build **track-your-score tools** for youth and partner with employers.

---

## 💳 Loan & Credit Behavior Dashboard

### 🔹 1. KPI Cards

**Metrics Displayed:**

- High Risk Customers: 33%  
- Total Credit Inquiries: 580K  
- Avg Days Delay in Payment: 21.08  
- % Paying Minimum Amount: 59%  

📌 **Insights:**

- One-third are **high risk**.  
- Over half pay only the **minimum amount**, showing bad behavior.  
- Delays exceed **21 days**, signaling financial strain.

✅ **Recommendations:**

- Track **repeat defaulters** closely.  
- Educate on **real cost of minimum payments**.  
- Add **payment reminders & reward systems**.

---

### 🔹 2. Total Credit Inquiries vs Credit Score

📌 **Insights:**

- **Poor score** group: 274K inquiries  
- **Standard**: 241K  
- **Good**: 64K  

Higher inquiries reduce credit scores.

✅ **Recommendations:**

- Raise **flags on frequent inquiries**.  
- Teach users how **inquiries hurt scores**.

---

### 🔹 3. Avg Delayed Payments vs Credit Score

📌 **Insights:**

- **Poor credit** users delay payments the most.  
- **Good score** users delay the least.

✅ **Recommendations:**

- Provide **EMI plans**, **payment alerts**, or **credit counseling**.  
- Use delays as part of **credit risk scoring**.

---

### 🔹 4. Number of Credit Cards vs Credit Score

📌 **Insights:**

- **Poor**: ~7 cards  
- **Standard**: ~5  
- **Good**: ~4  

More cards usually mean **lower scores**.

✅ **Recommendations:**

- Review limits for people with **5+ cards**.  
- Provide **credit consolidation options** for risky users.

---

### 🔹 5. Avg Monthly Balance vs Credit Score

📌 **Insights:**

- **Good** score users maintain ₹413 avg.  
- **Poor** score users have ₹292 avg.

✅ **Recommendations:**

- Suggest **auto-savings features** for lower score groups.  
- Reward customers who **maintain higher balances**.

---

## 📝 Environment Configuration

Store DB credentials in a `.env` file (excluded from Git using `.gitignore`):

```
DB_USER=your_username
DB_PASS=your_password
DB_HOST=localhost
DB_PORT=5432
DB_NAME=Credit_Score_Analysis
```

---

## ✅ How to Run the ETL Pipeline

1. Place your raw file in `data_raw/dataset.csv`
2. Make sure `.env` is configured with DB credentials
3. Run the pipeline:

```bash
python etl_pipeline/run_pipeline.py
```

4. Open Power BI and click **Refresh** to view updated dashboards

---

## 📷 Dashboard Snapshots

Visual references can be found in the `/dashboard_snaps/` folder:

- `Customer Demographics & Credit Score Overview.png`
- `Loan & Credit Behavior.png`

---


## 👨‍💻 Author

**Vishnu B** — [GitHub Profile](https://github.com/bvishnub)
