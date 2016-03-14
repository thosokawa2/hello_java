<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%!
// サーブレットのinitメソッドに相当
public void jspInit() {
    try {
        // JDBCドライバをロード
        Class.forName("com.mysql.jdbc.Driver");
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello</title>
</head>

<body>
<h1>Hello</h1>
<%= System.getenv("PATH") %><br>
<%= System.getenv("HELLO_PHP_MYSQL_SERVICE_HOST")  %><br>
<%= System.getenv("MYSQL_USER")  %><br>
<%= System.getenv("MYSQL_PASSWORD")  %><br>
<%= System.getenv("MYSQL_DATABASE")  %><br>


<%
//        String host = "localhost";
//        String db_user = "root";
//        String db_password = "password";
//        String db_name = "mydb";

        String host = System.getenv("HELLO_PHP_MYSQL_SERVICE_HOST");
        String db_user = System.getenv("MYSQL_USER");
        String db_password = System.getenv("MYSQL_PASSWORD");
        String db_name = System.getenv("MYSQL_DATABASE");

        // データベースへのアクセス開始
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            // データベースに接続するConnectionオブジェクトの取得
            con = DriverManager.getConnection(
                "jdbc:mysql://" + host + "/" + db_name,
                db_user, db_password);
            // データベース操作を行うためのStatementオブジェクトの取得
            stmt = con.createStatement();
            // SQL()を実行して、結果を得る
            rs = stmt.executeQuery(
              "select 1");

            // 得られた結果をレコードごとに表示
            while (rs.next()) {
%>

<%= rs.getString("1")%>

<%
            }

        } catch (Exception e) {
%>
            <%= e.getMessage() %>
<%
            e.printStackTrace();
        } finally {
            // データベースとの接続をクローズ
            try { rs.close(); } catch (Exception e) {}
            try { stmt.close(); } catch (Exception e) {}
            try { con.close(); } catch (Exception e) {}
        }
%>

</body>
</html>
