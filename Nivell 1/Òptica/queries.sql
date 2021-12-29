-- Total de compres d'un client
/*SELECT c.nom, c.cognom1, m.nom, u.graduacio_v_dreta, u.graduacio_v_esquerra, u.tipus_muntura, u.preu, u.data_venta
FROM ulleres u
JOIN marca m
	ON u.marca_id_marca = m.id_marca
JOIN clients c 
	ON u.clients_id_client = c.id_client
WHERE u.clients_id_client = 1*/
-- diferents ulleres que ha venut un empleat durant un any
/*SELECT e.nom, cognom1, u.id_ulleres, u.tipus_muntura, u.preu, u.data_venta
FROM ulleres u
JOIN empleats e 
	ON u.empleats_id_empleat = e.id_empleat
WHERE e.id_empleat = 1 AND YEAR(data_venta)=2021*/
-- proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
/*SELECT u.id_ulleres, u.tipus_muntura, u.preu, u.data_venta, p.id, p.NIF, p.nom
FROM ulleres u
JOIN marca m
	ON u.marca_id_marca = m.id_marca
JOIN proveïdor p
	ON m.proveidor_id = p.id*/
