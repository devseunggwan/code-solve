SELECT
    YEAR(SALES_DATE) AS YEAR
    , MONTH(SALES_DATE) AS MONTH
    , COUNT(DISTINCT USER_ID) AS PURCHASED_USER
    , ROUND(COUNT(DISTINCT USER_ID) / (
        SELECT 
            COUNT(DISTINCT USER_ID)
        FROM
            USER_INFO
        WHERE
            YEAR(JOINED) = "2021"
    ), 1) AS PURCHASED_RATIO
FROM
    ONLINE_SALE
WHERE
    USER_ID IN (
        SELECT 
            USER_ID
        FROM
            USER_INFO
        WHERE
            YEAR(JOINED) = "2021"
            AND SALES_DATE IS NOT NULL
    )
GROUP BY
    YEAR, MONTH
ORDER BY
    1, 2