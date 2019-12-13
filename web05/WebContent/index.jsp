<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Object obj=session.getAttribute("login");
if(obj!=null){
	Bbs01userBean user=(Bbs01userBean)obj;
	out.print(user.getNick()+"님 환영합니다");
	out.print("<a href=\"logout.jsp\">[logout]</a>");
}else{
%>
<a href="login.jsp">[login]</a>
<%} %>

	<h1>게시판</h1>
<a href="add.jsp">[글쓰기]</a>
	<%@ page import="java.sql.*,java.util.*" %>
	<%@ page import="com.bit.web05.*"%>
	<%
//	String sql="select A.num,A.sub,B.nick,A.nalja from bbs01 A "
//				+" inner join bbs01user B on A.id=B.id";
	String sql="select num,sub,(select nick from bbs01user B "
				+" where B.id=A.id) as \"nick\",nalja from bbs01 A "
				+" order by num desc";
	List<JavaBean> list=new ArrayList<JavaBean>();
	
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	try{
		conn=MyOracle.getConnection();
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			JavaBean bean=new JavaBean();
			bean.setNum(rs.getInt("num"));
			bean.setSub(rs.getString("sub"));
			bean.setNick(rs.getString("nick"));
			bean.setNalja(rs.getDate("nalja"));
			list.add(bean);
		}
	}finally{
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
	
	
	%>
	
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
		</tr>
<%
	for(int i=0; i<list.size(); i++){
		JavaBean bean=list.get(i);
%>	
		<tr>
			<td><%=bean.getNum() %></td>
			<td><a href="detail.jsp?num=<%=bean.getNum() %>">
				<%=bean.getSub() %></a></td>
			<td><%=bean.getNick() %></td>
			<td><%=bean.getNalja() %></td>
		</tr>
<%
	}
%>	
		
	</table>
</body>
</html>
















