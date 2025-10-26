**Customer Segmentation SQL Project**

I analyzed bank customer data to solve three key business questions:
1. Who are our most valuable customers and how should we segment them for targeted strategies?
2. How do investment preferences vary across different customer demographics and account types?
3. Which customers are at highest risk of leaving and need retention efforts?

**WHAT I BUILT:**
- Customer value scoring system (High/Medium/Low segments)
- Investment behavior analysis across age groups
- Churn risk identification model


**ANALYTICAL FRAMEWORK:**

**A. CUSTOMER SEGMENTATION ANALYSIS**

Methodology: Multi-dimensional scoring system

Balance Score (50% weight): Normalized account balances (0-100 scale)

Transaction Score (50% weight): Normalized transaction activity (0-100 scale)

Final Score: Weighted average of both metrics

**Key Findings:**

High Value (≥60 score): 46 customers (0.73%)

Medium Value (30-59 score): 3,735 customers (58.96%)

Low Value (<30 score): 2,554 customers (40.32%)

Business Implication: Extreme Pareto distribution - 99%+ of value from <1% of customers

**B. INVESTMENT BEHAVIOR ANALYSIS**

Methodology: Multi-dimensional cohort analysis

Age Segmentation: Young (18-35), Middle-aged (36-55), Senior (56+)

Account Types: Savings, Current, Business

Investment Products: Fixed Deposit, Recurring Deposit, Mutual Fund

**Key Findings:**

Risk Paradox: Seniors showed highest mutual fund participation (1,242 transactions) vs Young (873 transactions)

Account-Based Patterns:

Business: Balanced across all investment types

Current: Growth-focused (highest mutual fund preference)

Savings: Safety-focused (highest fixed deposit preference)

Overall Distribution: Near-perfect split (33% each) across investment types

**C. CHURN RISK ANALYSIS**

Methodology: Rule-based risk scoring

Very High Risk: Balance <5,000 + Only 1 transaction (144 customers)

High Risk: Balance <10,000 + ≤2 transactions (252 customers)

Medium Risk: Balance <20,000 (515 customers)

Low Risk: All others (5,424 customers)

**Key Findings:**

Immediate Risk: 396 customers (6.25%) need urgent retention efforts

Preventive Care: 515 customers (8.13%) at medium risk

Healthy Base: 85.62% of customer base is stable

**BUSINESS IMPACT:**

This analysis helps target marketing, develop better products, and improve customer retention.

**FILES:**
- customer_segmentation.sql
- investment_analysis.sql  
- churn_analysis.sql
