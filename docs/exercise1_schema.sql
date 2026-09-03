CREATE TABLE companies (
    CompanyID int PRIMARY KEY,
    CompanyName varchar(255)
);

CREATE TABLE isin_company_map (
    RecordId int PRIMARY KEY,
    CompanyID int REFERENCES companies(CompanyID),
    Isin varchar(12),
    Symbol varchar(12),
    Exchange varchar(12),
    ValidFrom datetime,
    CreationDate datetime
);

CREATE TABLE dividend_announcements (
    DividendID int PRIMARY KEY,
    Isin varchar(12),
    EventID int,
    EventStatus varchar(20) CHECK (EventStatus IN ('ANNOUNCED', 'CANCELLED')),
    VendorStatus tinyint,
    VendorSequence bigint,
    ExDivDate datetime,
    PayDate datetime,
    AnnouncementDate datetime,
    AnnouncementType varchar(20) CHECK (AnnouncementType IN ('CASH', 'SHARES', 'CASH_OR_SHARES')),
    CreationDate datetime,
    ShareExchangeRatio decimal(12,4),
    DividendType varchar(20) CHECK (DividendType IN ('INTERIM', 'FINAL', 'SPECIAL')),
    DivRate decimal(12,4),
    DivCurrency varchar(3),
    CompanyID int REFERENCES companies(CompanyID)
);