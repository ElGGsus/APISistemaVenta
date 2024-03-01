DROP DATABASE IF EXISTS VISITORSDB;
create database VISITORSDB;
--use VISITORSDB;
--use master;

DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS MENU_ROL;
DROP TABLE IF EXISTS ROL;
DROP TABLE IF EXISTS MENU;
DROP TABLE IF EXISTS VISITORS_STATE;
DROP TABLE IF EXISTS VISITORS;

CREATE TABLE ROL(
ID_ROL INT PRIMARY KEY IDENTITY(1,1),
ROL_NAME VARCHAR(25),
);

CREATE TABLE MENU(
ID_MENU INT PRIMARY KEY IDENTITY(1,1),
NAME VARCHAR(50),
ICON VARCHAR(50),
URL VARCHAR(50)
)

CREATE TABLE MENU_ROL(
ID_MENUROL INT PRIMARY KEY IDENTITY(1,1),
ID_MENU INT REFERENCES MENU(ID_MENU),
ID_ROL INT REFERENCES ROL(ID_ROL)
)

CREATE TABLE USERS(
ID_USER INT PRIMARY KEY IDENTITY(1,1),
NAME VARCHAR(64),
LASTNAME VARCHAR(64),
EMAIL VARCHAR(64),
ID_ROL INT REFERENCES ROL(ID_ROL),
PASSWORD VARCHAR(8)
);

CREATE TABLE VISITOR_STATE(
ID_VISITORSTATE INT PRIMARY KEY IDENTITY(1,1),
STATE VARCHAR(8)
);

CREATE TABLE VISITORS(
ID_VISITOR INT PRIMARY KEY IDENTITY(1,1),
NAME VARCHAR(64),
LASTNAME VARCHAR(64),
REASON VARCHAR(64),
IN_CHARGE VARCHAR(64),
DOCUMENT VARCHAR(64),
DATE_IN DATE DEFAULT GETDATE(),
HOUR_IN TIME DEFAULT GETDATE(),
HOUR_OUT TIME DEFAULT GETDATE(),
STATE INT REFERENCES VISITOR_STATE(ID_VISITORSTATE)
);

-- Insert para la tabla rol
INSERT INTO ROL (ROL_NAME)
VALUES
    ('Admin'),
    ('User')

-- Insert para la tabla users
INSERT INTO USERS (NAME, LASTNAME, EMAIL, PASSWORD, ID_ROL)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 'password', 1),
    ('Jane', 'Smith', 'jane.smith@example.com', 'password', 2),
    ('Alice', 'Johnson', 'alice.johnson@example.com', 'password', 2)

--INSERT PARA LA TABLA VISITOR_STATE
INSERT INTO VISITOR_STATE(STATE)
VALUES
    ('In'),
    ('Out')
-- Insert para la tabla visitors_info
INSERT INTO VISITORS (NAME, LASTNAME, REASON, IN_CHARGE, DOCUMENT, STATE)
VALUES
    ('Michael', 'Jordan', 'Meeting', 'John Doe', 'INE',1),
    ('Kobe', 'Bryant', 'Delivery', 'Jane Smith', 'LICENSIA',1),
    ('LeBron', 'James', 'Interview', 'Alice Johnson', 'INE',2)

INSERT INTO MENU(NAME,ICON,URL) VALUES
('Users','user','/pages/users'),
('Visitors','group','/pages/visitors'),
('VisitorsIn','inIcon','/pages/visitorsIn'),
('VisitorsOut','outIcon','/pages/visitorsOut')
go

--menus para administrador
INSERT INTO MENU_ROL(ID_MENU,ID_ROL) VALUES
(1,1),
(2,1),
(3,1),
(4,1)
go

--menus para empleado
INSERT INTO MENU_ROL(ID_MENU,ID_ROL) values
(2,2),
(3,2),
(4,2)
go

ALTER AUTHORIZATION ON DATABASE::VISITORSDB To sa

SELECT * FROM ROL
SELECT * FROM USERS
SELECT * FROM VISITOR_STATE
SELECT * FROM VISITORS