Object.send(:remove_const, :Patient) if defined? (Patient)

class Patient < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
  
  one_to_many :admissions, key: :subject_id, primary_key: :subject_id, class: :Admission
  one_to_many :drgcodes, key: :subject_id, primary_key: :subject_id, class: :DrgCode
  one_to_many :microbiologyevents, key: :subject_id, primary_key: :subject_id, class: :MicrobiologyEvent
  one_to_many :callout, key: :subject_id, primary_key: :subject_id, class: :Callout
  one_to_many :diagnoses_icd, key: :subject_id, primary_key: :subject_id, class: :DiagnoseIcd
  one_to_many :icustays, key: :subject_id, primary_key: :subject_id, class: :Icustay
  one_to_many :datetimeevents, key: :subject_id, primary_key: :subject_id, class: :DateTimeEvent
  one_to_many :cptevents, key: :subject_id, primary_key: :subject_id, class: :CptEvent
  one_to_many :prescriptions, key: :subject_id, primary_key: :subject_id, class: :Prescription
  one_to_many :chartevents, key: :subject_id, primary_key: :subject_id, class: :ChartEvent
  one_to_many :transfers, key: :subject_id, primary_key: :subject_id, class: :Transfer
  one_to_many :inputevents_cv, key: :subject_id, primary_key: :subject_id, class: :InputEventCV
  one_to_many :noteevents, key: :subject_id, primary_key: :subject_id, class: :NoteEvent
  one_to_many :services, key: :subject_id, primary_key: :subject_id, class: :Service
  one_to_many :procedures_icd, key: :subject_id, primary_key: :subject_id, class: :ProcedureIcd
  one_to_many :outputevents, key: :subject_id, primary_key: :subject_id, class: :OutputEvent
  one_to_many :procedureevents_mv, key: :subject_id, primary_key: :subject_id, class: :ProcedureEventMV
  one_to_many :inputevents_mv, key: :subject_id, primary_key: :subject_id, class: :InputEventMV
end


Object.send(:remove_const, :Admission) if defined? (Admission)

class Admission < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  
  one_to_many :drgcodes, key: :hadm_id, primary_key: :hadm_id, class: :DrgCode
  one_to_many :microbiologyevents, key: :hadm_id, primary_key: :hadm_id, class: :MicrobiologyEvent
  one_to_many :callout, key: :hadm_id, primary_key: :hadm_id, class: :Callout
  one_to_many :diagnoses_icd, key: :hadm_id, primary_key: :hadm_id, class: :DiagnoseIcd
  one_to_many :icustays, key: :hadm_id, primary_key: :hadm_id, class: :Icustay
  one_to_many :datetimeevents, key: :hadm_id, primary_key: :hadm_id, class: :DateTimeEvent
  one_to_many :cptevents, key: :hadm_id, primary_key: :hadm_id, class: :CptEvent
  one_to_many :prescriptions, key: :hadm_id, primary_key: :hadm_id, class: :Prescription
  one_to_many :chartevents, key: :hadm_id, primary_key: :hadm_id, class: :ChartEvent
  one_to_many :transfers, key: :hadm_id, primary_key: :hadm_id, class: :Transfer
  one_to_many :inputevents_cv, key: :hadm_id, primary_key: :hadm_id, class: :InputEventCV
  one_to_many :noteevents, key: :hadm_id, primary_key: :hadm_id, class: :NoteEvent
  one_to_many :services, key: :hadm_id, primary_key: :hadm_id, class: :Service
  one_to_many :procedures_icd, key: :hadm_id, primary_key: :hadm_id, class: :ProcedureIcd
  one_to_many :outputevents, key: :hadm_id, primary_key: :hadm_id, class: :OutputEvent
  one_to_many :procedureevents_mv, key: :hadm_id, primary_key: :hadm_id, class: :ProcedureEventMV
  one_to_many :inputevents_mv, key: :hadm_id, primary_key: :hadm_id, class: :InputEventMV
end


Object.send(:remove_const, :DrgCode) if defined? (DrgCode)

class DrgCode < Sequel::Model(DB_MIMIC[:drgcodes])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
end


Object.send(:remove_const, :MicrobiologyEvent) if defined? (MicrobiologyEvent)

class MicrobiologyEvent < Sequel::Model(DB_MIMIC[:microbiologyevents])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
end


Object.send(:remove_const, :Callout) if defined? (Callout)

class Callout < Sequel::Model(DB_MIMIC[:callout])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
end


Object.send(:remove_const, :DiagnoseIcd) if defined? (DiagnoseIcd)

class DiagnoseIcd < Sequel::Model(DB_MIMIC[:diagnoses_icd])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
end


Object.send(:remove_const, :CptEvent) if defined? (CptEvent)

class CptEvent < Sequel::Model(DB_MIMIC[:cptevents])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
end


Object.send(:remove_const, :Service) if defined? (Service)

class Service < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
end


Object.send(:remove_const, :ProcedureIcd) if defined? (ProcedureIcd)

class ProcedureIcd < Sequel::Model(DB_MIMIC[:procedures_icd])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
end


Object.send(:remove_const, :Icustay) if defined? (Icustay)

class Icustay < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  
  one_to_many :prescriptions, key: :icustay_id, primary_key: :icustay_id, class: :Icustay
  one_to_many :datetimeevents, key: :icustay_id, primary_key: :icustay_id, class: :DateTimeEvent
  one_to_many :chartevents, key: :icustay_id, primary_key: :icustay_id, class: :ChartEvent
  one_to_many :transfers, key: :icustay_id, primary_key: :icustay_id, class: :Transfer
  one_to_many :inputevents_cv, key: :icustay_id, primary_key: :icustay_id, class: :InputEventCV
  one_to_many :outputevents, key: :icustay_id, primary_key: :icustay_id, class: :OutputEvent
  one_to_many :procedureevents_mv, key: :icustay_id, primary_key: :icustay_id, class: :ProcedureEventMV
  one_to_many :inputevents_mv, key: :icustay_id, primary_key: :icustay_id, class: :InputEventMV
end


Object.send(:remove_const, :Prescription) if defined? (Prescription)

class Prescription < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :icustay, key: :icustay_id, primary_key: :icustay_id, class: :Icustay
end


Object.send(:remove_const, :Transfer) if defined? (Transfer)

class Transfer < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :icustay, key: :icustay_id, primary_key: :icustay_id, class: :Icustay
end


Object.send(:remove_const, :Caregiver) if defined? (Caregiver)

class Caregiver < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
  
  one_to_many :datetimeevent, key: :cgid, primary_key: :cgid
  one_to_many :chartevent, key: :cgid, primary_key: :cgid
  one_to_many :inputevents_cv, key: :cgid, primary_key: :cgid
  one_to_many :noteevents, key: :cgid, primary_key: :cgid
  one_to_many :outputevents, key: :cgid, primary_key: :cgid
  one_to_many :procedureevents_mv, key: :cgid, primary_key: :cgid
  one_to_many :inputevents_mv, key: :cgid, primary_key: :cgid
end


Object.send(:remove_const, :InputEventCV) if defined? (InputEventCV)

class InputEventCV < Sequel::Model(DB_MIMIC[:inputevents_cv])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :icustay, key: :icustay_id, primary_key: :icustay_id, class: :Icustay
  many_to_one :caregiver, key: :cgid, primary_key: :cgid, class: :Caregiver
end


Object.send(:remove_const, :OutputEvent) if defined? (OutputEvent)

class OutputEvent < Sequel::Model(DB_MIMIC[:outputevents])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :icustay, key: :icustay_id, primary_key: :icustay_id, class: :Icustay
  many_to_one :caregiver, key: :cgid, primary_key: :cgid, class: :Caregiver
end


Object.send(:remove_const, :ProcedureEventMV) if defined? (ProcedureEventMV)

class ProcedureEventMV < Sequel::Model(DB_MIMIC[:procedureevents_mv])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :icustay, key: :icustay_id, primary_key: :icustay_id, class: :Icustay
  many_to_one :caregiver, key: :cgid, primary_key: :cgid, class: :Caregiver
end


Object.send(:remove_const, :InputEventMV) if defined? (InputEventMV)

class InputEventMV < Sequel::Model(DB_MIMIC[:inputevents_mv])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :icustay, key: :icustay_id, primary_key: :icustay_id, class: :Icustay
  many_to_one :caregiver, key: :cgid, primary_key: :cgid, class: :Caregiver
end


Object.send(:remove_const, :NoteEvent) if defined? (NoteEvent)

class NoteEvent < Sequel::Model(DB_MIMIC[:noteevents])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :caregiver, key: :cgid, primary_key: :cgid, class: :Caregiver
end


Object.send(:remove_const, :DItem) if defined? (DItem)

class DItem < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
  
  one_to_many :datetimeevents, key: :itemid, primary_key: :itemid, class: :DateTimeEvent
  one_to_many :chartevents, key: :itemid, primary_key: :itemid, class: :ChartEvent
end


Object.send(:remove_const, :ChartEvent) if defined? (ChartEvent)

class ChartEvent < Sequel::Model(DB_MIMIC[:chartevents])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :icustay, key: :icustay_id, primary_key: :icustay_id, class: :Icustay
  many_to_one :d_item, key: :itemid, primary_key: :itemid, class: :DItem
  many_to_one :caregiver, key: :cgid, primary_key: :cgid, class: :Caregiver
end


Object.send(:remove_const, :DateTimeEvent) if defined? (DateTimeEvent)

class DateTimeEvent < Sequel::Model(DB_MIMIC[:datetimeevents])
  unrestrict_primary_key
  
  many_to_one :patients, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admissions, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :icustays, key: :icustay_id, primary_key: :icustay_id, class: :Icustay
  many_to_one :d_items, key: :itemid, primary_key: :itemid, class: :DItem
  many_to_one :caregivers, key: :cgid, primary_key: :cgid, class: :Caregiver
end


Object.send(:remove_const, :DLabItem) if defined? (DLabItem)

class DLabItem < Sequel::Model(DB_MIMIC[:d_labitems])
  unrestrict_primary_key
  
  one_to_many :labevents, key: :itemid, primary_key: :itemid, class: :LabEvent
end


Object.send(:remove_const, :LabEvent) if defined? (LabEvent)

class LabEvent < Sequel::Model(DB_MIMIC[:labevents])
  unrestrict_primary_key
  
  many_to_one :patient, key: :subject_id, primary_key: :subject_id, class: :Patient
  many_to_one :admission, key: :hadm_id, primary_key: :hadm_id, class: :Admission
  many_to_one :d_labitem, key: :itemid, primary_key: :itemid, class: :DLabItem
end


Object.send(:remove_const, :DIcdDiagnose) if defined? (DIcdDiagnose)

class DIcdDiagnose < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
end


Object.send(:remove_const, :DCpt) if defined? (DCpt)

class DCpt < Sequel::Model(DB_MIMIC[:d_cpt])
  unrestrict_primary_key
end


Object.send(:remove_const, :DIcdProcedure) if defined? (DIcdProcedure)

class DIcdProcedure < Sequel::Model(DB_MIMIC)
  unrestrict_primary_key
end