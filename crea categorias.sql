use blog;

create table if not exists categoria(
IdCategoria int not null auto_increment primary key,
Nombre varchar(50) not null,
Descripcion varchar(100) not null,
Fecha datetime default now(),
CAtegoriaSuperior int,
foreign key(CategoriaSuperior) references categoria(IdCategoria)
);



create table if not exists post(
IdPost int not null auto_increment primary key,
Titulo varchar(100) not null,
Slug  varchar(75) not null,
Extracto varchar(50) not null,
IdUsuario int not null,
Categoria int not null,
ImagenDestacada varchar(255),
Tipo varchar(50) not null,
foreign key(CategoriaSuperior) references categoria(IdCategoria),
foreign key(IdUsuario) references usuario(IdUsuario)
);

create table if not exists contenido(
IdContenido int not null auto_increment primary key,
Tipo varchar(50) not null,
Contenido varchar(250) not null,
IdPost int not null,
foreign key(IdPost) references post(IdPost)
);

create table if not exists post_metadata(
IdPostMetadata int not null auto_increment primary key,
Clave varchar(500) not null,
Valor varchar(500) not null,
Tipo varchar(50) not null,
IdPost int not null,
foreign key(IdPost) references post(IdPost)
);

create table if not exists comentario(
IdComentario int not null auto_increment primary key,
Comentario varchar(500) not null,
Fecha datetime default now(),
Respuesta int,
foreign key(IdPost) references post(IdPost),
foreign key(IdGrupo) references grupo(IdGrupo),
foreign key(Respuesta) references comentario(IdComentario)
);

create table if not exists usuario_metadata(
IdUsuarioMetadata int not null auto_increment primary key,
IdUsuario int not null,
Clave varchar(500) not null,
Valor varchar(500) not null,
Tipo varchar(50) not null,
foreign key(IdUsuario) references usuario(IdUsuario)

);