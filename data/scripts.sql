-- 1. a. Which prescriber had the highest total number of claims (totaled over all drugs)? Report the npi and the total number of claims.
-- 1912011792 as NPI and Total_claim_count 4538
--
Select *
FROM prescriber;

Select * 
FROM Prescription;

SELECT 
npi,
SUM(total_claim_count) AS total_claim
FROM prescription
GROUP BY 1
ORDER BY total_claim DESC;

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
-- 9752347

Select p2.specialty_description, SUM(p1.total_claim_count)
FROM prescription AS p1
LEFT JOIN prescriber AS p2
ON p1.npi = p2.npi 
GROUP BY p2.specialty_description
ORDER BY SUM(p1.total_claim_count) DESC;

-- 
SELECT *
FROM prescription
ORDER BY npi;

--     b. Which specialty had the most total number of claims for opioids?
--Nurse Practitioner

Select p2.specialty_description, SUM(p1.total_claim_count)
FROM prescription AS p1
LEFT JOIN prescriber AS p2
ON p1.npi = p2.npi 
LEFT JOIN drug AS d
ON p1.drug_name = d.drug_name
WHERE d.opioid_drug_flag = 'Y'
GROUP BY p2.specialty_description
ORDER BY SUM(p1.total_claim_count) DESC;

SELECT *
FROM drug;

-- 3. a. Which drug (generic_name) had the highest total drug cost?
-- Insulin Glargine,HUM.REC.ANLOG

SELECT d.generic_name, SUM(p1.total_drug_cost) AS drug_cost
FROM prescription AS p1
LEFT JOIN drug AS d
ON d.drug_name = p1.drug_name
GROUP BY d.generic_name
ORDER BY drug_cost DESC;

--  b. Which drug (generic_name) has the hightest total cost per day?
LEDIPASVIR

SELECT d.generic_name, ROUND(SUM(p1.total_drug_cost / p1.total_day_supply)) AS daily_drug_cost
FROM prescription AS p1
LEFT JOIN drug AS d
ON d.drug_name = p1.drug_name
GROUP BY d.generic_name
ORDER BY daily_drug_cost DESC;

SELECT *
FROM prescription;