ALTER TABLE customer
ADD CONSTRAINT check_city CHECK(cus_city<>'mumbai');