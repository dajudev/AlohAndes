SELECT SUM(RESERVAS.CANTIDADDIAS) AS DIAS
FROM RESERVAS, RESERVASCLIENTE
WHERE RESERVASCLIENTE.RESERVAID=RESERVAS.ID AND
RESERVASCLIENTE.CLIENTEID=98713;

SELECT SUM("A2"."CANTIDADDIAS") "DIAS" FROM "ISIS2304A021810"."RESERVAS" "A2","ISIS2304A021810"."RESERVASCLIENTE" "A1" WHERE "A1"."RESERVAID"="A2"."ID" AND "A1"."CLIENTEID"=98713;