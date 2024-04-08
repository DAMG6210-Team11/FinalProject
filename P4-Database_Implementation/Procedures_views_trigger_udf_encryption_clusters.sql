-- PROCEDURES

-- Stored Procedure 1: Get Lease Details by Renter Name
CREATE OR ALTER PROCEDURE GetLeaseDetailsByRenterName
   @UserName VARCHAR(100),
   @LeaseId INT OUTPUT,
   @PropertyId INT OUTPUT,
   @StartDate DATE OUTPUT,
   @EndDate DATE OUTPUT
AS
BEGIN
   SELECT TOP 1 @LeaseId = L.lease_id,
                @PropertyId = L.property_id,
                @StartDate = L.lease_start_date,
                @EndDate = L.lease_end_date
   FROM Lease L
   INNER JOIN App_User AU ON L.renter_id = AU.user_id
   WHERE AU.[user_name] = @UserName
   ORDER BY L.lease_start_date DESC;
END;
GO

-- Query to execute Stored Procedure 1
BEGIN
DECLARE @LeaseId INT, @PropertyId INT, @StartDate DATE, @EndDate DATE;

   EXEC GetLeaseDetailsByRenterName
   @UserName = 'Ivana Wable',
   @LeaseId = @LeaseId OUTPUT,
   @PropertyId = @PropertyId OUTPUT,
   @StartDate = @StartDate OUTPUT,
   @EndDate = @EndDate OUTPUT;

   SELECT @LeaseId AS LeaseId, @PropertyId AS PropertyId, @StartDate AS StartDate, @EndDate AS EndDate;
END;
GO

-- Stored Procedure 2: Calculate Total Revenue by Property

CREATE OR ALTER PROCEDURE CalculateTotalRevenueByProperty
   @PropertyId INT,
   @TotalRevenue DECIMAL(10, 2) OUTPUT
AS
BEGIN
   SELECT @TotalRevenue = SUM(P.amount)
   FROM Payment P
   INNER JOIN Lease L ON P.lease_id = L.lease_id
   WHERE L.property_id = @PropertyId;
END
GO

-- Query to execute Stored Procedure 2
BEGIN
   DECLARE @PropertyId INT = 5; -- Set the PropertyId parameter value
   DECLARE @TotalRevenue DECIMAL(10, 2);

   EXEC CalculateTotalRevenueByProperty @PropertyId = @PropertyId, @TotalRevenue = @TotalRevenue OUTPUT;

   SELECT @TotalRevenue AS TotalRevenue; -- Display the output
END;
GO

-- Stored Procedure 3: Update Property Details and Output Message 

CREATE OR ALTER PROCEDURE UpdatePropertyDetails
   @PropertyId INT,
   @PropertyAddress VARCHAR(25),
   @PropertyCost DECIMAL(10, 2),
   @PropertyType VARCHAR(50),
   @SquareFeet INT,
   @Description TEXT,
   @UpdateMessage NVARCHAR(200) OUTPUT
AS
BEGIN
   SET NOCOUNT ON;


   IF EXISTS (SELECT 1 FROM PROPERTY WHERE property_id = @PropertyId)
   BEGIN
       UPDATE PROPERTY
       SET property_address = @PropertyAddress,
           property_cost = @PropertyCost,
           property_type = @PropertyType,
           square_feet = @SquareFeet,
           description = @Description
       WHERE property_id = @PropertyId;


       SET @UpdateMessage = 'Property details updated successfully.';
   END
   ELSE
   BEGIN
       SET @UpdateMessage = 'Property ID does not exist. Details not updated.';
   END
END;
GO

-- Query to execute Stored Procedure 3
BEGIN
   DECLARE @UpdateMessage NVARCHAR(200);

   EXEC UpdatePropertyDetails
      @PropertyId = 1,
      @PropertyAddress = '123 New Street',
      @PropertyCost = 150000.00,
      @PropertyType = 'Villa',
      @SquareFeet = 2000,
      @Description = 'This is a spacious single-family home with a large backyard.',
      @UpdateMessage = @UpdateMessage OUTPUT;

   SELECT @UpdateMessage AS UpdateMessage;
END;
GO

--VIEWS

-- View 1: View to Show Properties With High Demand:
CREATE OR ALTER VIEW PropertiesWithHighDemand AS
SELECT property_id, property_address, property_type, square_feet, Description
FROM Property
WHERE property_id IN (SELECT property_id FROM Lease GROUP BY property_id HAVING
COUNT(*) > 0);
GO

-- Query to check PropertiesWithHighDemand view
SELECT * 
FROM PropertiesWithHighDemand;
GO

-- View 2: View to provides alerts for leases that are about to expire within a certain period.
CREATE OR ALTER VIEW LeaseExpirationAlerts AS
SELECT lease_id, property_id, lease_end_date
FROM Lease
WHERE DATEDIFF(DAY, GETDATE(), lease_end_date) <= 30; -- Alerts for leases expiring within 30 days
GO

-- Query to check PropertiesWithHighDemand view
SELECT *
FROM LeaseExpirationAlerts;
GO
SELECT *
FROM LeaseExpirationAlerts
WHERE DATEDIFF(DAY, GETDATE(), lease_end_date) <= 15;
GO

-- View 3: View that shows all renter along with their broker firms and associated brokers
CREATE OR ALTER VIEW RenterBrokerView AS
SELECT
   A.user_id AS renter_id,
   A.user_name AS renter_name,
   A.contact AS renter_contact,
   BF.broker_firm_id,
   BF.broker_firm_name,
   B.broker_id,
   B.broker_name
FROM
APP_USER A
JOIN
   RENTER R ON A.user_id = R.renter_id
JOIN
   BROKERAGE BR ON R.renter_id = BR.renter_id
JOIN
   BROKER_FIRM BF ON BR.broker_firm_id = BF.broker_firm_id
JOIN
   BROKER B ON BR.broker_firm_id = B.broker_firm_id;
   GO
   
-- Query to check RenterBrokerView view
SELECT * FROM RenterBrokerView;

--TRIGGERS

--Trigger 1 : Creation of property audit table to record all the updated property details
CREATE TABLE property_details_audit
(
   property_Audit_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   property_id       INT NOT NULL,
   property_type     VARCHAR(50),
   city              VARCHAR(50),
   state             VARCHAR(50),
   zip               VARCHAR(10),
   [Action]          CHAR(1),
   [ActionDate]      DATETIME
);
GO

--creating the trigger
CREATE OR ALTER TRIGGER property_history_trigger
ON dbo.PROPERTY
FOR UPDATE
AS
BEGIN
    INSERT INTO property_details_audit (property_id, property_type, city, state, zip, [Action], [ActionDate])
    SELECT i.property_id, i.property_type, i.city, i.state, i.zip, 'U', GETDATE()
    FROM inserted i
END;
GO

-- Update a property's city
UPDATE PROPERTY
SET city = 'New York'
WHERE property_id = 2;
GO

-- Query  for the PROPERTY table to view current state
SELECT property_id, property_type, property_address, city, state, zip, property_cost, square_feet, description
FROM PROPERTY;
GO

--  Query  for the property_details_audit table to view logged updates
SELECT property_Audit_id, property_id, property_type, city, state, zip, [Action], [ActionDate]
FROM property_details_audit;


--Trigger 2 : Creation of renter credit audit table to record all the changed renter credit details
CREATE TABLE renter_credit_audit
(
    audit_id        INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    renter_id       INTEGER NOT NULL,
    old_credit_score INTEGER,
    new_credit_score INTEGER,
    update_date     DATETIME,
    CONSTRAINT fk_renter_audit FOREIGN KEY (renter_id) REFERENCES RENTER(renter_id)
);
GO


CREATE OR ALTER TRIGGER trg_update_credit_score
ON RENTER
AFTER UPDATE
AS
BEGIN
    IF UPDATE(credit_score)
    BEGIN
        INSERT INTO renter_credit_audit(renter_id, old_credit_score, new_credit_score, update_date)
        SELECT d.renter_id, d.credit_score, i.credit_score, GETDATE()
        FROM deleted d
        INNER JOIN inserted i ON d.renter_id = i.renter_id;
    END
END;
GO
-- Update a renter's credit score
UPDATE RENTER
SET credit_score = 750
WHERE renter_id = 1;
GO

-- Check the audit log
SELECT renter_id, date_of_brith, credit_score FROM RENTER;
SELECT audit_id, renter_id, old_credit_score, new_credit_score, update_date FROM renter_credit_audit
ORDER BY update_date DESC;
GO

--UDFs
---UDF 1 : calculates the age of a renter based on their date of birth recorded in the RENTER table
CREATE FUNCTION dbo.Calculate_age(@renter_id INT)
RETURNS INT
AS
BEGIN
DECLARE @dob DATE;

    SELECT @dob = date_of_brith from RENTER where renter_id = @renter_id;
    RETURN DATEDIFF(YEAR, @dob, GETDATE()) - 
           CASE 
                WHEN MONTH(@dob) > MONTH(GETDATE()) OR 
                     (MONTH(@dob) = MONTH(GETDATE()) AND DAY(@dob) > DAY(GETDATE())) 
                THEN 1 
                ELSE 0 
           END;
END;
GO

-- alter table renter drop column renter_age;

ALTER TABLE renter ADD renter_age  AS dbo.Calculate_age(renter_id);
GO
SELECT * from RENTER;
GO


--UDF 2---Calculates commission rates of broker firms based on Brokerage Rates
CREATE FUNCTION dbo.Calculate_commission_rate(@firm_id INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @commission_rate DECIMAL(10,2)
    DECLARE @brokerage_rate DECIMAL(10,2)

    SELECT @brokerage_rate = brokerage_rates
    FROM BROKER_FIRM
    WHERE broker_firm_id = @firm_id

    IF @brokerage_rate <= 9.5
        SET @commission_rate = 0.05
    ELSE
        SET @commission_rate = 0.1

    RETURN @commission_rate
END
GO


ALTER TABLE BROKER_FIRM ADD commission_rate  AS dbo.Calculate_commission_rate(broker_firm_id);
GO
SELECT * from BROKER_FIRM;

--DECRYPTION
OPEN SYMMETRIC KEY AppUserPass_SM DECRYPTION BY CERTIFICATE AppUserPass;
go

SELECT user_id,
       user_name,
       user_type,
       CONVERT(VARCHAR, Decryptbykey([password])) AS
       decrypted_password
FROM   app_user; 

GO

--NON-CLUSTERED INDEXES
-- NonClustered Index1: A nonclustered index on the "user_type" column in the "app_user" table
CREATE NONCLUSTERED INDEX usertype_idx
  ON app_user ([user_type]);

-- NonClustered Index2: A nonclustered index on the "landlord_type" column in the "landlord" table
CREATE NONCLUSTERED INDEX landlordtype_idx
  ON landlord(landlord_type);

-- NonClustered Index3: A nonclustered index on the "payment_date" column in the "payment" table
CREATE NONCLUSTERED INDEX paymentdate_idx
  ON payment([payment_date]);

-- NonClustered Index4: A nonclustered index on the "owner_type" column in the "owner" table
CREATE NONCLUSTERED INDEX ownertype_idx
  ON owner([owner_type]);

-- NonClustered Index5: A nonclustered index on the "property_type" column in the "property" table
CREATE NONCLUSTERED INDEX propertytype_idx
  ON property ([property_type]);


-- Query to check indexes created ON Table : 'app_user'
SELECT NAME      AS index_name,
       type_desc AS index_type
FROM   sys.indexes
WHERE  object_id = Object_id('app_user');
go

-- Query to check indexes created ON Table : 'landlord'
SELECT NAME      AS index_name,
       type_desc AS index_type
FROM   sys.indexes
WHERE  object_id = Object_id('landlord');
go

-- Query to check indexes created ON Table : 'payment'
SELECT NAME      AS index_name,
       type_desc AS index_type
FROM   sys.indexes
WHERE  object_id = Object_id('payment');
go

-- Query to check indexes created ON Table : 'owner'
SELECT NAME      AS index_name,
       type_desc AS index_type
FROM   sys.indexes
WHERE  object_id = Object_id('owner');
go

-- Query to check indexes created ON Table : 'property'
SELECT NAME      AS index_name,
       type_desc AS index_type
FROM   sys.indexes
WHERE  object_id = Object_id('property'); 

