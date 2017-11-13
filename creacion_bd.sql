CREATE TABLE Usuario(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipo int NOT NULL,
	nombre text,
	pass text,
	foto longblob,
	email text
	);

CREATE TABLE Seguimiento(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_seguidor int NOT NULL,
	id_siguiendo int NOT NULL,
	FOREIGN KEY (id_seguidor) REFERENCES Usuario(id),
	FOREIGN KEY (id_siguiendo) REFERENCES Usuario(id)
	);



CREATE TABLE Receta(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre text,
	tipo text,
	valoracion int NOT NULL,
	num_valoraciones int NOT NULL,
	id_autor int NOT NULL,
	fecha date NOT NULL,
	dificultad int NOT NULL,
	tiempo int,
	foto longblob,
	FOREIGN KEY (id_autor) REFERENCES Usuario(id)
    );



CREATE TABLE Pasos(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_receta int NOT NULL,
	descripcion text,
	FOREIGN KEY (id_receta) REFERENCES Receta(id)
    );



CREATE TABLE Comentarios(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_receta int NOT NULL,
	id_comentador int NOT NULL,
	comentario text,
	fecha date NOT NULL,
	FOREIGN KEY (id_comentador) REFERENCES Usuario(id),
	FOREIGN KEY (id_receta) REFERENCES Receta(id)
    );



CREATE TABLE Valoracion(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_usuario int NOT NULL,
	id_receta int NOT NULL,
	puntuacion int NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
	FOREIGN KEY (id_receta) REFERENCES Receta(id)
    );


CREATE TABLE Notificaciones(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_recibe int NOT NULL,
	tipo int NOT NULL,
	id_seguidor int NOT NULL,
	id_receta int NOT NULL,
	id_valoracion int NOT NULL,
	id_comentario int NOT NULL,
	puntuacion int NOT NULL,
	FOREIGN KEY (id_recibe) REFERENCES Usuario(id),
	FOREIGN KEY (id_seguidor) REFERENCES Usuario(id),
	FOREIGN KEY (id_receta) REFERENCES Receta(id),
	FOREIGN KEY (id_valoracion) REFERENCES Valoracion(id),
	FOREIGN KEY (id_comentario) REFERENCES Comentarios(id)
    );



CREATE TABLE Ingrediente(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre text
    );



CREATE TABLE Receta_Ingrediente(
	id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_receta int NOT NULL,
	id_ingrediente int NOT NULL,
	cantidad int,
	unidad varchar(10),
    fraccion varchar(3),
	FOREIGN KEY (id_receta) REFERENCES Receta(id),
	FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente(id)
	);