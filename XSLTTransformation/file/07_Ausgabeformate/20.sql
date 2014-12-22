SET SERVEROUTPUT ON;
DECLARE
 v_Teilnehmer pck_Unternehmen.texte := pck_Unternehmen.LiefereTeilnehmer(15);
BEGIN
 DBMS_OUTPUT.PUT_LINE(pck_unternehmen.LIefereUnternehmen(15));
 pck_unternehmen.CollAusgabe(pck_unternehmen.LIefereUnternehmen('Privatbank Essen'));
 pck_unternehmen.CollAusgabe(v_Teilnehmer);
END;