<%@page import="forwarders.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="quotationMgr" class="forwarders.FclQuotationMgr"/>
<jsp:useBean id="fqbean" class="forwarders.FclQuotationBean"/>
<!-- ���� ��� ����ؿԴ� ���̺� bean�� ������ ����Ϸ��� setProperty ���� ������ ������� -->
<jsp:setProperty property="*" name="fqbean"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		int pickupRate = Integer.parseInt(request.getParameter("pickupRate"));
		String no = request.getParameter("no");
		System.out.println("procüũ:"+no);
		
		System.out.println("����׽�Ʈ1"+pickupRate);
		
		fqbean.setPickupRate(pickupRate);
		
		System.out.println("bean�� üũ"+fqbean.getPickupRate());	
		
		//fclReply �μ�Ʈ
		boolean result= quotationMgr.insertFclQuotation(fqbean);
		
		String msg="���� ���� ����";//����
		String url="fclReply.jsp";
		if(result){
			msg="��ϼ���";
			url="mypage.jsp?no="+no;
		}

%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>