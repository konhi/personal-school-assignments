ALTER TABLE students RENAME TO studenci;
ALTER TABLE studenci CHANGE student_id id_studenta INT(7);
ALTER TABLE studenci CHANGE family_name nazwisko varchar(50);
ALTER TABLE studenci CHANGE name imie varchar(30);
ALTER TABLE studenci CHANGE country kraj varchar(100);
ALTER TABLE studenci ALTER kraj SET DEFAULT 'Polska';