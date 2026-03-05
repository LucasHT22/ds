create database Biblioteca;
use Biblioteca;

create table usuario (
id_user int primary key auto_increment,
cpf varchar(11) not null unique,
email varchar(255) not null unique,
senha varchar(255) not null
);
create table emprestimo (
id_emprestimo int primary key auto_increment,
id_user int,
foreign key (id_user) references usuario(id_user),
data_emprestimo date not null
);
create table livro(
id_livro int primary key auto_increment,
nome varchar(255) not null,
id_emprestimo int,
foreign key (id_emprestimo) references emprestimo(id_emprestimo)
);
create table categoria (
id_categoria int primary key auto_increment,
nome varchar(255) not null
);
create table autor (
id_autor int primary key auto_increment,
nome varchar(255) not null
);
create table livro_categoria(
id_kivro_categoria  int primary key auto_increment,
id_categoria int,
id_autor int,
foreign key (id_categoria) references categoria(id_categoria),
foreign key (id_autor) references autor(id_autor)
);