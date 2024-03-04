-- Retrieves all portfolios that have a transaction on a specific date.
SELECT 
    p.portfolio_id, 
    p.portfolio_name
FROM 
    portfolio p
WHERE 
    EXISTS (SELECT 1 FROM transaction t JOIN portfolio_stock ps ON t.portfoliostock_id = ps.portfoliostock_id WHERE ps.portfolio_id = p.portfolio_id AND t.transaction_date = '2022-01-01');

-- Example output:
-- portfolio_id | portfolio_name
-- 1            | Retirement Fund
-- 3            | High Risk High Reward
