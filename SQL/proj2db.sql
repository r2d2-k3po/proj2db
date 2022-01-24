CREATE TABLE product (    
    code CHAR(3) not null,
    pname VARCHAR2(30) not null,
    cost NUMBER(11),
    pnum NUMBER(11),
    jnum NUMBER(11),
    sale NUMBER(11),
    gcode CHAR(3) not null,
    PRIMARY KEY (code)
);

CREATE TABLE groupcode (
    gcode CHAR(3) not null,
    gname VARCHAR2(20) not null,
    PRIMARY KEY (gcode)
);

alter TABLE product
    add CONSTRAINT product_fk FOREIGN KEY (gcode) REFERENCES groupcode (gcode);
    
insert into groupcode (gcode, gname) values ('A', '��ǻ��');
insert into groupcode (gcode, gname) values ('B', '�����');
insert into groupcode (gcode, gname) values ('C', '�����');
    
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('A01', '��ǻ��DVD', 1500, 300, 50, 2000, 'A');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('A02', '��ǻ��CDROM', 1200, 500, 100, 1500, 'A');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('A03', '��ǻ�͸����', 50000, 400, 50, 55000, 'A');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('A04', '��ǻ��������', 20000, 400, 100, 23000, 'A');
    
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('B01', '��������̽�', 1000, 500, 1200, 900, 'B');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('B02', '����Ͼ����ʸ�', 500, 1000, 2000, 400, 'B');
    
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('C01', '����������', 300, 1000, 300, 1500, 'C');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('C02', '�������', 40000, 300, 50, 47000, 'C');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('C03', '��������ڽ�', 3000, 200, 20, 3500, 'C');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('C04', '�����õ��ڽ�', 3500, 300, 80, 4000, 'C');

drop TABLE product;
drop TABLE groupcode;

SELECT * FROM groupcode;
SELECT * FROM product;

SELECT code, gname FROM product p INNER JOIN groupcode g
    ON p.gcode = g.gcode;

