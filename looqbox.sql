-- 1: What are the 10 most expensive products in the company?
SELECT
    PRODUCT_NAME,
    PRODUCT_VAL
FROM data_product
ORDER BY PRODUCT_VAL DESC
LIMIT 10;


-- 2: What sections do the 'BEBIDAS' and 'PADARIA' departments have?

SELECT
    DEP_NAME,
    SECTION_NAME 
FROM data_product
WHERE DEP_NAME IN ('BEBIDAS', 'PADARIA')
GROUP BY DEP_NAME, SECTION_NAME
ORDER BY DEP_NAME ASC;

-- 3: What was the total sale of products (in $) of
-- each Business Area in the first quarter of 2019?

SELECT
    sc.BUSINESS_NAME as BUSINESS_AREA,
    ROUND(SUM(ps.SALES_VALUE), 2) AS TOTAL_SALES
FROM data_product_sales ps
JOIN data_store_cad sc ON ps.STORE_CODE = sc.STORE_CODE
WHERE ps.DATE BETWEEN '2019-01-01' AND '2019-03-31'
GROUP BY sc.BUSINESS_NAME
ORDER BY TOTAL_SALES DESC;