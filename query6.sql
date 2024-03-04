-- Retrieves portfolios with a total value greater than 10000.
SELECT 
    p.portfolio_id, 
    p.portfolio_name, 
    SUM(per.total_value) AS total_portfolio_value
FROM 
    portfolio p
JOIN 
    performance per ON p.portfolio_id = per.portfolio_id
GROUP BY 
    p.portfolio_id, 
    p.portfolio_name
HAVING 
    SUM(per.total_value) > 10000;

-- Example output:
-- portfolio_id | portfolio_name     | total_portfolio_value
-- 1            | Retirement Fund    | 15000.00
-- 2            | Aggressive Growth  | 12000.00
