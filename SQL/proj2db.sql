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
    
insert into groupcode (gcode, gname) values ('A', '컴퓨터');
insert into groupcode (gcode, gname) values ('B', '모바일');
insert into groupcode (gcode, gname) values ('C', '냉장고');
    
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('A01', '컴퓨터DVD', 1500, 300, 50, 2000, 'A');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('A02', '컴퓨터CDROM', 1200, 500, 100, 1500, 'A');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('A03', '컴퓨터모니터', 50000, 400, 50, 55000, 'A');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('A04', '컴퓨터프린터', 20000, 400, 100, 23000, 'A');
    
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('B01', '모바일케이스', 1000, 500, 1200, 900, 'B');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('B02', '모바일액정필름', 500, 1000, 2000, 400, 'B');
    
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('C01', '냉장고손잡이', 300, 1000, 300, 1500, 'C');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('C02', '냉장고도어', 40000, 300, 50, 47000, 'C');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('C03', '냉장고냉장박스', 3000, 200, 20, 3500, 'C');
insert into product (code, pname, cost, pnum, jnum, sale, gcode)
    values ('C04', '냉장고냉동박스', 3500, 300, 80, 4000, 'C');

drop TABLE product;
drop TABLE groupcode;

SELECT * FROM groupcode;
SELECT * FROM product;

SELECT code, gname FROM product p INNER JOIN groupcode g
    ON p.gcode = g.gcode;

