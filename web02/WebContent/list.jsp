<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>�л��������� ���α׷�</h1>
	<table border="1" width="500">
		<tr>
			<td width="80">�й�</td>
			<td>����</td>
			<td>����</td>
			<td>����</td>
			<td>����</td>
			<td width="50">����</td>
		</tr>
<%
	oracle.jdbc.driver.OracleDriver driver=null;
	driver=new oracle.jdbc.driver.OracleDriver();
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	java.util.Properties info=null;
	info=new java.util.Properties();
	info.setProperty("user", "scott");
	info.setProperty("password", "tiger");
	
	String sql="select * from stu01 order by num";
	java.sql.Connection conn=null;
	java.sql.Statement stmt=null;
	java.sql.ResultSet rs=null;
	try{
	conn=java.sql.DriverManager.getConnection(url, info);
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	while(rs.next()){
%>				
		<tr>
			<form action="update.jsp">
			<td align="center">
			<input type="text" name="num" value="<%=rs.getObject(1) %>" size="5" readonly="readonly"></td>
			<td align="center">
			<input type="text" name="kor" value="<%=rs.getObject(2) %>" size="5"></td>
			<td align="center">
			<input type="text" name="eng" value="<%=rs.getObject(3) %>" size="5"></td>
			<td align="center">
			<input type="text" name="math" value="<%=rs.getObject(4) %>" size="5"></td>
			<td><input type="submit" value="����"></td>
			</form>
			<td><form action="delete.jsp" method="post">
					<input type="hidden" name="num" value="<%=rs.getObject(1) %>">
					<input type="submit" value="����">
				</form>
			</td>
		</tr>
<%
	}
	}catch(Exception e){
		out.print("<tr>");
		out.print("<td colspan=\"4\">��Ʈ��ũ��Ȳ�� ��Ȱ���� �ʽ��ϴ�<br>����� �ٽ� ������ �ּ���</td>");
		out.print("</tr>");
		e.printStackTrace();
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
%>	
	</table>
	<a href="add.jsp">[�� ��]</a>
</body>
</html>















