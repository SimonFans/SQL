# Get firstname
SELECT substring('Ximeng Zhao',1,CHARINDEX(' ', 'Ximeng Zhao')-1) AS MatchPosition;

# Get lastname
SELECT substring('Ximeng Zhao', CHARINDEX(' ', 'Ximeng Zhao')+1,len('Ximeng Zhao')) AS MatchPosition;
