<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	request.setCharacterEncoding("utf-8");
 	String str = request.getParameter("music");
 	System.out.println(str); // 콘솔에서 확인
%>
<% 
	if(str.equals("11")) {
		response.sendRedirect("https://www.youtube.com/watch?v=CX5f0NcqlMs");
	} else if(str.equals("22")) {
		response.sendRedirect("https://www.youtube.com/watch?v=LQC3dBWS_FE&list=RDLQC3dBWS_FE&start_radio=1");
	} else if(str.equals("33")) {
		response.sendRedirect("https://www.youtube.com/watch?v=HE1SvTy460I");
	}
%>
