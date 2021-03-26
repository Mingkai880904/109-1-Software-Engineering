<%@page contentType="text/html; charset=utf-8" %>
<!-- charset=big5 -->
<%
   request.setCharacterEncoding("UTF-8");
   String bno = util.paostring.toString(request.getParameter("SNO"));
   String bname = util.paostring.toString(request.getParameter("SNAME"));
   String R1 = util.paostring.toString(request.getParameter("R1"));
   String ACT = util.paostring.toString(request.getParameter("ACT"));

   System.out.println(bno+","+bname+","+R1+","+ACT);
 %>
<html>
<body>
資料管理 (db1216.out)<br>
<form name="REQ" action="t1230.jsp">
    <input type="hidden" name="ACT" value=""/>
	學號<input type="text" name="SNO" value="" size="5"><br />
	姓名<input type="text" name="SNAME" value="" size="5"><br />
	<input type="submit" value="新增" onClick="REQ.ACT.value='ADD';REQ.submit()">
    <input type="button" value="修改" onClick="REQ.action='t1230-edit.jsp';REQ.submit()">
    <input type="button" value="刪除" onClick="REQ.ACT.value='DEL';REQ.submit()"><br />

<%
    request.setCharacterEncoding("UTF-8");
	
    String adostr = "mysql,org.gjt.mm.mysql.Driver,jdbc:mysql://localhost/db1216?user=root&password=passwd1234";
    util.DBConnection conn = new util.DBConnection(adostr);
    
    // ----- 新增
    if (!bno.equals("")&& ACT.equals("ADD")) {
    String sql01 = "INSERT INTO student(sno,sname) values('"+bno+"','"+bname+"')";
    conn.execsql(sql01);
   }
   
    // ----- 刪除
    if (!R1.equals("")&& ACT.equals("DEL")) {
    String sql01 = "delete from student where sno='"+R1+"'";
    conn.execsql(sql01);
   }
   
    util.RecordSet rs1 = new util.RecordSet();
    
    
    String sql = "select * from student";
    rs1.Open(conn,sql);
    out.print("<table border='1' cellspacing='0'>");
    out.print("<tr><td>選取</td><td>學號</td><td>姓名</td></tr>");
    while(!rs1.EOF){
       String str1 = "<tr>";
   	   str1 += "<td><input type='radio' name='R1' id='R1' value='"+rs1.get("sno")+"' /></td>";
   	   str1 += "<td>"+rs1.get("sno")+"</td><td>"+rs1.get("sname")+"</td>";
   	   str1 += "</tr>";
       out.print(str1);
       rs1.next();
    }
   out.print("</table>"); 
   conn.close();
%>
</form>
</body>
</html>
