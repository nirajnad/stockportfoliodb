-- Retrieves a list of stocks with an indicator of their performance status based on their current price.
SELECT 
    s.stock_id, 
    s.ticker_symbol, 
    s.current_price,
    CASE 
        WHEN s.current_price > 100 THEN 'High Value'
        WHEN s.current_price BETWEEN 50 AND 100 THEN 'Moderate Value'
        ELSE 'Low Value'
    END AS value_status
FROM 
    stock s;

-- Example output:
-- stock_id | ticker_symbol | current_price | value_status
-- 1        | AAPL          | 150.00        | High Value
-- 2        | MSFT          | 75.00         | Moderate Value
-- 3        | TSLA          | 45.00         | Low Value
