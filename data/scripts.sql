-- 1. a. Which prescriber had the highest total number of claims (totaled over all drugs)? Report the npi and the total number of claims.
-- 1912011792 as NPI and Total_claim_count 4538
--
Select *
FROM prescriber;

Select * 
FROM Prescription;

SELECT
npi
total_claim_count
FROM prescription
GROUP BY 1
ORDER BY total_claim_count DESC;


Select p1.npi, p1.total_claim_count
from prescription AS p1
LEFT JOIN prescriber AS p2
ON p1.npi = p2.npi
GROUP BY p1.npi, p1.total_claim_count
ORDER by total_claim_count DESC;

SELECT COUNT(total_claim_count) AS total_claim, p1.npi
FROM prescription AS p1
LEFT JOIN prescriber AS p2
ON p1.npi = p2.npi
GROUP BY 1
ORDER BY total_claim DESC
LIMIT 10;
-- 
---1b
b. Repeat the above, but this time report the nppes_provider_first_name, nppes_provider_last_org_name,  specialty_description, and the total number of claims.
-- 
-- David Coffey, Family Practice, 4538
-- 
SELECT p1.npi, p2.nppes_provider_first_name, p2.nppes_provider_last_org_name, p2.specialty_description, p1.total_claim_count
FROM prescription AS p1
LEFT JOIN prescriber AS p2
ON p1.npi = p2.npi
GROUP BY p1.npi, p2.nppes_provider_first_name, p2.nppes_provider_last_org_name, p2.specialty_description, p1.total_claim_count
ORDER BY total_claim_count DESC;

-- 2. a. Which specialty had the most total number of claims (totaled over all drugs)?

Select p1.npi, p2.specialty_description, p1.total_claim_count, p1.drug_name
FROM prescription AS p1
LEFT JOIN prescriber AS p2
ON p1.npi = p2.npi
GROUP BY p1.npi, p2.specialty_description, p1.total_claim_count, p1.drug_name
ORDER BY total_claim_count DESC;

-- 