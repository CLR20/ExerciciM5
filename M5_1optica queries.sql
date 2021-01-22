-- INSERT INTO address VALUES (DEFAULT, 'address1', 1, 1, 'a', 'city1', 11111, 'country1', 111111111, 111111111, '11111111a', DEFAULT);
-- INSERT INTO address VALUES (DEFAULT, 'address2', 2, 2, 'b', 'city2', 22222, 'country2', 222222222, 222222222, '22222222b', DEFAULT);
-- INSERT INTO address VALUES (DEFAULT, 'address3', 3, 3, 'c', 'city3', 33333, 'country3', 333333333, 333333333, '33333333c', DEFAULT);
-- INSERT INTO address VALUES (DEFAULT, 'address4', 4, 4, 'd', 'city3', 33333, 'country3', 444444444, 444444444, '44444444d', DEFAULT);
-- INSERT INTO address VALUES (DEFAULT, 'address5', 5, 5, 'e', 'city5', 55555, 'country5', 555555555, DEFAULT, DEFAULT, 'a@gmail.com');
-- INSERT INTO address VALUES (DEFAULT, 'address6', 6, 6, 'f', 'city6', 66666, 'country6', 666666666, DEFAULT, DEFAULT, 'b@gmail.com');
-- INSERT INTO address VALUES (DEFAULT, 'address7', 7, 7, 'g', 'city6', 66666, 'country6', 777777777, DEFAULT, DEFAULT, 'c@gmail.com');

-- INSERT INTO suppliers VALUES (DEFAULT, 'supplier1');
-- INSERT INTO suppliers VALUES (DEFAULT, 'supplier2');
-- INSERT INTO suppliers VALUES (DEFAULT, 'supplier3');
-- INSERT INTO suppliers VALUES (DEFAULT, 'supplier4');

-- INSERT INTO suppliers_addresses VALUES (DEFAULT, 1, 1);
-- INSERT INTO suppliers_addresses VALUES (DEFAULT, 2, 2);
-- INSERT INTO suppliers_addresses VALUES (DEFAULT, 3, 3);
-- INSERT INTO suppliers_addresses VALUES (DEFAULT, 4, 4);

-- INSERT INTO brands VALUES (DEFAULT, 'brand1', 1);
-- INSERT INTO brands VALUES (DEFAULT, 'brand2', 2);
-- INSERT INTO brands VALUES (DEFAULT, 'brand3', 3);
-- INSERT INTO brands VALUES (DEFAULT, 'brand4', 3);
-- INSERT INTO brands VALUES (DEFAULT, 'brand5', 4);

-- INSERT INTO glasses VALUES (DEFAULT, 1, 1.1, 2.2, 'float', 'black', 'transp', 'transp', 109.99);
-- INSERT INTO glasses VALUES (DEFAULT, 2, 2.1, 2.2, 'plastic', 'white', 'black', 'black', 119.99);
-- INSERT INTO glasses VALUES (DEFAULT, 3, 2.1, 2.2, 'metal', 'green', 'transp', 'transp', 129.99);
-- INSERT INTO glasses VALUES (DEFAULT, 3, 2.1, 2.2, 'float', 'red', 'black', 'black', 139.99);
-- INSERT INTO glasses VALUES (DEFAULT, 4, 2.1, 2.2, 'plastic', 'black', 'transp', 'transp', 149.99);
-- INSERT INTO glasses VALUES (DEFAULT, 4, 2.1, 2.2, 'metal', 'blue', 'black', 'black', 159.99);

-- INSERT INTO clients VALUES (DEFAULT, 'client1');
-- INSERT INTO clients VALUES (DEFAULT, 'client2');
-- INSERT INTO clients VALUES (DEFAULT, 'client3');

-- INSERT INTO clients_addresses VALUES (DEFAULT, 1, 5);
-- INSERT INTO clients_addresses VALUES (DEFAULT, 2, 6);
-- INSERT INTO clients_addresses VALUES (DEFAULT, 3, 7);

-- INSERT INTO recommended VALUES (DEFAULT, 1, NULL);
-- INSERT INTO recommended VALUES (DEFAULT, 2, 1);
-- INSERT INTO recommended VALUES (DEFAULT, 3, 1);

-- INSERT INTO seller VALUES (DEFAULT, 'seller1');
-- INSERT INTO seller VALUES (DEFAULT, 'seller2');
-- INSERT INTO seller VALUES (DEFAULT, 'seller3');

-- INSERT INTO sales VALUES (DEFAULT, 1, 1, 1);
-- INSERT INTO sales VALUES (DEFAULT, 2, 2, 2);
-- INSERT INTO sales VALUES (DEFAULT, 3, 3, 3);
-- INSERT INTO sales VALUES (DEFAULT, 1, 4, 1);
-- INSERT INTO sales VALUES (DEFAULT, 2, 5, 3);
-- INSERT INTO sales VALUES (DEFAULT, 3, 6, 2);

-- INSERT INTO culdampolla VALUES (DEFAULT, 1, 1, 1);
-- INSERT INTO culdampolla VALUES (DEFAULT, 2, 2, 2);
-- INSERT INTO culdampolla VALUES (DEFAULT, 3, 3, 3);
-- INSERT INTO culdampolla VALUES (DEFAULT, 4, 1, 4);
-- INSERT INTO culdampolla VALUES (DEFAULT, 5, 3, 5);
-- INSERT INTO culdampolla VALUES (DEFAULT, 6, 2, 6);

SELECT s.sales_id, g.glasses_name, g.glasses_frame, b.brands_name, sp.suppliers_name, a.address_phone 
	AS suppliers_phone, g.glasses_price, c.clients_name, c.clients_created, r.recommended_by
FROM culdampolla cda, glasses g, clients c, sales s, brands b, suppliers sp, recommended r, address a, 
	suppliers_addresses sa
WHERE (cda.glasses_glasses_id = g.glasses_id AND cda.clients_clients_id = c.clients_id 
	AND cda.sales_sales_id = s.sales_id AND b.brands_id = g.brands_brands_id 
	AND sp.suppliers_id = b.suppliers_suppliers_id AND c.clients_id = r.clients_clients_id
	AND sa.suppliers_suppliers_id = b.suppliers_suppliers_id AND sa.address_address_id = a.address_id)
ORDER BY s.sales_id