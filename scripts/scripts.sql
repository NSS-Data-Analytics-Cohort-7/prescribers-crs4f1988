-- 1. a. Which prescriber had the highest total number of claims (totaled over all drugs)? Report the npi and the total number of claims.
-- 1881634483

SELECT 
npi,
SUM(total_claim_count) AS total_claim
FROM prescription
GROUP BY 1
ORDER BY total_claim DESC;

SELECT COUNT(total_claim_count) AS total_claim, p1.npi
FROM prescription AS p1
LEFT JOIN prescriber AS p2
ON p1.npi = p2.npi
GROUP BY 1
ORDER BY total_claim DESC
LIMIT 10;
-- 