<%@page contentType="text/html; charset=utf-8" %>
<!-- charset=big5 -->
<%
   request.setCharacterEncoding("UTF-8");
   String sno = util.paostring.toString(request.getParameter("SNO"));
   String sname = util.paostring.toString(request.getParameter("SNAME"));
   String R1 = util.paostring.toString(request.getParameter("R1"));
   String ACT = util.paostring.toString(request.getParameter("ACT"));

   System.out.println(sno+","+sname+","+R1+","+ACT);
   
   String adostr = "mysql,org.gjt.mm.mysql.Driver,jdbc:mysql://localhost/db1216?user=root&password=passwd1234";
   util.DBConnection conn = new util.DBConnection(adostr);
    
    // ----- 儲存
    if (!sno.equals("SAVE")) {
    String sql01 = "update student set sname='"+sname+"' where sno='"+sno+"'";
     conn.execsql(sql01);
   }
   
   request.setCharacterEncoding("UTF-8");
   
    util.RecordSet rs1 = new util.RecordSet();
        
    String sql = "select * from student WHERE sno='"+R1+"'";
    rs1.Open(conn,sql);
    if(!rs1.EOF){
   	   sno = rs1.get("sno");
   	   sname = rs1.get("sname");
    }
    out.print("</table>"); 
    conn.close();
 %>
<html>
<body>
資料管理 (db1216.out)<br>
<form name="REQ" action="t1230-edit.jsp">
    <input type="hidden" name="ACT" value=""/>
	學號<input type="text" name="SNO" value="<%=sno%>" size="5" onFocus="this.blur()"><br />
	姓名<input type="text" name="SNAME" value="<%=sname%>" size="5"><br />
	<input type="button" value="儲存" onClick="REQ.ACT.value='SAVE';REQ.submit()">
	<input type="button" value="返回" onClick="REQ.action='t1230.jsp';REQ.submit()"><br /><br />
</form>
</body>
</html>
