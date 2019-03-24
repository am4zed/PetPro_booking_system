DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  owner_name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  gender VARCHAR(255),
  age INT8,
  neutered_or_spayed VARCHAR(255),
  photo VARCHAR(1000)
);

CREATE TABLE appointments (
  id SERIAL8 PRIMARY KEY,
  pet_id INT8 REFERENCES pets(id) ON DELETE CASCADE,
  service VARCHAR(255),
  appt_date VARCHAR(255),
  appt_time VARCHAR(255),
  length_in_mins INT8
);
