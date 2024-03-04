-- Creating the User table
CREATE TABLE user (
    user_id INT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Creating the Portfolio table
CREATE TABLE portfolio (
    portfolio_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    portfolio_name TEXT NOT NULL,
    creation_date DATE NOT NULL,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Creating the Stock table
CREATE TABLE stock (
    stock_id INT PRIMARY KEY,
    ticker_symbol TEXT NOT NULL UNIQUE,
    company_name TEXT NOT NULL,
    sector TEXT,
    current_price FLOAT,
    volume INT
);

-- Creating the PortfolioStock table
CREATE TABLE portfolio_stock (
    portfoliostock_id INT PRIMARY KEY,
    portfolio_id INT NOT NULL,
    stock_id INT NOT NULL,
    quantity_owned INT NOT NULL,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(portfolio_id),
    FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);

-- Creating the Transaction table
CREATE TABLE transaction (
    transaction_id INT PRIMARY KEY,
    portfoliostock_id INT NOT NULL,
    transaction_date DATE NOT NULL,
    type VARCHAR(4) CHECK (type IN ('Buy', 'Sell')),
    quantity INT NOT NULL,
    price_per_share FLOAT NOT NULL,
    FOREIGN KEY (portfoliostock_id) REFERENCES portfolio_stock(portfoliostock_id)
);

-- Creating the Dividend table
CREATE TABLE dividend (
    dividend_id INT PRIMARY KEY,
    stock_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount_per_share FLOAT NOT NULL,
    FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);

-- Creating the CorporateAction table
CREATE TABLE corporate_action (
    corporateaction_id INT PRIMARY KEY,
    stock_id INT NOT NULL,
    action_type TEXT NOT NULL,
    action_date DATE NOT NULL,
    details TEXT,
    FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);

-- Creating the Performance table
CREATE TABLE performance (
    performance_id INT PRIMARY KEY,
    portfolio_id INT NOT NULL,
    date DATE NOT NULL,
    total_value FLOAT NOT NULL,
    unrealized_gains_losses FLOAT,
    realized_gains_losses FLOAT,
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(portfolio_id)
);
