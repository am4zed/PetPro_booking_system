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
  neutered_or_spayed BOOLEAN,
  photo VARCHAR(255)
);

CREATE TABLE appointments (
  id SERIAL8 PRIMARY KEY,
  appt_date VARCHAR(255),
  appt_time VARCHAR(255),
  service VARCHAR(255),
  length_in_mins INT8,
  pet_id INT8 REFERENCES pets(id) ON DELETE CASCADE
);
