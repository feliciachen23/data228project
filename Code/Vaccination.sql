SELECT A.jurisdiction,
         sum(A.M_first_dose) AS sum_M,
         sum(A.P_first_dose) AS sum_P,
         sum(A.M_first_dose) + sum(A.P_first_dose) AS total_per_state
FROM 
    (SELECT M.jurisdiction,
         M.first_dose_allocations AS M_first_dose,
         P.first_dose_allocations AS P_first_dose
    FROM cdc_moderna_vaccine_distribution M, cdc_pfizer_vaccine_distribution P
    WHERE M.jurisdiction = P.jurisdiction
            AND M.week_of_allocations = P.week_of_allocations) A
GROUP BY  A.jurisdiction
ORDER BY  A.jurisdiction; 