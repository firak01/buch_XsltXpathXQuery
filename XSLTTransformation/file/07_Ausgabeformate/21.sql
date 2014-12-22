SELECT SUBSTR(',Frühstück,0,5,1,p', 
              INSTR(',Frühstück,0,5,1,p', ',', 1, 1)+1,
              (INSTR(',Frühstück,0,5,1,p', ',', 1, 2)-INSTR(',Frühstück,0,5,1,p', ',', 1, 1))-1)
  FROM dual;
  
SELECT (INSTR(',Frühstück,0,5,1,p', ',', 1, 2)-INSTR(',Frühstück,0,5,1,p', ',', 1, 1)) AS text
 FROM dual;
 
SELECT INSTR(',Frühstück,0,5,1,p', ',', 1, 2) AS text
 FROM dual;
 
SELECT SUBSTR(',Frühstück,0,5,1,p', 
              INSTR(',Frühstück,0,5,1,p', ',', 1, 5)+1,
              (INSTR(',Frühstück,0,5,1,p', ',', 1, 4)-INSTR(',Frühstück,0,5,1,p', ',', 1, 3))-1)
  FROM dual;