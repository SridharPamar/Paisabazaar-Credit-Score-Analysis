import pandas as pd
import numpy as np
import os

# Paths
RAW_DATA_PATH = os.path.join("..", "data_raw", "dataset.csv")
CLEANED_DATA_PATH = os.path.join("..", "data_cleaned", "cleaned_data.csv")

# Loading new raw data
df_raw = pd.read_csv(RAW_DATA_PATH)

# Checking if cleaned file exists
if os.path.exists(CLEANED_DATA_PATH):
    df_cleaned_existing = pd.read_csv(CLEANED_DATA_PATH)
    existing_ids = set(df_cleaned_existing['Customer_ID'])
    df_raw_new = df_raw[~df_raw['Customer_ID'].isin(existing_ids)]
    print(f"New records found: {df_raw_new.shape[0]}")
else:
    df_raw_new = df_raw
    print("No existing cleaned file found. Processing entire dataset.")

# Proceeding only if there is new data
if not df_raw_new.empty:
    agg_funcs = {
        'Name': 'first',
        'Age': 'median',
        'SSN': 'first',
        'Occupation': 'first',
        'Annual_Income': 'mean',
        'Monthly_Inhand_Salary': 'mean',
        'Num_Bank_Accounts': 'max',
        'Num_Credit_Card': 'max',
        'Interest_Rate': 'mean',
        'Num_of_Loan': 'sum',
        'Type_of_Loan': lambda x: x.mode()[0],
        'Delay_from_due_date': 'mean',
        'Num_of_Delayed_Payment': 'sum',
        'Changed_Credit_Limit': 'mean',
        'Num_Credit_Inquiries': 'sum',
        'Credit_Mix': lambda x: x.mode()[0],
        'Outstanding_Debt': 'mean',
        'Credit_Utilization_Ratio': 'mean',
        'Credit_History_Age': 'median',
        'Payment_of_Min_Amount': lambda x: x.mode()[0],
        'Total_EMI_per_month': 'mean',
        'Amount_invested_monthly': 'mean',
        'Payment_Behaviour': lambda x: x.mode()[0],
        'Monthly_Balance': 'mean',
        'Credit_Score': lambda x: x.mode()[0]
    }

    df_new_summary = df_raw_new.groupby('Customer_ID').agg(agg_funcs).reset_index()

    if os.path.exists(CLEANED_DATA_PATH):
        df_combined = pd.concat([df_cleaned_existing, df_new_summary], ignore_index=True)
    else:
        df_combined = df_new_summary

    # Save updated cleaned data
    df_combined.to_csv(CLEANED_DATA_PATH, index=False)
    print(f"Updated cleaned data saved to {CLEANED_DATA_PATH}")
else:
    print("No new data to clean and save.")
