<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.DriverManager,java.sql.Connection,java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="refresh" content="5; url=http://localhost:8080/web02/list.jsp">
<title>Insert title here</title>
</head>
<body>
	<%
	boolean tf=true;
	int result=0;
	String param1=request.getParameter("kor").trim();
	String param2=request.getParameter("eng").trim();
	String param3=request.getParameter("math").trim();
	int kor=0,eng=0,math=0;
	try{
	 kor=Integer.parseInt(param1);
	 eng=Integer.parseInt(param2);
	 math=Integer.parseInt(param3);
	}catch(Exception e){
		tf=false;
	}
	if(kor>100||eng>100||math>100||kor<0||eng<0||math<0){tf=false;}
	if(tf){
		String sql="Insert into stu01 values (stu01_seq.nextval, "
				+kor+", "+eng+", "+math+")";
		//		+param1+", "+param2+", "+param3+")";
		System.out.println(sql);
		String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		java.util.Properties info;
		info=new java.util.Properties();
		info.setProperty("user", "scott");
		info.setProperty("password", "tiger");
		
		String driver="oracle.jdbc.driver.OracleDriver";
		Class.forName(driver);
		
		Connection conn=null;
		Statement stmt=null;
		
		conn=DriverManager.getConnection(url,info);
		stmt=conn.createStatement();
		result=stmt.executeUpdate(sql);
	}
	if(result>0){
	%>
	<h1>입력 처리 완료되었습니다</h1>
	<%}else{ %>
	<h1>입력 실패하셨습니다</h1>
	<%} %>
</body>
</html>

















