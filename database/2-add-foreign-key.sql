ALTER TABLE usertable ADD CONSTRAINT fk_user_role FOREIGN KEY (id_role) REFERENCES roletb(id_role);
ALTER TABLE food ADD CONSTRAINT fk_food_foodtype FOREIGN KEY (id_foodtype) REFERENCES foodtype(id_foodtype);
ALTER TABLE commenttable ADD CONSTRAINT fk_user_comment FOREIGN KEY (id_user) REFERENCES usertable(id_user);
ALTER TABLE commenttable ADD CONSTRAINT fk_comment_food FOREIGN KEY (id_food) REFERENCES food(id_food)