import pandas as pd
import numpy as np
from datetime import datetime, timedelta

np.random.seed(42)

rows = 20000

cities = ["Hyderabad", "Bangalore", "Mumbai", "Chennai", "Vizag"]
genders = ["Male", "Female"]

data = []

for i in range(rows):

    customer_id = 100001 + i

    age = np.random.randint(18, 70)

    gender = np.random.choice(genders)

    city = np.random.choice(
        cities,
        p=[0.25, 0.25, 0.20, 0.15, 0.15]
    )

    # Income based on city
    if city == "Bangalore":
        income = np.random.randint(40000, 200000)

    elif city == "Mumbai":
        income = np.random.randint(40000, 250000)

    elif city == "Hyderabad":
        income = np.random.randint(30000, 180000)

    elif city == "Chennai":
        income = np.random.randint(30000, 170000)

    else:  # Vizag
        income = np.random.randint(20000, 120000)

    # Balance depends on income
    balance = int(income * np.random.uniform(2, 8))

    # Account Type
    if income > 100000:
        account_type = np.random.choice(
            ["Savings", "Current"],
            p=[0.6, 0.4]
        )
    else:
        account_type = np.random.choice(
            ["Savings", "Current"],
            p=[0.9, 0.1]
        )

    # Credit Score based on age
    if age < 25:
        credit_score = np.random.randint(500, 701)

    elif age <= 55:
        credit_score = np.random.randint(650, 851)

    else:
        credit_score = np.random.randint(550, 801)

    # Loan Amount based on income
    loan_amount = int(income * np.random.uniform(5, 25))

    # Loan Status
    loan_status = np.random.choice(
        ["Active", "Closed", "No Loan"],
        p=[0.4, 0.3, 0.3]
    )

    # Transactions depend on balance
    transaction_count = int(
        np.random.uniform(5, 20) +
        (balance / 100000) * np.random.uniform(2, 10)
    )

    transaction_count = min(transaction_count, 100)

    transaction_value = int(
        transaction_count *
        np.random.uniform(500, 5000)
    )

    # Customer Since Date
    start_date = datetime(2015, 1, 1)
    end_date = datetime(2025, 1, 1)

    random_days = np.random.randint(
        0,
        (end_date - start_date).days
    )

    customer_since = (
        start_date + timedelta(days=random_days)
    ).date()

    # Churn Risk
    if credit_score < 600:
        churn_risk = "High"

    elif credit_score < 750:
        churn_risk = "Medium"

    else:
        churn_risk = "Low"

    # Quality Score (1-10)
    quality_score = (
        (balance / 100000) * 4 +
        (transaction_count / 100) * 3 +
        (credit_score / 900) * 3
    )

    quality_score = round(
        min(max(quality_score, 1), 10),
        2
    )

    # Fraud Flag
    if (
        transaction_count > 80
        and balance < 10000
        and credit_score < 550
    ):
        fraud_flag = "Yes"
    else:
        fraud_flag = "No"

    data.append([
        customer_id,
        age,
        gender,
        city,
        income,
        balance,
        credit_score,
        account_type,
        loan_amount,
        loan_status,
        transaction_count,
        transaction_value,
        customer_since,
        quality_score,
        churn_risk,
        fraud_flag
    ])

columns = [
    "Customer_ID",
    "Age",
    "Gender",
    "City",
    "Monthly_Income",
    "Balance",
    "Credit_Score",
    "Account_Type",
    "Loan_Amount",
    "Loan_Status",
    "Transaction_Count",
    "Transaction_Value",
    "Customer_Since",
    "Quality_Score",
    "Churn_Risk",
    "Fraud_Flag"
]

df = pd.DataFrame(data, columns=columns)

# Add some missing values (realistic dirty data)
for col in ["Credit_Score", "Balance", "Monthly_Income"]:
    df.loc[
        df.sample(frac=0.01).index,
        col
    ] = np.nan

# Add duplicates
duplicates = df.sample(100)
df = pd.concat([df, duplicates])

# Save CSV
df.to_csv("banking_customer_data.csv", index=False)

print(df.head())
print("\nDataset Shape:", df.shape)