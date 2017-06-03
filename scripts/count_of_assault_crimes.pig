police_data = LOAD 'Police.tsv' USING PigStorage(',') AS (Year_of_Incident ,Incident_Number_wo_Year ,Call_911_Problem ,Type_of_Incident ,Type_of_Location ,Type_of_Property ,Zip_Code , City , State ,Reporting_Area , Beat , Sector , Council_District ,Day_of_Occ , Complainant_Name ,Complainant_Gender ,Complainant_Age ,Compainant_Age_at_Offense ,Complainant_Home_Address , Complainant_Apartment , Complainant_Zip_Code , Complainant_City );
incident_fields = FILTER police_data BY $0 MATCHES '.*ASSAULT.*';
inc_assault_group = GROUP incident_fields ALL;
inc_assault_count = FOREACH inc_assault_group GENERATE COUNT(incident_fields );
DUMP inc_assault_count;