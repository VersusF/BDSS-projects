# MIMIC III
Summary of the tables

### Patient
Table representing a single patient.

Interesting fields:
- gender
- date of birth
- date of death
- date of death hospital DB
- date of death social security DB
- expire flag &rarr; if the patient died

### Admission
Table representing an admission, which is linked to a patient.
A patient can have multiple admission.

Interesting fields:
- subject id &rarr; patient
- admission time
- discharge time
- death time
- type ('ELECTIVE', 'URGENT', 'NEWBORN' or 'EMERGENCY')
- location (patient location prior to arriving to hospital)

Uninteresting fields such as marital status, language, religion...


### Drg codes
Table containing diagnosis related groups (DRG) codes for patients.
It's linked with an admission and a patient.

Interesting fields:
- severity
- mortality

The other fields are descriptions


### Microbiology events
Table containing microbiology information, including cultures and sensitivities. It's linked to an admission and a patient.

Interesting fields:
- date and time
- organism id and name
- isolated colony number
- antibiotic id and name
- interpretation


### Callout
The opposite of admission; the table contains information on the preparation and the discharge. It's linked to an admission and a patient.

Interesting fields:
TODO: I'm not enough bio to understand this...


### Diagnoses ICD
Table with the ICD diagnoses for patients. They are linked to an admission and a patient. 

The only interesting fields are sequence number (which gives the priority) and the ICD-9 code.


### CPT events
Table representing current procedural terminology. It's linked to an admission and a patient.

**N.B.** This could be a dimension, see CD, number, suffix...

Interesting fields:
- date
- cd, number and suffix &rarr; hierarchy of the code
- Ticket id


### Service
Lists services that a patient was admitted/transferred under.
It's linked to an admission and a patient

The only fields are transfer time, previous service and current service.


### Procedure ICD
Same as Diagnoses ICD but with procedures.


### Icustay
Defines ICU (Intensive care unit) stay in the DB. It's linked with admission and patient.

The only interesting field is LOS (Length of stay), together with in-time and out-time.

This table is connected with many others, so it's likely to be considered when building cubes.


### Prescription
Represents medical prescriptions, linked with an admission, a patient and an icustay.

Interesting fields:
- Start/End date
- Drug CD / GSN / NDC which are codes -> **Hierarchy** when using them as dimension

Other info as not relevant in cube design


### Transfer
Represent each location where a patient stays. It's linked with admission, patient and icustay.

Interesting fields:
- Type ('admit', 'transfer', 'discharge')
- Previous and current careunit (Values are in a table &rarr; groupable)
- Previous and current ward id
- In-time and out-time with LOS (length of stay)


### Caregivers
Represent a person who assists a patient. No interesting info


### Input events CV
**Note on input/output**: Input and outputs represent substancies to or from the patient collected with two different systems (CV and MV).

Table representing input events from CV. It's linked with admission, patient, icustay and a caregiver.

Interesting fields:
- time
- amount, rate and other numerical values useful only as measures


### Input events MV
Table representing input events from MV. It's linked with admission, patient, icustay and a caregiver.

Interesting fields:
- time
- amount, rate and other numerical values useful only as measures
- Category &rarr; this could be a hierarchy in a dimension


### Output events
Table representing output events. It's linked with admission, patient, icustay and a caregiver.

Interesting fields:
- time
- amount, rate and other numerical values useful only as measures


### Procedure events MV
No documentation provided at [mimic official documentation](https://mimic.physionet.org/mimictables/procedureevents_mv/)


### Note event
Only text annotations


### DItems
Table representing descriptions for items in ICU. It's a main table.

Interesting fields:
- Links to: the table which refers this item &rarr; potential hierarchy


### Chartevent
Biggest table in MIMIC, with 330M of lines. links to patient, admission, icustay, caregivers. It represents every charted data in the DB.

Interesting fields:
- date