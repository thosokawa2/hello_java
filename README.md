openshift-jee の MySQLに接続するサンプル
====================
※下記のサンプルをベースにMySQLに接続するコードを追加した。  
https://github.com/bparees/openshift-jee-sample  

下記のPHPのDB接続サンプルを参考に、Java版のアプリケーションを作成。  
※DBは、サンプルと同じものを使用する。  
https://github.com/nekop/openshift-sandbox/blob/wip/developer-handson.md#docker%E3%82%A4%E3%83%A1%E3%83%BC%E3%82%B8%E3%83%99%E3%83%BC%E3%82%B9%E3%81%AE%E7%AE%A1%E7%90%86  


1. MySQLを起動する。  
※サンプルと同じ。  
oc new-app --template=mysql-ephemeral --param=DATABASE_SERVICE_NAME=hello-php-mysql,MYSQL_DATABASE=hello,MYSQL_USER=user,MYSQL_PASSWORD=pass  

2. Java EE サンプルAPを起動する。  
oc new-app https://github.com/thosokawa2/hello_java.git -e MYSQL_USER=user -e MYSQL_PASSWORD=pass -e MYSQL_DATABASE=hello  

3. ブラウザや、curlでアプリケーション hello_db.jsp にアクセスする。  
※「Hello」の下に、「1」が表示されていれば、正常に動作している。   