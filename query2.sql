-- Retrieves transactions of a specific type ('Buy') that involve a certain stock and are within a specific portfolio.
SELECT 
    t.transaction_id, 
    t.transaction_date, 
    t.type, 
    t.quantity, 
    t.price_per_share, 
    s.ticker_symbol, 
    p.portfolio_name
FROM 
    transaction t
JOIN 
    portfolio_stock ps ON t.portfoliostock_id = ps.portfoliostock_id
JOIN 
    stock s ON ps.stock_id = s.stock_id
JOIN 
    portfolio p ON ps.portfolio_id = p.portfolio_id
WHERE 
    t.type = 'Buy' 
    AND s.ticker_symbol = 'AAPL' 
    AND p.portfolio_name = 'Tech Titans';

-- Example output:
-- transaction_id | transaction_date | type | quantity | price_per_share | ticker_symbol | portfolio_name
-- 5              | 2022-01-05       | Buy  | 10       | 145.00          | AAPL          | Tech Titans
