SELECT SUBSTR(',Fr�hst�ck,0,5,1,p', 
              INSTR(',Fr�hst�ck,0,5,1,p', ',', 1, 1)+1,
              (INSTR(',Fr�hst�ck,0,5,1,p', ',', 1, 2)-INSTR(',Fr�hst�ck,0,5,1,p', ',', 1, 1))-1)
  FROM dual;
  
SELECT (INSTR(',Fr�hst�ck,0,5,1,p', ',', 1, 2)-INSTR(',Fr�hst�ck,0,5,1,p', ',', 1, 1)) AS text
 FROM dual;
 
SELECT INSTR(',Fr�hst�ck,0,5,1,p', ',', 1, 2) AS text
 FROM dual;
 
SELECT SUBSTR(',Fr�hst�ck,0,5,1,p', 
              INSTR(',Fr�hst�ck,0,5,1,p', ',', 1, 5)+1,
              (INSTR(',Fr�hst�ck,0,5,1,p', ',', 1, 4)-INSTR(',Fr�hst�ck,0,5,1,p', ',', 1, 3))-1)
  FROM dual;