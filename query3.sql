-- Retrieves the stock details along with the total number of transactions performed on each stock.
SELECT 
    s.stock_id, 
    s.ticker_symbol, 
    s.company_name, 
    (SELECT COUNT(*) FROM transaction t WHERE t.stock_id = s.stock_id) AS total_transactions
FROM 
    stock s;

-- Example output:
-- stock_id | ticker_symbol | company_name       | total_transactions
-- 1        | AAPL          | Apple Inc.         | 3
-- 2        | MSFT          | Microsoft Corporation | 5
