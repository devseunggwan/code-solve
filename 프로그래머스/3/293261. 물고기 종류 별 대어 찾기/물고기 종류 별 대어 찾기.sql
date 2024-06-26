-- 코드를 작성해주세요
WITH CTE AS (
    SELECT
        FISH_TYPE,
        MAX(LENGTH) AS LENGTH
    FROM
        FISH_INFO
    GROUP BY
        FISH_TYPE
)
SELECT
    FI.ID AS ID,
    FNI.FISH_NAME AS FISH_NAME,
    FI.LENGTH AS LENGTH
FROM
    CTE
LEFT JOIN
    FISH_INFO FI
    ON CTE.FISH_TYPE = FI.FISH_TYPE AND CTE.LENGTH = FI.LENGTH
LEFT JOIN
    FISH_NAME_INFO FNI
    ON FI.FISH_TYPE = FNI.FISH_TYPE
ORDER BY
    1