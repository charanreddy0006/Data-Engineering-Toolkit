INSERT INTO dim_date VALUES
(20260901, DATE '2026-09-01', 9, 2026),
(20260902, DATE '2026-09-02', 9, 2026);

INSERT INTO dim_vehicle
(vehicle_id, model_name, manufacturer, fuel_type)
VALUES
('V001','Model-A','AutoCorp','EV'),
('V002','Model-B','AutoCorp','Petrol'),
('V003','Model-C','MotoAuto','Hybrid');

INSERT INTO dim_customer
(customer_id, customer_segment, city)
VALUES
('C001','Premium','Hyderabad'),
('C002','Mass','Bengaluru'),
('C003','Premium','Chennai');

INSERT INTO dim_dealer
(dealer_id, dealer_name, region)
VALUES
('D001','Central Motors','South'),
('D002','Metro Auto','South');

INSERT INTO fact_sales
(date_key, vehicle_key, customer_key, dealer_key, invoice_number, quantity, net_amount)
VALUES
(20260901,1,1,1,'INV-001',1,2500000),
(20260901,2,2,1,'INV-002',1,1400000),
(20260902,3,3,2,'INV-003',1,1900000);
