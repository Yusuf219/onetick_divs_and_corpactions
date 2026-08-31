-- Exercise 1: dividends & corporate actions data model
-- Decisions are recorded in the project notes. This file is the
-- actual DDL: fill in types, constraints, and anything still missing below.

CREATE TABLE dividend_announcements (
    DividendID int PRIMARY KEY,
    Isin varchar(12),
    EventID int,
    EventStatus varchar(20),
    ExDivDate datetime,
    PayDate datetime,
    AnnouncementDate datetime,
    AnnouncementType varchar(20),
    CreationDate datetime,
    ShareExchangeRatio decimal(12,4),
    DivRate decimal(12,4),
    DivCurrency varchar(3),
    CompanyID int FOREIGN KEY (CompanyID) REFERENCES companies(CompanyID)
);

CREATE TABLE companies (
    CompanyID int PRIMARY KEY,
    CompanyName varchar(255)
);

CREATE TABLE isin_company_map (
    RecordId int PRIMARY KEY,
    CompanyID int FOREIGN KEY (CompanyID) REFERENCES companies(CompanyID),
    Isin varchar(12),
    ValidFrom datetime,
    CreationDate datetime
);

-- Not yet covered by this schema: scrip dividends (cash/share choice),
-- full audit-history query, "what changed since yesterday" query.
