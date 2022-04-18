create type engineertechnicalstafftype as enum ('head', 'technician', 'technologiest', 'engineer');

create type labourtype as enum ('brigadier', 'bricklayer', 'concreter', 'finisher', 'welder', 'electrician', 'driver', 'locksmith');

create table if not exists employer
(
    id   serial
        primary key,
    name varchar not null
        unique,
    type varchar not null
);

create table if not exists organisation
(
    id   serial
        primary key,
    name varchar not null
        unique
);

create table if not exists contract
(
    id               serial
        primary key,
    "employerId"     integer not null
        references employer,
    "organisationId" integer not null
        references organisation
);

create table if not exists management
(
    id               serial
        primary key,
    name             varchar not null
        unique,
    "organisationId" integer not null
        references organisation
);

create table if not exists material
(
    id    serial
        primary key,
    name  varchar          not null
        unique,
    price double precision not null
        constraint material_price_check
            check (price > (0.0)::double precision)
);

create table if not exists "workType"
(
    id   serial
        primary key,
    name varchar not null
        unique
);

create table if not exists worker
(
    id         serial
        primary key,
    surname    varchar not null,
    name       varchar not null,
    patronymic varchar
);

create table if not exists "engineerTechnicalStaff"
(
    id                           serial
        primary key
        references worker,
    "engineerTechnicalStaffType" v2.engineertechnicalstafftype not null,
    "headId"                     integer
        references "engineerTechnicalStaff",
    attribute                    varchar
);

create table if not exists site
(
    id             serial
        primary key,
    name           varchar not null
        unique,
    "managementId" integer not null
        references management,
    "headId"       integer not null
        references "engineerTechnicalStaff"
);

create table if not exists object
(
    id       serial
        primary key,
    name     varchar not null
        unique,
    "siteId" integer not null
        references site
);

create table if not exists equipment
(
    id           serial
        primary key,
    number       integer not null
        constraint equipment_number_check
            check (number > 0),
    type         varchar not null,
    "objectId"   integer not null
        references object,
    "workTypeId" integer not null
        references "workType"
);

create table if not exists "pathType"
(
    id        serial
        primary key
        references object,
    "laneNum" integer          not null
        constraint "pathType_laneNum_check"
            check (("laneNum" > 0) AND ("laneNum" < 50)),
    width     double precision not null
        constraint "pathType_width_check"
            check ((width > (0.0)::double precision) AND (width < (0.1)::double precision)),
    length    double precision not null
        constraint "pathType_length_check"
            check (length > (0.0)::double precision)
);

create table if not exists "buildingType"
(
    id         serial
        primary key
        references object,
    "floorNum" integer          not null
        constraint "buildingType_floorNum_check"
            check (("floorNum" > 0) AND ("floorNum" < 200)),
    area       double precision not null
        constraint "buildingType_area_check"
            check (area > (0.0)::double precision)
);

create table if not exists road
(
    id serial
        primary key
        references "pathType"
);

create table if not exists bridge
(
    id         serial
        primary key
        references "pathType",
    "spanType" varchar not null
);

create table if not exists residential
(
    id        serial
        primary key
        references "buildingType",
    "flatNum" integer
        constraint "residential_flatNum_check"
            check ("flatNum" > 0)
);

create table if not exists nonresidential
(
    id serial
        primary key
        references "buildingType"
);

create table if not exists "actualDeadline"
(
    id           serial
        primary key,
    "objectId"   integer not null
        references object,
    "workTypeId" integer not null
        references "workType",
    "actualDate" date
        constraint "actualDeadline_actualDate_check"
            check (("actualDate" > '1992-04-13'::date) AND ("actualDate" < '2022-04-13'::date))
);

create table if not exists "actualExpenses"
(
    id           serial
        primary key,
    "objectId"   integer not null
        references object,
    "materialId" integer not null
        references material,
    expenses     double precision
        constraint "actualExpenses_expenses_check"
            check (expenses > (0.0)::double precision)
);

create table if not exists schedule
(
    id           serial
        primary key,
    "objectId"   integer not null
        references object,
    "workTypeId" integer not null
        references "workType",
    deadline     date    not null
        constraint schedule_deadline_check
            check ((deadline > '1992-04-13'::date) AND (deadline < '2022-04-13'::date))
);

create table if not exists labour
(
    id            serial
        primary key
        references worker,
    "labourType"  v2.labourtype not null,
    "brigadierId" integer
        references labour,
    attribute     varchar
);

create table if not exists brigade
(
    id            serial
        primary key,
    "brigadierId" integer not null
        references labour
);

create table if not exists "workTypeByBrigade"
(
    "workTypeId" integer not null
        references "workType",
    "brigadeId"  integer not null
        references brigade,
    "objectId"   integer not null
        references object
);

create table if not exists estimate
(
    id            serial
        primary key,
    "objectId"    integer          not null,
    "materialId"  integer          not null,
    "materialNum" double precision not null
        constraint "estimate_materialNum_check"
            check ("materialNum" > (0)::double precision)
);


