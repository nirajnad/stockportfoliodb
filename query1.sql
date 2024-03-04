-- Retrieves a list of all transactions along with the stock ticker symbol and portfolio name.
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
    portfolio p ON ps.portfolio_id = p.portfolio_id;

-- Example output:
-- transaction_id | transaction_date | type | quantity | price_per_share | ticker_symbol | portfolio_name
-- 1              | 2022-01-01       | Buy  | 50       | 150.00          | AAPL          | Retirement Fund
-- 2              | 2022-01-02       | Sell | 20       | 155.00          | MSFT   