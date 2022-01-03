-- Llista quants productes de tipus 'Begudas' s'han venut en una determinada localitat
/*SELECT c.id, c.data_hora_comanda, c.tipus_entrega, c.botiga_id, b.localitat_id, l.nom, SUM(quant_begudes)
FROM comandes c
JOIN botiga b
	ON c.botiga_id = b.id
JOIN localitat l
	ON b.localitat_id = l.id
WHERE l.id = 3*/

-- Llista quantes comandes ha efectuat un determinat empleat

-- si l'empleat és repartidor
/*SELECT *, COUNT(id_comanda)
FROM repartiment_domicili
WHERE id_empleat = 2*/

-- si l'empleat és cuiner. Tenint en compte les comandes de la botiga i considerant que el cuiner participa en totes elles.
/*SELECT *, COUNT(c.id)
FROM comandes c
JOIN empleats e
	ON c.botiga_id = e.idbotiga
WHERE botiga_id = 1 AND posicio = 'cuiner'*/

