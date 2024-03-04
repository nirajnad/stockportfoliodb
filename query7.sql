-- Retrieves portfolios that have a certain stock and have transactions within the last month.
SELECT DISTINCT 
    p.portfolio_id, 
    p.portfolio_name
FROM 
    portfolio p
JOIN 
    portfolio_stock ps ON p.portfolio_id = ps.portfolio_id
JOIN 
    transaction t ON ps.portfoliostock_id = t.portfoliostock_id
WHERE 
    ps.stock_id = (SELECT stock_id FROM stock WHERE ticker_symbol = 'GOOGL') 
    AND t.transaction_date BETWEEN date('now', '-1 month') AND date('now');

-- Example output:
-- portfolio_id | portfolio_name
-- 2            | Tech Growth
-- 4            | Balanced Portfolio
