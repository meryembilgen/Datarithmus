--1. Which SQL statement is used to modify existing data in a table?  B) UPDATE
--2. What keyword is used to sort the result set in SQL?  B) ORDER BY
--3. Question: Write a query to select the names and insurance IDs of all patients in the Patient table.

SELECT Name, InsuranceID
FROM Patient

--4. Question: How would you retrieve the details of doctors from the Physician table whose position is ‘Surgical Attending Physician’? 
  
SELECT *
FROM Physician
WHERE position = 'Surgical Attending Physician'

--5. Question: Write a query to find the total number of patients in the Patient table.
  
SELECT COUNT(*) AS Total_Patients
FROM Patient

--6. Question: What is the primary affiliated physician for each department Hint: use following tables: Physician, Department, Affiliated_With 

SELECT d.Name Department_Name , p.Name Physician_Name
FROM Department d
JOIN Affiliated_With aw ON d.DepartmentID = aw.Department
JOIN Physician p ON aw.Physician = p.EmployeeID
WHERE aw.PrimaryAffiliation == '1'

--7. Question: How many patients are assigned to each physician in the Appointment table? 

SELECT p.Name Physician_Name, COUNT(a.Patient) AS Total_Patients
FROM Appointment a
JOIN Physician p ON a.Physician = p.EmployeeID
GROUP BY p.EmployeeID

--8. Question: Write a query to list all appointments along with the names of the patients and their doctors.

SELECT a.AppointmentID, pa.Name Patient_Name, ph.Name Physician_Name
FROM Appointment a
JOIN Patient pa ON a.Patient = pa.SSN
JOIN Physician ph ON a.Physician = ph.EmployeeID 

--9. Question: Write a query to find the names of patients who have more than one appointment. 

SELECT p.Name Patient_Name, COUNT(a.AppointmentID) AS Appointments
FROM Patient p 
JOIN Appointment a ON p.SSN = a.Patient
GROUP BY p.SSN
HAVING COUNT(a.AppointmentID) > 1 
  
--10. Question: How would you find the name of the patient and the medication name that is given to them? (Hint: use Patient, Prescribes, Medication tables) 

SELECT pa.Name Patient_Name, m.Name Medication
FROM Patient pa
JOIN Prescribes pr ON pa.SSN = pr.Patient
JOIN Medication m ON pr.Medication = m.Code 


