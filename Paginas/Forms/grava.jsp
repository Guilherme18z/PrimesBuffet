<%@page language="java" import="java.sql.*" %>

<%
//Cria as variaveis e armazena as informações digitadas pelo usuario
String vnome = request.getParameter("txtNome");
String vtelefone = request.getParameter("txtNumero");
String vemail = request.getParameter("txtEmail");

//Variaveis para o banco de dados
String banco = "projeto";
String endereco = "jdbc:mysql://localhost:3306/" + banco;
String usuario = "root";
String senha = "";

//Driver
String driver = "com.mysql.jdbc.Driver"; //caminho driver

//Carregar o driver na memória
Class.forName(driver);

//Cria a variavel para conectar com o banco de dados
Connection conexao; 

//Abre a conexão com o banco de dados
conexao = DriverManager.getConnection(endereco, usuario, senha) ;

//Cria a variavel sql com o comando de inserir 
String sql = "INSERT INTO clientes (Nome, Telefone, Email) values (?, ?, ?)";

PreparedStatement stm = conexao.prepareStatement(sql);
stm.setString(1 , vnome);
stm.setString(2 , vtelefone);
stm.setString(3 , vemail);

stm.execute();
stm.close();

out.print("Dados gravados com sucesso!");
%>