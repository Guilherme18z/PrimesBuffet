<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta JSP</title>
    <style>
        tr:nth-child(even) {
            background-color: (65,105,225);
        }
        tr:hover{
            background-color: #6495ED;
        }
    </style>
</head>
<body>
    <%@page language="java" import="java.sql.*" %>
    <%
    //variaveis para o banco de dados
    String banco    = "projeto" ;
    String endereco = "jdbc:mysql://localhost:3306/"+banco;
    String usuario  = "root";
    String senha    = "" ;

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memória
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    String sql = "SELECT * FROM clientes" ;

    //Cria o statement para executar o comando no banco
    PreparedStatement stm = conexao.prepareStatement(sql) ;

    ResultSet  dados = stm.executeQuery() ;

    out.print("<table border=1 width='500'>");
    out.print("<tr>") ;
        out.print("<th>Codigo</th>") ;
        out.print("<th>Nome</th>") ;
        out.print("<th>Telefone</th>") ;
        out.print("<th>Email</th>") ;
    out.print("</tr>") ;
    while( dados.next() ) 
    {
        out.print("<tr>") ;
            out.print("<td>") ;
                out.print( dados.getString("codigo") ) ;
            out.print("</td>") ;

            out.print("<td>") ;
                out.print( dados.getString("Nome") ) ;
            out.print("</td>") ;

            out.print("<td>") ;
                out.print( dados.getString("Telefone") ) ;
            out.print("</td>") ;

            out.print("<td>") ;
                out.print( dados.getString("Email") ) ;
            out.print("</td>") ;                

        out.print("</tr>") ;

    }

    out.print("</table>") ;
%>
</body>
</html>