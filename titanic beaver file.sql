select * from meine_tabelle2;

SELECT COUNT("PassengerId") AS total_people
FROM meine_tabelle2;

SELECT
    Sex,
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM meine_tabelle2 WHERE Sex IN ('female', 'male', 'child')), 2) AS percentage
FROM
    (
        SELECT
            CASE
                WHEN "Age" < 18 THEN 'child'
                WHEN "Sex" = 'female' THEN 'female'
                ELSE 'male'
            END AS Sex
        FROM
            meine_tabelle2
        WHERE
            "Survived" = 'survived'
    ) AS subquery
GROUP BY
    Sex;
   
SELECT
    Pclass,
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM titanic WHERE Pclass IN (1, 2, 3)), 2) AS percentage
FROM
    titanic
WHERE
    Survived = 1
GROUP BY
    Pclass;
   
   
select * from titanic ;  
SELECT
    CASE
        WHEN fare <= 50 THEN 'Low Fare'
        WHEN fare > 50 AND fare <= 100 THEN 'Medium Fare'
        ELSE 'High Fare'
    END AS ticketpreis,
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM titanic), 2) AS percentage
FROM
    titanic
WHERE
    Survived = 1
GROUP BY
    ticketpreis
ORDER BY
    ticketpreis;
   
select * from meine_tabelle2;  
SELECT
    "Full_Name",
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM meine_tabelle2 mt), 2) AS percentage
FROM
    meine_tabelle2 
WHERE
    "Survived" = 'survived'
GROUP BY
    "Full_Name" ;
   
 select * from meine_tabelle2; 
SELECT
    CASE
        WHEN "SibSp" + "Parch" > 0 THEN 'mit familie'
        ELSE 'ohne familie'
    END AS familiestatus,
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM meine_tabelle2), 2) AS percentage
FROM
    meine_tabelle2
WHERE
    "Survived" = 'survived'
GROUP BY
    familiestatus;


select
	case
		when "Age" < 18 then 'kind'
		when "Age" >= 18
		and "Age" < 60 then 'erwachsen'
		else 'senior'
	end as alter_rolle,
	COUNT(*) as count,
	ROUND((COUNT(*) * 100.0) / (
	select
		COUNT(*)
	from
		meine_tabelle2),
	2) as percentage
from
	meine_tabelle2
where
	"Survived" = 'survived'
group by
	alter_rolle;

   
SELECT
    "SibSp",
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM meine_tabelle2), 2) AS percentage
FROM
    meine_tabelle2
WHERE
    "Survived" = 'survived'
GROUP BY
    "SibSp";
 
select * from meine_tabelle2;  
SELECT
    "Cabin",
    COUNT(*) AS count,
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM meine_tabelle2), 2) AS percentage
FROM
    meine_tabelle2
WHERE
    "Survived" = 'survived'
GROUP BY
    "Cabin";
 

