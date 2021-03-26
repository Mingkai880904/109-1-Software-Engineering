<%@page contentType="text/html; charset=utf-8" %>
<!-- charset=big5 -->
<html>
<body>
資料管理 (db1216.out)<br>
<%
    request.setCharacterEncoding("UTF-8");
	
    String adostr = "mysql,org.gjt.mm.mysql.Driver,jdbc:mysql://localhost/db1218?user=root&password=passwd1234";
    util.DBConnection conn = new util.DBConnection(adostr);
    util.RecordSet rs1 = new util.RecordSet();
    
    String sql = "select * from student";
    rs1.Open(conn,sql);
    while(!rs1.EOF){
       String str1 = rs1.get("sno");
       out.print(str1);
       rs1.next();
    }
    conn.close();
%>
</body>
</html>
