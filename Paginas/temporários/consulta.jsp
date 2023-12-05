<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta JSP</title>
</head>
<body>
    <%
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

    String sql = "SELECT * FROM clientes";

    PreparedStatement stm = conexao.prepareStatement(sql);

    ResultSet dados = stm.executeQuery();

    while (dados.next())
    {
        out.print(dados.getString("nome"));
    }

    
    %>
</body>
</html>