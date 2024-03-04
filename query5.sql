-- Retrieves stocks that have issued dividends more than 3 times.
SELECT 
    s.ticker_symbol, 
    COUNT(d.dividend_id) AS dividend_count
FROM 
    stock s
JOIN 
    dividend d ON s.stock_id = d.stock_id
GROUP BY 
    s.ticker_symbol
HAVING 
    COUNT(d.dividend_id) > 3;

-- Example output:
-- ticker_symbol | dividend_count
-- AAPL          | 4
-- MSFT          | 5
