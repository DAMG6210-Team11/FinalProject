USE house_rental_database
GO

---ENCRYPTION
CREATE master KEY encryption BY password = 'Northeastern@123';
go

CREATE certificate appuserpass WITH subject = 'App User Password';
go

CREATE symmetric KEY appuserpass_sm WITH algorithm = aes_256 encryption BY certificate appuserpass;
go

OPEN symmetric KEY appuserpass_sm decryption BY certificate appuserpass;
go 

--INSERT SCRIPTS
--  INSERT statements for the APP_USER table 
INSERT INTO APP_USER (user_id, user_name, password, contact, user_type, email, address) VALUES
(1, 'Eesita', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'sathwik123')), '+917187205238', 'OWNER', 'eesita@gmail.com', '505 Walnut Ave'),
(2, 'Srujana', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'srujana123')), '00611310154', 'RENTER', 'srujana@gmail.com', '1515 Cedar St'),
(3, 'Sathwik', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'sathwik123')), '+913333892725', 'RENTER', 'sathwik@gmail.com', '1717 Spruce St'),
(4, 'Sreshta', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'sreshta123')), '02045070489', 'OWNER', 'sreshta@gmail.com', '1313 Elm St'),
(5, 'Saneeth', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'saneeth123')), '03977073848', 'OWNER', 'saneeth@gmail.com', '101 Birch Rd'),
(6, 'Dharmajan Tella', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '(1rtP8dqS^9m')), '7525154346', 'OWNER', 'dharmajan@example.com', '123 Palm St'),
(7, 'Zoya Kari', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'iBNj(4PdN5v(')), '0158566076', 'RENTER', 'zoya@example.com', '456 Pine St'),
(8, 'Baiju Dutt', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '^_Kqf@f+19aD')), '09992683245', 'OWNER', 'baiju@example.com', '789 Maple Ave'),
(9, 'Kiaan Wali', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '1BFH(6oS(o6)')), '03175831319', 'RENTER', 'kiaan@example.com', '101 Birch Rd'),
(10, 'Jayant Ghose', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'b2lO3v0@*4%A')), '09073404649', 'RENTER', 'jayant@example.com', '202 Elm St'),
(11, 'Anya Shroff', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'Q3C04s%Q$3qY')), '+912714707086', 'RENTER', 'anya@example.com', '303 Cedar St'),
(12, 'Sana Balay', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '%10XuoR*aaAK')), '+915159872544', 'RENTER', 'sana@example.com', '505 Walnut Ave'),
(13, 'Samarth Badami', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '^fx8%ONf!f8T')), '7915426168', 'OWNER', 'samarth@example.com', '707 Spruce St'),
(14, 'Ivana Wable', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'JSX5DIsn%A!A')), '5045767119', 'RENTER', 'ivana@example.com', '909 Pine St'),
(15, 'Lakshay Contractor', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'w*WE8MsCMq^1')), '+914993899757', 'RENTER', 'lakshay@example.com', '1111 Maple Ave'),
(16, 'Kimaya Sahota', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'G_6!Bvk8i@OP')), '02975031482', 'RENTER', 'kimaya@example.com', '1212 Oak St'),
(17, 'Adira Subramaniam', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '4v6sP&bT_M^m')), '+919256267734', 'OWNER', 'adira@example.com', '1313 Elm St'),
(18, 'Baiju Bhakta', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'Gr55VUOt($S#')), '00808522195', 'RENTER', 'baiju@example.com', '1414 Birch Rd'),
(19, 'Advika Dalal', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '$9H*x8sdNaEH')), '+917279600770', 'RENTER', 'advika@example.com', '1515 Cedar St'),
(20, 'Anay Lad', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'i3zJLiZ_L2B#')), '1685697221', 'RENTER', 'anay@example.com', '1616 Walnut Ave'),
(21, 'Misha Swaminathan', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '&8audZ7pv1FG')), '+917417258787', 'OWNER', 'misha@example.com', '1717 Spruce St'),
(22, 'Zeeshan Chandran', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '@Uq#XiDn4K06')), '04163518169', 'OWNER', 'zeeshan@example.com', '1818 Pine St'),
(23, 'Himmat Khosla', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'm8Wj&t1R@_#B')), '2820409579', 'OWNER', 'himmat@example.com', '1919 Maple Ave'),
(24, 'Shayak Chakrabarti', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'RTsOwSCj^1HR')), '+912334115956', 'RENTER', 'shayak@example.com', '2020 Oak St'),
(25, 'Drishya Shere', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, ')M2Zixy8owj8')), '0650360857', 'OWNER', 'drishya@example.com', '2121 Elm St'),
(26, 'Nayantara Wagle', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'L@tBgCe_Q!3i')), '+919350489706', 'RENTER', 'nayantara@example.com', '2222 Cedar St'),
(27, 'Himmat Reddy', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'Pl2PgEpw%$Fh')), '+910498035117', 'RENTER', 'himmat@example.com', '2323 Walnut Ave'),
(28, 'Samar Atwal', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'pvRkIxdY_^3T')), '3553670717', 'RENTER', 'samar@example.com', '2424 Spruce St'),
(29, 'Samaira Chanda', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'XxJ^R!ktIO1B')), '01618550192', 'OWNER', 'samaira@example.com', '2525 Pine St'),
(30, 'Myra Rana', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'X3@_G1nyjZu4')), '5856089443', 'OWNER', 'myra@example.com', '2626 Maple Ave'),
(31, 'Pari Ravi', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '%0niJdjQ&7X6')), '0770592420', 'RENTER', 'pari@example.com', '2727 Oak St'),
(32, 'Mamooty Kakar', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'qnOKl__y^K5B')), '09090283841', 'OWNER', 'mamooty@example.com', '2828 Elm St'),
(33, 'Mamooty Som', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'L%IOu5*Y3x7o')), '05385739465', 'OWNER', 'mamooty_s@example.com', '2929 Cedar St'),
(34, 'Hiran Kannan', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '(#g35Yp8p2Sv')), '7067020449', 'OWNER', 'hiran@example.com', '3030 Walnut Ave'),
(35, 'Prisha Sangha', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'mc0RqKFq#66Y')), '04068864749', 'OWNER', 'prisha@example.com', '3131 Spruce St'),
(36, 'Aaryahi Bhatia', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '*H9)5ZHeQgX2')), '02771915827', 'OWNER', 'aaryahi@example.com', '3232 Pine St'),
(37, 'Dishani Sandhu', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'p!78AhI3!AMO')), '+915743049177', 'OWNER', 'dishani@example.com', '3333 Maple Ave'),
(38, 'Vedika Mangal', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '*JpliobgE5MU')), '6350119496', 'RENTER', 'vedika@example.com', '3434 Oak St'),
(39, 'Abram Loyal', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '@qcYA_dn30&w')), '+910125938111', 'RENTER', 'abram@example.com', '3535 Elm St'),
(40, 'Badal Din', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'I8KKjwhv&QR&')), '06426706233', 'RENTER', 'badal@example.com', '3636 Cedar St'),
(41, 'Damini Mannan', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'rANgq@R5+2TL')), '00008067979', 'OWNER', 'damini@example.com', '3737 Walnut Ave'),
(42, 'Eva Dhawan', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'G5y1cCm(#pCQ')), '+916823781401', 'RENTER', 'eva@example.com', '3838 Spruce St'),
(43, 'Ishita Rout', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'l!tQ0fndC99Z')), '8240244386', 'OWNER', 'ishita@example.com', '3939 Pine St'),
(44, 'Divyansh Sharaf', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'cDg$8Wpde6(g')), '08067455082', 'OWNER', 'divyansh@example.com', '4040 Maple Ave'),
(45, 'Neelofar Ramaswamy', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '1#XO3)WqAQx4')), '1616791493', 'RENTER', 'neelofar@example.com', '4141 Oak St'),
(46, 'Trisha Chandran', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, 'uvx49^PxgP)3')), '05984239857', 'OWNER', 'trisha@example.com', '4242 Elm St'),
(47, 'Misha Dhar', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '&IOyQIt04qwN')), '+910466389021', 'RENTER', 'misha_d@example.com', '4343 Cedar St'),
(48, 'Pari Chacko', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '%WFfBFDlo0YK')), '09139254921', 'RENTER', 'pari_c@example.com', '4444 Walnut Ave'),
(49, 'Adah Balasubramanian', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '$6ZPy3OhEBbJ')), '2769160958', 'OWNER', 'adah@example.com', '4545 Spruce St'),
(50, 'Vidur Mangat', Encryptbykey(Key_guid('AppUserPass_SM'), CONVERT(VARBINARY, '(OkJG+ok1^5X')), '06952138447', 'OWNER', 'vidur@example.com', '4646 Pine St');
GO

-- Inserting data into the RENTER table
INSERT INTO RENTER (renter_id, date_of_brith, credit_score) 
VALUES 
(1, '1986-05-12', 524),
(14, '1990-07-24', 703),
(16, '1984-03-16', 621),
(19, '1988-11-02', 392),
(20, '1985-01-20', 658),
(23, '1992-04-15', 312),
(24, '1983-06-09', 438),
(25, '1991-09-22', 330),
(27, '1987-08-30', 644),
(29, '1986-12-17', 560),
(30, '1990-02-26', 307),
(32, '1984-10-05', 699),
(33, '1995-03-07', 740),
(36, '1989-05-13', 335),
(38, '1982-08-21', 770),
(39, '1985-04-18', 559),
(40, '1993-07-29', 617),
(41, '1987-12-14', 701),
(42, '1988-09-03', 579),
(46, '1986-01-11', 340),
(47, '1994-10-20', 849);

-- Inserting random data into the OWNER table
INSERT INTO OWNER (owner_id, tax_id, owner_type) 
VALUES 
(1, 'ALK-94-215-6808', 'MANAGEMENT_COMPANY'),
(4, 'TSX-26-137-6229', 'LANDLORD'),
(6, 'XQM-37-037-7153', 'LANDLORD'),
(9, 'DLF-53-188-7792', 'LANDLORD'),
(13, 'GOU-05-867-3333', 'LANDLORD'),
(15, 'AEX-08-868-3613', 'MANAGEMENT_COMPANY'),
(16, 'CGB-78-282-1438', 'MANAGEMENT_COMPANY'),
(17, 'CRT-29-903-0353', 'MANAGEMENT_COMPANY'),
(20, 'RSX-72-238-7898', 'MANAGEMENT_COMPANY'),
(21, 'WVT-08-198-1087', 'LANDLORD'),
(22, 'FRB-85-639-3761', 'LANDLORD'),
(25, 'XZM-99-302-6384', 'MANAGEMENT_COMPANY'),
(28, 'CTV-81-722-4184', 'LANDLORD'),
(30, 'IPA-43-142-9380', 'LANDLORD'),
(31, 'FFD-35-628-9135', 'MANAGEMENT_COMPANY'),
(32, 'HDO-10-041-4170', 'MANAGEMENT_COMPANY'),
(33, 'GQU-16-771-2493', 'LANDLORD'),
(35, 'YCE-36-449-8898', 'LANDLORD'),
(38, 'KAW-69-085-1335', 'MANAGEMENT_COMPANY'),
(39, 'GBN-90-521-6290', 'MANAGEMENT_COMPANY'),
(41, 'WDS-90-205-9402', 'LANDLORD'),
(44, 'WVJ-90-322-2883', 'LANDLORD'),
(45, 'XFK-61-846-6695', 'MANAGEMENT_COMPANY'),
(46, 'CQW-81-252-5524', 'LANDLORD'),
(47, 'AKA-60-960-9112', 'MANAGEMENT_COMPANY');

--  INSERT statements for the LANDLORD table 
INSERT INTO LANDLORD (landlord_id, license_number, landlord_type)
VALUES
(1, 'LIC395ZJM40677', 'INDIVIDUALLY_MANAGED'),
(4, 'LIC157XWZ69839', 'MANAGEMENT_DRIVEN'),
(6, 'LIC693XVL92393', 'MANAGEMENT_DRIVEN'),
(9, 'LIC351ZEN85276', 'MANAGEMENT_DRIVEN'),
(13, 'LIC645BOL41665', 'MANAGEMENT_DRIVEN'),
(15, 'LIC054VQG81853', 'INDIVIDUALLY_MANAGED'),
(16, 'LIC239HKU89591', 'MANAGEMENT_DRIVEN'),
(17, 'LIC101YRO40670', 'MANAGEMENT_DRIVEN'),
(20, 'LIC757UTG27577', 'INDIVIDUALLY_MANAGED'),
(21, 'LIC496YYU98433', 'INDIVIDUALLY_MANAGED'),
(22, 'LIC618GDB47929', 'INDIVIDUALLY_MANAGED'),
(25, 'LIC269BPT68034', 'MANAGEMENT_DRIVEN'),
(28, 'LIC389KKV94941', 'INDIVIDUALLY_MANAGED'),
(30, 'LIC677XZO62346', 'INDIVIDUALLY_MANAGED'),
(31, 'LIC345BIQ13817', 'MANAGEMENT_DRIVEN'),
(32, 'LIC960AAF04837', 'MANAGEMENT_DRIVEN'),
(33, 'LIC142PIE00924', 'MANAGEMENT_DRIVEN'),
(35, 'LIC180XZU74064', 'MANAGEMENT_DRIVEN'),
(38, 'LIC650MEF74949', 'INDIVIDUALLY_MANAGED'),
(39, 'LIC447RZI31412', 'MANAGEMENT_DRIVEN'),
(41, 'LIC090POL56322', 'MANAGEMENT_DRIVEN'),
(44, 'LIC901DED95177', 'INDIVIDUALLY_MANAGED'),
(45, 'LIC176RKV57856', 'INDIVIDUALLY_MANAGED'),
(46, 'LIC241WGE59551', 'MANAGEMENT_DRIVEN'),
(47, 'LIC942WJB42927', 'MANAGEMENT_DRIVEN');

--  INSERT statements for the MANAGEMENT_COMPANY table 
INSERT INTO MANAGEMENT_COMPANY (management_company_id, registration_number, employee_count) 
VALUES
(4, 'REG639FZO32987', 498),
(20, 'REG595KQJ38302', 137),
(30, 'REG027DUF23716', 14),
(32, 'REG751NMM64813', 390),
(33, 'REG586JHL32664', 282),
(35, 'REG672FOI61929', 210),
(38, 'REG311ZCB77507', 352),
(39, 'REG638SBY79201', 248),
(44, 'REG918BCX79943', 150),
(47, 'REG689RFG03647', 411);

--  INSERT statements for the INDIVIDUALLY_MANAGED_LL table 
INSERT INTO INDIVIDUALLY_MANAGED_LL (individual_landlord_id, no_of_properties_owned)
VALUES 
(1,10),
(6,8),
(9,2),
(13,9),
(15,8),
(16,6),
(17,1),
(21,1),
(22,10),
(25,6),
(28,4),
(31,9),
(41,8),
(45,5),
(46,3);

--  INSERT statements for the MANAGEMENT_DRIVEN_LL table
INSERT INTO MANAGEMENT_DRIVEN_LL (management_landlord_id, management_company_id) 
VALUES 
(4, 4),
(20, 20),
(30, 30),
(32, 32),
(33, 33),
(35, 35),
(38, 38),
(39, 39),
(44, 44),
(47, 47);

--  INSERT statements for the PROPERTY table
INSERT INTO PROPERTY (property_id, owner_id, property_address, city, state, zip, property_cost, property_type, square_feet, description) VALUES 
(1, 1, '1100 Sycamore Lane', 'Phoenix', 'Arizona', '85001', 425681.53, 'Villa', 1253, 'Eveniet aspernatur blanditiis quisquam officia perspiciatis. Quibusdam nesciunt non quaerat. Facilis totam deleniti exercitationem sint dolores. Est quos officiis ad dolorem.'),
(2, 35, '2120 Oak Street', 'Syracuse', 'New York', '13202', 477573.02, 'Villa', 1742, 'Quas distinctio neque. Itaque accusantium excepturi nemo. Qui voluptate quibusdam placeat.'),
(3, 13, '783 Maple Avenue', 'Orlando', 'Florida', '32801', 331037.02, 'Studio', 574, 'Nesciunt distinctio doloremque quos pariatur quibusdam natus. Corrupti sunt non sit. Quasi doloribus quibusdam architecto voluptatum esse accusantium doloremque. Nostrum veritatis fugit veniam in.'),
(4, 32, '432 Elmwood Avenue', 'Philadelphia', 'Pennsylvania', '19103', 738866.4, 'Villa', 1044, 'Dicta doloremque quia eligendi laudantium qui. Temporibus expedita et nihil natus sequi. Nam occaecati eveniet culpa. Magnam deleniti nulla quo illum autem veritatis.'),
(5, 6, '88 Cedar Street', 'San Francisco', 'California', '94109', 528707.82, 'Townhouse', 902, 'Nostrum quidem sunt et reprehenderit sit eveniet. Unde maiores expedita ducimus.'),
(6, 31, '3502 Hillcrest Avenue', 'Worcester', 'Massachusetts', '01602', 886789.3, 'Villa', 2751, 'Culpa illum eius rerum cum animi odit. Eos aut necessitatibus qui explicabo ad. Possimus saepe aliquid. At minima hic voluptate voluptatem. Non nemo voluptatum ad nostrum modi laborum.'),
(7, 16, '6792 Highland Drive', 'Austin', 'Texas', '78701', 364888.41, 'Studio', 3862, 'Vero consectetur reprehenderit. Nam neque error rerum nam aliquid corporis voluptatem. Aperiam aliquam molestias maiores quod possimus et odit.'),
(8, 17, '1203 Shadowmar Drive', 'Metairie', 'Louisiana', '70001', 555479.29, 'Townhouse', 4450, 'Quisquam quos quibusdam pariatur quidem. Debitis sed velit nihil blanditiis. Fuga delectus illum. Doloremque consequuntur autem eligendi aperiam magni. Eos eius maiores nam voluptatibus.'),
(9, 46, '4587 Broadway Avenue', 'Knoxville', 'Tennessee', '37917', 308122.33, 'Villa', 3584, 'Id maiores repellendus reprehenderit voluptas hic. Nobis provident illo.'),
(10, 4, '9524 Virginia Avenue', 'Chicago', 'Illinois', '60606', 655753.87, 'Villa', 1303, 'Temporibus esse minima quisquam aperiam. A dolore aliquid. Magnam officiis ipsa nostrum. Asperiores autem tempora sit facere distinctio dolorum.'),
(11, 20, '6653 Clark Street', 'Denver', 'Colorado', '80202', 299807.99, 'Villa', 2506, 'Incidunt laudantium deserunt sequi. Perspiciatis tenetur iusto molestias optio. Molestiae amet harum corporis officiis fugiat accusantium neque. Distinctio at aliquid vero non maiores animi.'),
(12, 35, '8132 Forest Avenue', 'Seattle', 'Washington', '98101', 227112.65, 'Studio', 1483, 'Quia eius illo suscipit quas distinctio. Eveniet quas sint facilis. Quidem sit qui fugit. Atque voluptates quaerat fugiat explicabo. Natus quas ex optio vel. Repudiandae exercitationem nisi cum.'),
(13, 20, '2378 Meadow View Drive', 'Hartford', 'Connecticut', '06103', 836315.38, 'Townhouse', 3963, 'Ipsam sit minus vero. Maxime sapiente molestiae distinctio accusamus delectus odit. Alias nisi praesentium optio atque totam. Quaerat reiciendis rerum dicta inventore veniam.'),
(14, 38, '984 Pearlman Avenue', 'Boston', 'Massachusetts', '02110', 294850.14, 'Studio', 4729, 'Minus expedita ab commodi molestias molestias rem. Eaque officia accusamus voluptatem illum. Explicabo suscipit iste quaerat fuga.'),
(15, 4, '7456 Locust Street', 'Reno', 'Nevada', '89501', 267574.72, 'Villa', 3268, 'Possimus quam recusandae commodi perspiciatis et. Nostrum velit dolorem veniam praesentium.'),
(16, 35, '2235 Washington Avenue', 'Phoenix', 'Arizona', '85003', 516393.05, 'Studio', 2454, 'Quibusdam commodi impedit blanditiis sequi ratione. Quisquam totam autem quos maiores veniam. Impedit voluptate mollitia iure debitis dolores possimus.'),
(17, 31, '3189 Broadway Street', 'San Antonio', 'Texas', '78205', 373841.11, 'Apartment', 721, 'Possimus culpa saepe dicta corrupti cupiditate. Minus eum dolore perferendis eum quae.'),
(18, 45, '1286 Monroe Street', 'Houston', 'Texas', '77002', 910331.92, 'Studio', 2034, 'Hic sed consequuntur maiores impedit eos distinctio. Soluta expedita voluptatum ullam facere consequuntur fuga.'),
(19, 45, '4362 Cemetery Street', 'Salinas', 'California', '93901', 910284.92, 'Studio', 3147, 'In dolore incidunt fugit. Fuga doloremque explicabo velit consequatur. Inventore harum ducimus aliquam vitae dicta. Distinctio voluptate quos corrupti quam quae.'),
(20, 20, '4849 Ashford Drive', 'Virginia Beach', 'Virginia', '23451', 689382.1, 'Apartment', 2106, 'Ipsam assumenda possimus dolorem itaque itaque. Illo dolorum quas magnam sed officiis. Provident laudantium quis eligendi. Beatae ratione dignissimos.'),
(21, 39, '8643 Augusta Park', 'Atlanta', 'Georgia', '30303', 293128.08, 'Apartment', 1797, 'Officia et ad rerum. Doloremque alias doloremque ipsum. Deleniti illum blanditiis illum id ducimus. Sapiente officiis libero nulla.'),
(22, 22, '6702 Sunset Drive', 'Miami', 'Florida', '33101', 728928.65, 'Villa', 4793, 'Optio reprehenderit possimus itaque magnam. Nulla neque ad quibusdam quidem. Nam dicta provident ea a. Nobis omnis qui pariatur voluptatum eius at provident. Inventore aperiam sit.'),
(23, 21, '9594 Lakeview Avenue', 'Minneapolis', 'Minnesota', '55401', 897645.74, 'Studio', 980, 'Harum molestias cum repudiandae. Eligendi quaerat quis tempora natus similique atque dolores. Quos ea modi explicabo.'),
(24, 28, '1230 Maple Street', 'Las Vegas', 'Nevada', '89101', 234596.4, 'Townhouse', 3409, 'Perferendis quae magnam nisi. Libero alias commodi fugiat laboriosam sit rerum. Accusantium voluptas sapiente soluta. Dicta asperiores quibusdam hic animi quae eum eos. A labore minus perspiciatis.'),
(25, 33, '784 Oakwood Avenue', 'New York', 'New York', '10001', 218199.78, 'Studio', 4998, 'Quibusdam similique provident voluptas voluptatibus. Dolor dolores iusto animi. Omnis tenetur laboriosam nemo deserunt necessitatibus. Rem aperiam cupiditate. Enim qui ut quae.'),
(26, 44, '4378 Ridge Road', 'Wichita', 'Kansas', '67202', 342149.16, 'Apartment', 3834, 'Voluptatem deleniti sequi asperiores veniam quaerat ullam. Ut sed error pariatur sint deserunt blanditiis. Nihil non laboriosam. Ut sit placeat assumenda ipsa dolorem amet.'),
(27, 6, '6692 Cedar Street', 'Columbus', 'Ohio', '43215', 467000.11, 'Studio', 325, 'Occaecati ad repellendus reiciendis voluptates sapiente ratione. Magni facilis aliquid. Alias nesciunt voluptate quos amet voluptate.'),
(28, 22, '2219 Locust Street', 'Charlotte', 'North Carolina', '28202', 990896.96, 'Townhouse', 2826, 'Necessitatibus fugit hic aliquid blanditiis nobis ducimus. Eos numquam a.'),
(29, 31, '4747 College Street', 'Atlanta', 'Georgia', '30303', 242444.1, 'Apartment', 1968, 'Facere earum autem tenetur suscipit enim quod. Cumque mollitia dolores praesentium saepe. In dolore sit nobis deserunt. Reiciendis magni quas impedit minima.'),
(30, 33, '1720 Railroad Street', 'Pittsburgh', 'Pennsylvania', '15201', 132041.26, 'Villa', 4982, 'Aperiam ex repudiandae ullam ipsa. Architecto doloribus vitae culpa id. Et earum maiores dicta architecto dolorem.'),
(31, 22, '857 Still Street', 'Toledo', 'Ohio', '43604', 125895.7, 'Villa', 2194, 'Eaque ipsa impedit. Id in animi velit eligendi iure magnam. Culpa esse incidunt. Ipsam quibusdam voluptate velit. Voluptas quisquam incidunt quaerat nisi esse.'),
(32, 9, '2844 Cherry Tree Drive', 'Jacksonville', 'Florida', '32202', 66687.51, 'Townhouse', 3320, 'Enim nam amet impedit optio ab modi explicabo. A nobis veniam laboriosam fugit qui repellat. Accusamus rerum aut debitis omnis dolores.'),
(33, 25, '4155 Ritter Avenue', 'Detroit', 'Michigan', '48201', 324701.04, 'Apartment', 487, 'Adipisci ipsum modi consequuntur sequi quasi. Libero hic eveniet animi eos vel. Velit fugit nostrum expedita corporis velit at incidunt.'),
(34, 13, '2596 Broadway Street', 'San Diego', 'California', '92101', 900110.14, 'Apartment', 2655, 'Quos dolor nihil assumenda ducimus dignissimos earum. Quam pariatur soluta aut natus aliquid ea numquam. Reiciendis quam deleniti labore cum sit.'),
(35, 45, '2031 Myra Street', 'Providence', 'Rhode Island', '02903', 925021.24, 'Apartment', 1448, 'Provident natus fuga totam reprehenderit. Voluptatibus cupiditate iure officiis ea accusantium. Rem quo nostrum eaque. In perspiciatis tempore.'),
(36, 1, '4563 Poling Farm Road', 'Omaha', 'Nebraska', '68102', 840296.18, 'Apartment', 1764, 'Repellendus nulla neque magnam distinctio. Deserunt illum mollitia numquam sed facere quas occaecati.'),
(37, 20, '1805 Johnson Street', 'Madison', 'Wisconsin', '53703', 55429.63, 'Townhouse', 3618, 'Similique sed molestiae optio quidem optio et. Aliquid officiis quam. Minus culpa facilis fugit sapiente eaque modi. Placeat cum ipsum officia libero est.'),
(38, 28, '4752 Prospect Valley Road', 'Los Angeles', 'California', '90017', 502084.55, 'Villa', 3482, 'Enim officiis voluptatum pariatur ad. Neque illum labore voluptate. Placeat hic veniam eos accusantium nam. Quas voluptas dolores animi hic debitis consectetur.'),
(39, 39, '3593 Lonely Oak Drive', 'Mobile', 'Alabama', '36602', 259095.31, 'Apartment', 817, 'Sequi voluptates sunt commodi laboriosam ipsa repellendus. Quas aliquid totam sed totam. Hic quod earum.'),
(40, 1, '2272 Small Street', 'New York', 'New York', '10011', 934422.2, 'Villa', 4632, 'Illo ducimus ab unde sequi. Reprehenderit eum maiores accusamus provident quod asperiores. Dicta consequatur ex libero ea nemo.'),
(41, 30, '946 Summit Park Avenue', 'Memphis', 'Tennessee', '38104', 824456.81, 'Studio', 698, 'Ullam architecto qui sint sequi repellendus. Ea sunt officia sequi fugiat voluptatibus optio. Reprehenderit sapiente cum blanditiis.'),
(42, 4, '2267 Burning Memory Lane', 'Philadelphia', 'Pennsylvania', '19108', 556118.38, 'Townhouse', 4297, 'Omnis alias repudiandae in dicta hic. Repellat at perspiciatis doloremque commodi officiis officiis. Odio unde asperiores omnis cum nesciunt velit. Illo ratione nobis impedit voluptatem harum dolor.'),
(43, 35, '3642 Quiet Valley Lane', 'Sherman Oaks', 'California', '91403', 494766.64, 'Apartment', 2853, 'Dolorum quo consectetur tempore eaque. Occaecati eligendi qui et. Minima quo quas rem.'),
(44, 22, '2910 Meadowbrook Mall Road', 'Beverly Hills', 'California', '90210', 226707.82, 'Townhouse', 1740, 'Aut natus nisi sequi praesentium. Perferendis dicta dicta quo. Est et facilis et minima. Sunt praesentium commodi non tempora nam. Ipsum a vel excepturi. Fugiat totam vel beatae eveniet provident.'),
(45, 47, '4018 Hiney Road', 'Las Vegas', 'Nevada', '89101', 215370.26, 'Studio', 394, 'Deleniti nulla reprehenderit enim. Quisquam natus perspiciatis quas. Doloribus sed nisi distinctio nihil. Aut debitis commodi esse esse. Nisi odit alias amet.'),
(46, 45, '2931 Mapleview Drive', 'Nashville', 'Tennessee', '37209', 964841.06, 'Villa', 506, 'Ab animi voluptatem quaerat laudantium. Deleniti nulla similique aut nulla cum. Beatae odit est maxime consequatur suscipit. Aliquam voluptatibus dolorem modi nulla. Error excepturi neque fugiat.'),
(47, 20, '4764 Eden Drive', 'Santa Rosa', 'California', '95401', 789081.11, 'Studio', 4312, 'Illo architecto necessitatibus dolores enim voluptate molestias. Aliquam fugit fugiat. Reprehenderit dignissimos impedit debitis suscipit occaecati.'),
(48, 4, '3678 Heavner Avenue', 'Cobb', 'Georgia', '31735', 263684.08, 'Townhouse', 1268, 'Perferendis dolorum ullam vitae aspernatur atque. Aspernatur rem praesentium neque sapiente totam deleniti. Ipsum tempora natus. Quaerat facere atque. Cum est illum nisi. Tempora at sunt hic.'),
(49, 35, '4820 Pooz Street', 'Denver', 'Colorado', '80202', 139743.93, 'Apartment', 1531, 'Cum a laborum. Tempore et deserunt nostrum aliquid. Vel iusto nisi esse excepturi voluptates iusto.'),
(50, 6, '3660 Quiet Valley Lane', 'Sherman Oaks', 'California', '91403', 258968.86, 'Studio', 1898, 'Omnis blanditiis recusandae. Molestias dolorem perferendis in nobis. Assumenda veniam doloribus praesentium consectetur non quis. Totam natus nihil. Itaque perspiciatis sunt dicta qui accusamus.');

--  INSERT statements for the LEASE table 
INSERT INTO LEASE (lease_id, property_id, renter_id, lease_start_date, lease_end_date)
VALUES
(1, 1, 1, '2023-01-01', '2024-01-01'),
(2, 2, 14, '2023-02-01', '2024-02-01'),
(3, 3, 16, '2023-03-01', '2024-03-01'),
(4, 4, 19, '2023-04-01', '2024-04-01'),
(5, 5, 20, '2023-05-01', '2024-05-01'),
(6, 6, 23, '2023-06-01', '2024-06-01'),
(7, 7, 24, '2023-07-01', '2024-07-01'),
(8, 8, 25, '2023-08-01', '2024-08-01'),
(9, 9, 27, '2023-09-01', '2024-09-01'),
(10, 10, 29, '2023-10-01', '2024-10-01'),
(11, 11, 30, '2023-11-01', '2024-11-01'),
(12, 12, 32, '2023-12-01', '2024-12-01'),
(13, 13, 33, '2024-01-01', '2025-01-01'),
(14, 14, 36, '2024-02-01', '2025-02-01'),
(15, 15, 38, '2024-03-01', '2025-03-01'),
(16, 16, 39, '2024-04-01', '2025-04-01'),
(17, 17, 40, '2024-05-01', '2025-05-01'),
(18, 18, 41, '2024-06-01', '2025-06-01'),
(19, 19, 42, '2024-07-01', '2025-07-01'),
(20, 20, 46, '2024-08-01', '2025-08-01'),
(21, 21, 47, '2024-09-01', '2025-09-01');


-- Inserting payment data for each lease
INSERT INTO PAYMENT (payment_id, lease_id, amount, payment_date, transaction_id) VALUES
(1, 1, 25000.00, '2023-02-01', 'TXN20230101'),
(2, 2, 25500.00, '2023-03-01', 'TXN20230201'),
(3, 3, 26000.00, '2023-04-01', 'TXN20230301'),
(4, 4, 26500.00, '2023-05-01', 'TXN20230401'),
(5, 5, 27000.00, '2023-06-01', 'TXN20230501'),
(6, 6, 27500.00, '2023-07-01', 'TXN20230601'),
(7, 7, 28000.00, '2023-08-01', 'TXN20230701'),
(8, 8, 28500.00, '2023-09-01', 'TXN20230801'),
(9, 9, 29000.00, '2023-10-01', 'TXN20230901'),
(10, 10, 29500.00, '2023-11-01', 'TXN20231001'),
(11, 11, 30000.00, '2023-12-01', 'TXN20231101'),
(12, 12, 30500.00, '2024-01-01', 'TXN20231201'),
(13, 13, 31000.00, '2024-02-01', 'TXN20240101'),
(14, 14, 31500.00, '2024-03-01', 'TXN20240201'),
(15, 15, 32000.00, '2024-04-01', 'TXN20240301'),
(16, 16, 32500.00, '2024-05-01', 'TXN20240401'),
(17, 17, 33000.00, '2024-06-01', 'TXN20240501'),
(18, 18, 33500.00, '2024-07-01', 'TXN20240601'),
(19, 19, 34000.00, '2024-08-01', 'TXN20240701'),
(20, 20, 34500.00, '2024-09-01', 'TXN20240801'),
(21, 21, 35000.00, '2024-10-01', 'TXN20240901');


-- Inserting data into the BROKER_FIRM table
INSERT INTO BROKER_FIRM (broker_firm_id, broker_firm_name, broker_firm_address, brokerage_rates) VALUES
(1, 'CSR Estates', '123 Oak St', 3.75),
(2, 'Urban Living', '456 Pine St', 4.00),
(3, 'Skyline Realty', '789 Maple Ave', 3.90),
(4, 'Horizon Properties', '101 Birch Rd', 4.25),
(5, 'Greenwood Brokers', '202 Elm St', 3.50),
(6, 'Sunset Realty', '303 Cedar St', 3.50),
(7, 'Golden Gate Brokers', '505 Walnut Ave', 4.25),
(8, 'Silver Lining Realty', '707 Spruce St', 3.75),
(9, 'Blue Horizon Properties', '909 Pine St', 4.00),
(10, 'Evergreen Estates', '1111 Maple Ave', 3.90),
(11, 'Pioneer Realty', '1212 Oak St', 4.50),
(12, 'Summit Brokers', '1313 Elm St', 3.25),
(13, 'Crimson Realty', '1414 Birch Rd', 4.10),
(14, 'Aurora Properties', '1515 Cedar St', 3.80),
(15, 'Cascade Brokers', '1616 Walnut Ave', 4.20);

-- Inserting data into the BROKER table
INSERT INTO BROKER (broker_id, broker_name, license_id, broker_firm_id) VALUES
(1, 'Praveen Royal', 'LIC001', 1),
(2, 'sreshta', 'LIC002', 2),
(3, 'Alex Johnson', 'LIC003', 3),
(4, 'Patricia Lee', 'LIC004', 4),
(5, 'Chris Green', 'LIC005', 5),
(6, 'Sam Taylor', 'LIC006', 6),
(7, 'Robin Brown', 'LIC007', 7),
(8, 'Dana White', 'LIC008', 8),
(9, 'Emily Martinez', 'LIC009', 9),
(10, 'Kevin Nguyen', 'LIC010', 10);

-- Inserting data into the PROPERTY_LISTING table for all property IDs
INSERT INTO PROPERTY_LISTING (property_id, broker_firm_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5),
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5),
(26, 1),
(27, 2),
(28, 3),
(29, 4),
(30, 5),
(31, 1),
(32, 2),
(33, 3),
(34, 4),
(35, 5),
(36, 1),
(37, 2),
(38, 3),
(39, 4),
(40, 5),
(41, 1),
(42, 2),
(43, 3),
(44, 4),
(45, 5),
(46, 1),
(47, 2),
(48, 3),
(49, 4),
(50, 5);

-- INSERT statements for the brokerage table
INSERT INTO brokerage (renter_id, broker_firm_id, broker_fee) VALUES
(1, 1, 5000.00),
(14, 2, 5500.00),
(16, 3, 6000.00),
(19, 4, 4500.00),
(20, 5, 5000.00),
(23, 1, 5200.00),
(24, 2, 5300.00),
(25, 3, 5400.00),
(27, 4, 5600.00),
(29, 5, 5700.00),
(30, 1, 5800.00),
(32, 2, 5900.00),
(33, 3, 6000.00),
(36, 4, 6100.00),
(38, 5, 6200.00),
(39, 1, 6300.00),
(40, 2, 6400.00),
(41, 3, 6500.00),
(42, 4, 6600.00),
(46, 5, 6700.00),
(47, 1, 6800.00);




