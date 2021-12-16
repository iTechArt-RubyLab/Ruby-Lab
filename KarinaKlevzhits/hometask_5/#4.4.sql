SELECT
    "rental_duration",
    count(*) AS "total"
FROM
    "film"
GROUP BY
    "rental_duration";
