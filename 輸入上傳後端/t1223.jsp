<%@page contentType="text/html; charset=utf-8" %>
<!-- charset=big5 -->
<%
request.setCharacterEncoding("UTF-8");
String bno = request.getParameter("SNO");
String bname = request.getParameter("SNAME");
System.out.println(bno+","+bname);
%>
<html>
<body>
資料管理 (db1216.out)<br>
4070E022 沈明楷<br>
<form name="REQ" action="t1223.jsp">
學號<input type="text" name="SNO" value="" size="5"/><BR/>
姓名<input type="text" name="SNAME" value="" size="5"/><BR/>
<INPUT type="submit" value="送出"><BR/>
</form>

<%
    request.setCharacterEncoding("UTF-8");
  
	
    String adostr = "mysql,org.gjt.mm.mysql.Driver,jdbc:mysql://localhost/db1216?user=root&password=passwd1234";
    util.DBConnection conn = new util.DBConnection(adostr);
    util.RecordSet rs1 = new util.RecordSet();
	
	if(bno!=null){
	String sq101="insert into student(sno,sname) values('"+bno+"','"+bname+"')";
	conn.execsql(sq101);
    }
	util.RecordSet rsl = new util.RecordSet();
	
	
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
