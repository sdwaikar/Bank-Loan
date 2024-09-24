Total Loan Applications
select count(id) as Total_Loan_Applications from bank_loan_data
 

MTD Loan Applications
select count(id) as MTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021
 
PMTD Loan Applications
select count(id) as PMTD_Total_Loan_Applications from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021
 

Total Funded Amount
select SUM(loan_amount) as Total_Funded_Amount FROM bank_loan_data
 

MTD Total Funded Amount
select SUM(loan_amount) as MTD_Total_Funded_Amount FROM bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021
 

PMTD Total Funded Amount
select SUM(loan_amount) as PMTD_Total_Funded_Amount FROM bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021
 

Total Amount Received
select sum(total_payment) as Total_Amount_received FROM bank_loan_data
 

MTD Total Amount Received
select sum(total_payment) as MTD_Total_Amount_received FROM bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021
 

PMTD Total Amount Received
select sum(total_payment) as PMTD_Total_Amount_received FROM bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021
 

Average Interest Rate
select ROUND(avg(int_rate),4)*100 as MTD_Avg_Interest_Rate From bank_loan_data
 

MTD Average Interest
select ROUND(avg(int_rate),4)*100 as MTD_Avg_Interest_Rate From bank_loan_data
WHERE MONTH(ISSUE_DATE) = 12 AND YEAR(ISSUE_DATE) = 2021
 

PMTD Average Interest
select ROUND(avg(int_rate),4)*100 as PMTD_Avg_Interest_Rate From bank_loan_data
WHERE MONTH(ISSUE_DATE) = 11 AND YEAR(ISSUE_DATE) = 2021
 

Avg DTI
select ROUND(avg(dti),4)*100 as Avg_DTI From bank_loan_data
 

MTD Avg DTI
select ROUND(avg(dti),4)*100 as MTD_Avg_DTI From bank_loan_data
WHERE MONTH(ISSUE_DATE) = 12 AND YEAR(ISSUE_DATE) = 2021
 

PMTD Avg DTI
select ROUND(avg(dti),4)*100 as PMTD_Avg_DTI From bank_loan_data
WHERE MONTH(ISSUE_DATE) = 11 AND YEAR(ISSUE_DATE) = 2021
 
Good Loan Percentage
SELECT 
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status= 'Current'
	THEN id END)*100)/ COUNT(id) as Good_loan_percentage
	from bank_loan_data
 

Good Loan Applications
SELECT COUNT(id) as Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status ='Current'
 

Good Loan Funded Amount
SELECT SUM(loan_amount) as Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status ='Current'
 

Good Loan Amount Received
SELECT SUM(total_payment) as Good_Loan_Recieved_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status ='Current'
 

Bad Loan Percentage
SELECT 
    (COUNT(CASE WHEN loan_status = 'Charged Off'
	THEN id END)*100)/ COUNT(id) as Bad_loan_percentage
	from bank_loan_data
 

Bad Loan Applications
SELECT COUNT(id) as Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 

Bad Loan Funded Amount
SELECT SUM(loan_amount) as Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 

Bad Loan Amount Received
SELECT SUM(total_payment) as Bad_Loan_Recieved_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'
 

LOAN STATUS
	SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status
 



SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status
 



SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)
 


STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state
 
TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term
 

EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length
 

PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose
 

HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership
 

