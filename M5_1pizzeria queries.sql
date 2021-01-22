-- INSERT INTO provinces VALUES (DEFAULT, 'province1');
-- INSERT INTO provinces VALUES (DEFAULT, 'province2');
-- INSERT INTO provinces VALUES (DEFAULT, 'province3');
-- INSERT INTO provinces VALUES (DEFAULT, 'province4');

-- INSERT INTO towns VALUES (DEFAULT, 'town1', 1);
-- INSERT INTO towns VALUES (DEFAULT, 'town2', 2);
-- INSERT INTO towns VALUES (DEFAULT, 'town3', 3);
-- INSERT INTO towns VALUES (DEFAULT, 'town4', 4);

-- INSERT INTO address VALUES (DEFAULT, 'address1', 11111, 1);
-- INSERT INTO address VALUES (DEFAULT, 'address2', 22222, 2);
-- INSERT INTO address VALUES (DEFAULT, 'address3', 33333, 3);
-- INSERT INTO address VALUES (DEFAULT, 'address4', 44444, 4);
-- INSERT INTO address VALUES (DEFAULT, 'address5', 55555, 1);
-- INSERT INTO address VALUES (DEFAULT, 'address6', 66666, 2);

-- INSERT INTO clients VALUES (DEFAULT, 'client1', 'lastname1', 111111111);
-- INSERT INTO clients VALUES (DEFAULT, 'client2', 'lastname2', 222222222);
-- INSERT INTO clients VALUES (DEFAULT, 'client3', 'lastname3', 333333333);

-- INSERT INTO clientstoaddress VALUES (DEFAULT, 1, 4);
-- INSERT INTO clientstoaddress VALUES (DEFAULT, 2, 5);
-- INSERT INTO clientstoaddress VALUES (DEFAULT, 3, 6);

-- INSERT INTO shops VALUES (DEFAULT, 'shop1');
-- INSERT INTO shops VALUES (DEFAULT, 'shop2');
-- INSERT INTO shops VALUES (DEFAULT, 'shop3');

-- INSERT INTO shopstoaddress VALUES (DEFAULT, 1, 1);
-- INSERT INTO shopstoaddress VALUES (DEFAULT, 2, 2);
-- INSERT INTO shopstoaddress VALUES (DEFAULT, 3, 3);

-- INSERT INTO worker VALUES (DEFAULT, 'worker1', '11111111a', 111111111, 'cook', 1);
-- INSERT INTO worker VALUES (DEFAULT, 'worker2', '22222222b', 222222222, 'rider', 2);
-- INSERT INTO worker VALUES (DEFAULT, 'worker3', '33333333c', 333333333, 'cook', 3);
-- INSERT INTO worker VALUES (DEFAULT, 'worker4', '44444444d', 444444444, 'rider', 1);
-- INSERT INTO worker VALUES (DEFAULT, 'worker5', '55555555e', 555555555, 'cook', 2);
-- INSERT INTO worker VALUES (DEFAULT, 'worker6', '66666666f', 666666666, 'rider', 3);

-- INSERT INTO categories VALUES (DEFAULT, 'category1');
-- INSERT INTO categories VALUES (DEFAULT, 'category2');
-- INSERT INTO categories VALUES (DEFAULT, 'category3');
-- INSERT INTO categories VALUES (DEFAULT, '-');

-- INSERT INTO products VALUES (DEFAULT, 'pizza1', 'pizza', 1, 'url1', 8.9);
-- INSERT INTO products VALUES (DEFAULT, 'burguer1', 'burguer', 4, 'url2', 5.9);
-- INSERT INTO products VALUES (DEFAULT, 'drink1', 'drink', 4, 'url3', 2.9);
-- INSERT INTO products VALUES (DEFAULT, 'pizza2', 'pizza', 2, 'url4', 9.9);
-- INSERT INTO products VALUES (DEFAULT, 'burguer2', 'burguer', 4, 'url5', 6.9);
-- INSERT INTO products VALUES (DEFAULT, 'drink2', 'drink', 4, 'url6', 3.9);
-- INSERT INTO products VALUES (DEFAULT, 'pizza3', 'pizza', 3, 'url7', 10.9);
-- INSERT INTO products VALUES (DEFAULT, 'burguer3', 'burguer', 4, 'url8', 7.9);
-- INSERT INTO products VALUES (DEFAULT, 'drink3', 'drink', 4, 'url9', 4.9);

-- INSERT INTO orders VALUES (DEFAULT, DEFAULT, 'home', 1, NULL);
-- INSERT INTO orders VALUES (DEFAULT, DEFAULT, 'pickup', 2, NULL);
-- INSERT INTO orders VALUES (DEFAULT, DEFAULT, 'home', 3, NULL);
-- INSERT INTO orders VALUES (DEFAULT, DEFAULT, 'pickup', 3, NULL);
-- INSERT INTO orders VALUES (DEFAULT, DEFAULT, 'home', 2, NULL);
-- INSERT INTO orders VALUES (DEFAULT, DEFAULT, 'pickup', 1, NULL);

-- INSERT INTO delivery VALUES (DEFAULT, 2, 2, DEFAULT);
-- INSERT INTO delivery VALUES (DEFAULT, 4, 4, DEFAULT);
-- INSERT INTO delivery VALUES (DEFAULT, 6, 6, DEFAULT);

 -- INSERT INTO clientstoorders VALUES (DEFAULT, 1, 1);
 -- INSERT INTO clientstoorders VALUES (DEFAULT, 2, 2);
 -- INSERT INTO clientstoorders VALUES (DEFAULT, 3, 3);
 -- INSERT INTO clientstoorders VALUES (DEFAULT, 3, 4);
 -- INSERT INTO clientstoorders VALUES (DEFAULT, 2, 5);
 -- INSERT INTO clientstoorders VALUES (DEFAULT, 1, 6);

 -- INSERT INTO ordered VALUES (DEFAULT, 1, 1, 1, NULL);
 -- INSERT INTO ordered VALUES (DEFAULT, 2, 2, 2, NULL);
 -- INSERT INTO ordered VALUES (DEFAULT, 2, 3, 3, NULL);
 -- INSERT INTO ordered VALUES (DEFAULT, 3, 4, 1, NULL);
 -- INSERT INTO ordered VALUES (DEFAULT, 4, 5, 2, NULL);
 -- INSERT INTO ordered VALUES (DEFAULT, 5, 5, 1, NULL);
 -- INSERT INTO ordered VALUES (DEFAULT, 5, 6, 1, NULL);
 -- INSERT INTO ordered VALUES (DEFAULT, 6, 7, 2, NULL);
 -- INSERT INTO ordered VALUES (DEFAULT, 6, 8, 1, NULL);
 -- INSERT INTO ordered VALUES (DEFAULT, 6, 9, 3, NULL);

-- !!! Com podria fer això? perquè aquestes caselles s'omplin automàticament?
-- UPDATE ordered, products SET ordered_total = ordered.products_quantity * products.products_price WHERE (products.products_price = 9.9);
-- UPDATE orders, ordered, products SET orders_total = SUM(ordered.products_quantity * products.products_price)

SELECT o.id, o.delivery, p.name, p.type, ct.name, od.quantity, p.price, od.quantity * p.price AS product_total, s.name AS shop_name,
	a.location, c.name AS client_name, a.zip, t.name AS town, pv.name AS province
FROM orders o, ordered od, products p, categories ct, shops s, shopstoaddress sta, clientstoorders cto, clients c, address a, 
	clientstoaddress cta, towns t, provinces pv
WHERE (o.id = od.orders_id AND p.id = od.products_id AND ct.id = p.categories_id AND s.id = o.shops_id
	AND s.id = sta.shops_id AND c.id = cto.clients_id AND o.id = cto.orders_id AND s.id = sta.shops_id
    AND a.id = sta.address_id AND c.id = cta.clients_id AND t.id = a.towns_id AND pv.id = t.provinces_id)
ORDER BY o.id

-- Com puc fer perquè em sumi els totals de cada producte en una columna, i els totals de cada order en una altra?
-- Com puc fer un left join amb worker perquè em mostri tots els resultats tot i què hi hagi un worker què porti delivery?
