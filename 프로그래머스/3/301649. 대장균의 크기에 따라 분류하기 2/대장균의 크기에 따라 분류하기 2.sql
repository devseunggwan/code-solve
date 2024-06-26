-- 코드를 작성해주세요
WITH ECOLI_COUNT AS (
    SELECT
        COUNT(ID) AS VAL
    FROM
        ECOLI_DATA
)
SELECT
    ECOLI_RANK.ID,
    CASE
        WHEN (ECOLI_RANK.SIZE_RANK / ECOLI_COUNT.VAL) <= 0.25 THEN "CRITICAL"
        WHEN (ECOLI_RANK.SIZE_RANK / ECOLI_COUNT.VAL) > 0.25 AND (ECOLI_RANK.SIZE_RANK / ECOLI_COUNT.VAL) <= 0.5 THEN "HIGH"
        WHEN (ECOLI_RANK.SIZE_RANK / ECOLI_COUNT.VAL) > 0.5 AND (ECOLI_RANK.SIZE_RANK / ECOLI_COUNT.VAL) <= 0.75 THEN "MEDIUM"
        WHEN (ECOLI_RANK.SIZE_RANK / ECOLI_COUNT.VAL) > 0.75 AND (ECOLI_RANK.SIZE_RANK / ECOLI_COUNT.VAL) <= 1 THEN "LOW"
    END AS COLONY_NAME
FROM
    (
        SELECT
            ID,
            RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS SIZE_RANK
        FROM
            ECOLI_DATA
        ORDER BY
            SIZE_OF_COLONY DESC
    ) ECOLI_RANK,
    ECOLI_COUNT
ORDER BY
    1 ASC