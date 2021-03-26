<%@page contentType="text/html; charset=utf-8" %>
<!-- charset=big5 -->
<html>
<body>
資料管理 (db1216.out)<br>
4070E022 沈明楷<br>
<%
    request.setCharacterEncoding("UTF-8");
	
    String adostr = "mysql,org.gjt.mm.mysql.Driver,jdbc:mysql://localhost/db1216?user=root&password=passwd1234";
    util.DBConnection conn = new util.DBConnection(adostr);
    util.RecordSet rs1 = new util.RecordSet();
    
    String sql = "select * from student";
    rs1.Open(conn,sql);
	out.print("<table border='1'>");
		out.print("<tr><td>學號</td><td>姓名</td></tr>");

    while(!rs1.EOF){
       String str1 = "<tr><td>"+rs1.get("sno")+"</td><td>"+rs1.get("sname")+"</td></tr>";
       out.print(str1);
       rs1.next();
    }
	out.print("</table>");
    conn.close();
%>
</body>
</html>
