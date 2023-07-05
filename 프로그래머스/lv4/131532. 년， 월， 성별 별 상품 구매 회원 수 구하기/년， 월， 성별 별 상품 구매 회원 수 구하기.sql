SELECT
    YEAR(ONLINE_SALE.SALES_DATE) AS YEAR
    , MONTH(ONLINE_SALE.SALES_DATE) AS MONTH
    , USER_INFO.GENDER
    , COUNT(DISTINCT USER_INFO.USER_ID) AS USERS
FROM
    USER_INFO
        INNER JOIN ONLINE_SALE 
        ON USER_INFO.USER_ID = ONLINE_SALE.USER_ID
WHERE
    USER_INFO.GENDER IS NOT NULL
GROUP BY
    1, 2, 3
ORDER BY
    1, 2, 3