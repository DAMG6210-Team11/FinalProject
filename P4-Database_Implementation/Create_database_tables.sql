--Creating Database
CREATE DATABASE house_rental_database;
GO
USE house_rental_database;
GO

--User Table Creation
CREATE TABLE APP_USER
  (
     user_id    INTEGER NOT NULL,
     user_name  VARCHAR(50) NOT NULL,
     password   VARBINARY(400) NOT NULL,
     email      VARCHAR(50) NOT NULL,
     address    VARCHAR(100),
     contact    VARCHAR(25) NOT NULL,
     user_type  VARCHAR(50) CHECK(user_type IN ('OWNER', 'RENTER')), --Check1
     CONSTRAINT userid_pk PRIMARY KEY (user_id)
  );
GO

--Renter Table Creation
CREATE TABLE RENTER
  (
     renter_id   INTEGER NOT NULL,
     date_of_brith DATE,
     credit_score INTEGER,
     CONSTRAINT renterid_pk PRIMARY KEY (renter_id),
     CONSTRAINT useridrenter_fk FOREIGN KEY (renter_id) REFERENCES app_user(
     user_id)
  );
GO

--Owner Table Creation
CREATE TABLE OWNER
  (
     owner_id   INTEGER NOT NULL,
     tax_id     VARCHAR(255) UNIQUE,
     owner_type VARCHAR(50) CHECK(owner_type IN ('LANDLORD','MANAGEMENT_COMPANY')), --Check2
     CONSTRAINT ownerid_pk PRIMARY KEY (owner_id),
     CONSTRAINT useridowner_fk FOREIGN KEY (owner_id) REFERENCES app_user(
     user_id)
  );
GO

--Landlord Table Creation
CREATE TABLE LANDLORD
  (
     landlord_id        INTEGER NOT NULL,
     license_number     VARCHAR(255) UNIQUE,
     landlord_type      VARCHAR(50) CHECK(landlord_type IN ('INDIVIDUALLY_MANAGED','MANAGEMENT_DRIVEN')), --Check2
     CONSTRAINT landlord_id PRIMARY KEY (landlord_id),
     CONSTRAINT owneridlandlord_fk FOREIGN KEY (landlord_id) REFERENCES owner(
     owner_id)
  );
GO

--Management Company Table Creation
CREATE TABLE MANAGEMENT_COMPANY
  (
     management_company_id   INTEGER NOT NULL,
     registration_number    VARCHAR(255) UNIQUE,
     employee_count         INTEGER DEFAULT(0),                             -----xxxxxxx
     CONSTRAINT mgmt_comp_id_pk PRIMARY KEY (management_company_id),
     CONSTRAINT owneridmgmtcmpny_fk FOREIGN KEY (management_company_id) REFERENCES owner(
     owner_id)
  );
GO

--Individually Managed Landlord Table Creation
CREATE TABLE INDIVIDUALLY_MANAGED_LL
  (
     individual_landlord_id   INTEGER NOT NULL,
     no_of_properties_owned     INTEGER,                           
     CONSTRAINT ind_landlord_id_pk PRIMARY KEY (individual_landlord_id),
     CONSTRAINT landlordid_indivudual_fk FOREIGN KEY (individual_landlord_id) REFERENCES landlord(
     landlord_id)
  );
GO

--Management driven Landlord Table Creation
CREATE TABLE MANAGEMENT_DRIVEN_LL
  (
     management_landlord_id   INTEGER NOT NULL,
     management_company_id     INTEGER,
     CONSTRAINT mgmt_landlord_id_pk PRIMARY KEY (management_landlord_id),
     CONSTRAINT mgmt_cmpny_fk FOREIGN KEY (management_company_id) REFERENCES management_company(
     management_company_id),
     CONSTRAINT mngmt_landlord_fk FOREIGN KEY (management_landlord_id) REFERENCES landlord(
     landlord_id)
  );
GO


--Property Table Creation
CREATE TABLE PROPERTY
  (
     property_id        INTEGER NOT NULL,
     owner_id           INTEGER,
     property_address   VARCHAR(100),
     city               VARCHAR(50),
     state              VARCHAR(50),
     zip                VARCHAR(10),  
     property_cost      DECIMAL(10,2),
     property_type      VARCHAR(50) CHECK(property_type IN ('Villa', 'Studio', 'Townhouse', 'Apartment')),
     square_feet        INT,
     description        TEXT,
     CONSTRAINT property_pk PRIMARY KEY (property_id),
     CONSTRAINT property_owner_fk FOREIGN KEY (owner_id) REFERENCES owner(
     owner_id)
  );
GO

--Lease Table Creation
CREATE TABLE LEASE
  (
     lease_id   INTEGER NOT NULL,
     property_id     INTEGER,
     renter_id  INTEGER,  
     lease_start_date      DATE,
     lease_end_date      DATE,
     CONSTRAINT lease_pk PRIMARY KEY (lease_id),
     CONSTRAINT lease_propertyid_fk FOREIGN KEY (property_id) REFERENCES property(
     property_id),
     CONSTRAINT lease_renterid_fk FOREIGN KEY (renter_id) REFERENCES renter(
     renter_id),
  );
GO

--Payment Table Creation
CREATE TABLE PAYMENT
  (
     payment_id   INTEGER NOT NULL,
     lease_id     INTEGER,
     amount       DECIMAL(10,2),
     payment_date       DATE,
     transaction_id     VARCHAR(255) UNIQUE,
     CONSTRAINT payment_pk PRIMARY KEY (payment_id),
     CONSTRAINT payment_lease_fk FOREIGN KEY (lease_id) REFERENCES lease(
     lease_id)
  );
GO

--Broker_firm Table Creation
CREATE TABLE BROKER_FIRM
  (
     broker_firm_id       INTEGER NOT NULL,
     broker_firm_name     VARCHAR(25),
     broker_firm_address  VARCHAR(25),
     brokerage_rates      DECIMAL(10, 2),
     CONSTRAINT broker_firm_pk PRIMARY KEY (broker_firm_id),
  );
GO

--Broker Table Creation
CREATE TABLE BROKER
  (
     broker_id       INTEGER NOT NULL,
     broker_name     VARCHAR(25),
     license_id      VARCHAR(255) UNIQUE, 
     broker_firm_id  INTEGER,
     CONSTRAINT broker_id_pk PRIMARY KEY (broker_id),
     CONSTRAINT broker_firmid_fk FOREIGN KEY (broker_firm_id) REFERENCES broker_firm(
     broker_firm_id)
  );
GO

--Property_listing Table Creation
CREATE TABLE PROPERTY_LISTING
  (
     property_id   INTEGER NOT NULL,
     broker_firm_id     INTEGER NOT NULL,
     CONSTRAINT property_listing_pk PRIMARY KEY (property_id, broker_firm_id),
     CONSTRAINT property_id_fk FOREIGN KEY (property_id) REFERENCES property(
     property_id),
     CONSTRAINT prop_brokerfirmid_fk FOREIGN KEY (broker_firm_id) REFERENCES broker_firm(
     broker_firm_id)
  );
GO

--Brokerage Table Creation
CREATE TABLE brokerage
  (
     renter_id   INTEGER NOT NULL,
     broker_firm_id     INTEGER NOT NULL,
     broker_fee     DECIMAL(10,2),
     CONSTRAINT brokerage_pk PRIMARY KEY (renter_id, broker_firm_id),
     CONSTRAINT renter_id_fk FOREIGN KEY (renter_id) REFERENCES renter(
     renter_id),
     CONSTRAINT brokerage_brokerfirmid_fk FOREIGN KEY (broker_firm_id) REFERENCES broker_firm(
     broker_firm_id)
  );
GO



-- DROP DATABASE house_rental_database;