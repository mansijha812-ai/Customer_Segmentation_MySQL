-- Customer Value Segmentation
SELECT 
    Customer_ID,
    average_balance,
    total_transactions,
    balance_score,
    transaction_score,
    final_score,
    CASE 
        WHEN final_score >= 60 THEN 'High Value'
        WHEN final_score >= 30 THEN 'Medium Value' 
        ELSE 'Low Value'
    END AS customer_segment
FROM (
    SELECT 
        Customer_ID,
        AVG(Total_Balance) AS average_balance,
        SUM(Transaction_Amount) AS total_transactions,
        ROUND(((AVG(Total_Balance) - 1000) / (99993 - 1000)) * 100, 2) AS balance_score,
        ROUND(((SUM(Transaction_Amount) - 50) / (24607 - 50)) * 100, 2) AS transaction_score,
        ROUND((((AVG(Total_Balance) - 1000) / (99993 - 1000)) * 100 + 
               ((SUM(Transaction_Amount) - 50) / (24607 - 50)) * 100) / 2, 2) AS final_score
    FROM transaction_data
    GROUP BY Customer_ID
) AS customer_scores;

-- Investment Preferences by Age and Account Type
SELECT 
    Account_Type,
    CASE 
        WHEN Age BETWEEN 18 AND 35 THEN 'Young (18-35)'
        WHEN Age BETWEEN 36 AND 55 THEN 'Middle-aged (36-55)'
        WHEN Age >= 56 THEN 'Senior (56+)'
        ELSE 'Unknown'
    END AS age_group,
    Investment_Type,
    COUNT(*) as number_of_transactions
FROM transaction_data
GROUP BY Account_Type, age_group, Investment_Type
ORDER BY Account_Type, age_group, Investment_Type;

-- Customer Churn Risk Assessment
SELECT 
    Customer_ID,
    AVG(Total_Balance) as average_balance,
    COUNT(*) as transaction_count,
    SUM(Transaction_Amount) as total_transaction_amount,
    CASE 
        WHEN AVG(Total_Balance) < 5000 AND COUNT(*) = 1 THEN 'Very High Risk'
        WHEN AVG(Total_Balance) < 10000 AND COUNT(*) <= 2 THEN 'High Risk'
        WHEN AVG(Total_Balance) < 20000 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS churn_risk
FROM transaction_data
GROUP BY Customer_ID
ORDER BY 
    CASE 
        WHEN churn_risk = 'Very High Risk' THEN 1
        WHEN churn_risk = 'High Risk' THEN 2
        WHEN churn_risk = 'Medium Risk' THEN 3
        ELSE 4
    END,
    average_balance ASC;
