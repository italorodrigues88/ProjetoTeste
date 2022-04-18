-- Table: public.DEPARTAMENTOS

-- DROP TABLE IF EXISTS public."DEPARTAMENTOS";

CREATE TABLE IF NOT EXISTS public."DEPARTAMENTOS"
(
    id_departamento integer NOT NULL,
    nm_departamento character varying(100) COLLATE pg_catalog."default",
    local character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "DEPARTAMENTOS_pkey" PRIMARY KEY (id_departamento)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."DEPARTAMENTOS"
    OWNER to postgres;