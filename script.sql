CREATE TABLE IF NOT EXISTS public.Clients (
    client_id SERIAL PRIMARY KEY,
    FIO VARCHAR(255),
    passport_series_number VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS public.Car (
    car_id SERIAL PRIMARY KEY,
    model VARCHAR(255),
    colour VARCHAR(255),
    produce_year BIGINT,
    plate_number VARCHAR(255),
    day_price MONEY
);

CREATE TABLE IF NOT EXISTS public.Insurance (
    insurance_id SERIAL PRIMARY KEY,
    car_id INT references Car (car_id) ,
    day_of_issue DATE,
    end_date DATE,
    insurance_price MONEY
);

CREATE TABLE IF NOT EXISTS public.Clients_Cars (
    clients_cars_id SERIAL PRIMARY KEY,
    client_id INT references Clients (client_id) ,
    car_id INT references Car (car_id)
);

CREATE TABLE IF NOT EXISTS public.Rent (
    rent_id SERIAL PRIMARY KEY,
    clients_cars_id INT references Clients_Cars (clients_cars_id),
    rent_date DATE,
    rent_days BIGINT
);