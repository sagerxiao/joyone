# --- !Ups
DO $$
    BEGIN

        CREATE SCHEMA IF NOT EXISTS car_service;

        CREATE TABLE IF NOT EXISTS car_service.insurance_orders (
            id              bigint,
            request_source  varchar(30),
            process_status  varchar(30),
            json     varchar(3000),
            created_dt	timestamp not null default now(),
            created_by	varchar(50),
            modified_dt	timestamp not null default now(),
            modified_by	varchar(50),

            CONSTRAINT insurance_orders_id_pk PRIMARY KEY (id)
        );

        IF NOT EXISTS (SELECT sequence_name FROM information_schema.sequences WHERE sequence_name = 'insurance_orders_id_seq') THEN
            CREATE SEQUENCE public.insurance_orders_id_seq START 1 INCREMENT 1;
        END IF;

        IF NOT EXISTS (SELECT 0 FROM pg_class where relname = 'insurance_orders_process_status_idx') THEN
            CREATE INDEX insurance_orders_process_status_idx ON car_service.insurance_orders(process_status);
        END IF;

        IF NOT EXISTS (SELECT 0 FROM pg_class where relname = 'insurance_orders_request_source_idx') THEN
            CREATE INDEX insurance_orders_request_source_idx ON car_service.insurance_orders(request_source);
        END IF;
    END
$$
# --- !Downs


