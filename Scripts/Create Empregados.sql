-- Table: public.EMPREGADOS

-- DROP TABLE IF EXISTS public."EMPREGADOS";

CREATE TABLE IF NOT EXISTS public."EMPREGADOS"
(
    id_empregado integer NOT NULL,
    cod_departamento integer NOT NULL,
    cod_emp_funcao integer NOT NULL,
    nm_empregado character varying(100) COLLATE pg_catalog."default",
    nm_funcao character varying(100) COLLATE pg_catalog."default",
    data_admissao date,
    salario numeric(92,5),
    comissao numeric(92,5),
    CONSTRAINT "EMPREGADOS_pkey" PRIMARY KEY (id_empregado),
	foreign key (cod_departamento) references public."DEPARTAMENTOS" (id_departamento)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."EMPREGADOS"
    OWNER to postgres;