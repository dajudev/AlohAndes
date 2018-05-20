SELECT RESERVAS.FECHALLEGADA, TO_CHAR(RESERVAS.FECHALLEGADA,'YYYY') as year,TO_CHAR(RESERVAS.FECHALLEGADA,'iw') as week, TO_CHAR(RESERVAS.FECHALLEGADA,'mon') as month,TO_CHAR(RESERVAS.FECHALLEGADA,'dd') as day, OFERTAS.PRECIOESTADIA
FROM RESERVAS, OFERTAS, ALOJAMIENTOS
WHERE RESERVAS.OFERTA=OFERTAS.ID
AND ALOJAMIENTOS.ID = OFERTAS.ALOJAMIENTOID
AND ALOJAMIENTOS.TIPO='Apartamento';

--Base
SELECT TO_CHAR(RESERVAS.FECHALLEGADA,'YYYY') as periodo, sum(OFERTAS.PRECIOESTADIA*RESERVAS.CANTIDADDIAS)AS ingresos, count(*) as numreservas
FROM RESERVAS, OFERTAS, ALOJAMIENTOS
WHERE RESERVAS.OFERTA=OFERTAS.ID
AND ALOJAMIENTOS.ID = OFERTAS.ALOJAMIENTOID
AND ALOJAMIENTOS.TIPO='Apartamento' 
group by TO_CHAR(RESERVAS.FECHALLEGADA,'YYYY');

SELECT TO_CHAR(RESERVAS.FECHALLEGADA,'YYYY') as periodo, sum(OFERTAS.PRECIOESTADIA*RESERVAS.CANTIDADDIAS)AS ingresos, count(*) as numreservas
FROM RESERVAS, OFERTAS, ALOJAMIENTOS
WHERE RESERVAS.OFERTA=OFERTAS.ID
AND ALOJAMIENTOS.ID = OFERTAS.ALOJAMIENTOID
AND ALOJAMIENTOS.TIPO='Apartamento' 
group by TO_CHAR(RESERVAS.FECHALLEGADA,'YYYY');

--Mayor demanda
SELECT * FROM(
SELECT TO_CHAR(RESERVAS.FECHALLEGADA,'YYYY') as periodo, sum(OFERTAS.PRECIOESTADIA*RESERVAS.CANTIDADDIAS)AS ingresos, count(*) as numreservas
FROM RESERVAS, OFERTAS, ALOJAMIENTOS
WHERE RESERVAS.OFERTA=OFERTAS.ID
AND ALOJAMIENTOS.ID = OFERTAS.ALOJAMIENTOID
AND ALOJAMIENTOS.TIPO='Apartamento' 
group by TO_CHAR(RESERVAS.FECHALLEGADA,'YYYY')
order by count(*) desc)
WHERE rownum<=1;

--Menor ocupacion
SELECT * FROM(
SELECT extract(year from RESERVAS.FECHALLEGADA) as year, sum(OFERTAS.PRECIOESTADIA*RESERVAS.CANTIDADDIAS)AS ingresos, count(*) as numreservas
FROM RESERVAS, OFERTAS, ALOJAMIENTOS
WHERE RESERVAS.OFERTA=OFERTAS.ID
AND ALOJAMIENTOS.ID = OFERTAS.ALOJAMIENTOID
AND ALOJAMIENTOS.TIPO='Apartamento' 
group by extract(year from RESERVAS.FECHALLEGADA)
order by count(*) asc)
WHERE rownum<=1;

--Mayor ingresos
SELECT * FROM(
SELECT extract(year from RESERVAS.FECHALLEGADA) as year, sum(OFERTAS.PRECIOESTADIA*RESERVAS.CANTIDADDIAS)AS ingresos, count(*) as numreservas
FROM RESERVAS, OFERTAS, ALOJAMIENTOS
WHERE RESERVAS.OFERTA=OFERTAS.ID
AND ALOJAMIENTOS.ID = OFERTAS.ALOJAMIENTOID
AND ALOJAMIENTOS.TIPO='Apartamento' 
group by extract(year from RESERVAS.FECHALLEGADA)
order by sum(OFERTAS.PRECIOESTADIA*RESERVAS.CANTIDADDIAS) desc)
WHERE rownum<=1;