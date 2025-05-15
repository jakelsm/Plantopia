<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.net.URL"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>실내정원용 식물 상세</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/grid.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/superfish.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/camera.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/touchTouch.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ie.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/encyclopedia.css">
</head>
<body>
  <div class="white-box">
    <h3><strong>실내정원용 식물 상세보기</strong></h3>
    <hr>
    <%
      // API 호출
      request.setCharacterEncoding("utf-8");
      String apiKey="20250502MXMI0MWRC3UTKFU1WOKFQ";
      String serviceName="garden";
      String operationName="gardenDtl";
      String parameter = "/"+serviceName+"/"+operationName
        + "?apiKey="+ apiKey
        + "&cntntsNo="+ request.getParameter("cntntsNo");

      URL apiUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
      InputStream apiStream = apiUrl.openStream();
      Document doc = null;
      try {
        doc = DocumentBuilderFactory.newInstance()
          .newDocumentBuilder().parse(apiStream);
      } catch(Exception e) {
        e.printStackTrace();
      } finally {
        apiStream.close();
      }

      // 결과 코드 및 메시지
      String resultCode="", resultMsg="";
      try{ resultCode = doc.getElementsByTagName("resultCode")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ resultMsg = doc.getElementsByTagName("resultMsg")
        .item(0).getTextContent(); }catch(Exception e){}

      // 데이터 추출
      String plntzrNm="", distbNm="", orgplceInfo="", growthHgInfo="",
             smellCode="", prpgtEraInfo="", managelevelCode="",
             frtlzrInfo="", soilInfo="", fncltyInfo="";
      try{ plntzrNm = doc.getElementsByTagName("plntzrNm")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ distbNm = doc.getElementsByTagName("distbNm")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ orgplceInfo = doc.getElementsByTagName("orgplceInfo")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ growthHgInfo = doc.getElementsByTagName("growthHgInfo")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ smellCode = doc.getElementsByTagName("smellCode")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ prpgtEraInfo = doc.getElementsByTagName("prpgtEraInfo")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ managelevelCode = doc.getElementsByTagName("managelevelCode")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ frtlzrInfo = doc.getElementsByTagName("frtlzrInfo")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ soilInfo = doc.getElementsByTagName("soilInfo")
        .item(0).getTextContent(); }catch(Exception e){}
      try{ fncltyInfo = doc.getElementsByTagName("fncltyInfo")
        .item(0).getTextContent(); }catch(Exception e){}

      // 코드 → 설명 변환
      String smellDesc="";
      if("079001".equals(smellCode)) smellDesc="강함";
      else if("079002".equals(smellCode)) smellDesc="중간";
      else if("079003".equals(smellCode)) smellDesc="약함";
      else if("079004".equals(smellCode)) smellDesc="거의 없음";
      else smellDesc=smellCode;

      String manageDesc="";
      if("089001".equals(managelevelCode)) manageDesc="초보자";
      else if("089002".equals(managelevelCode)) manageDesc="경험자";
      else if("089003".equals(managelevelCode)) manageDesc="전문가";
      else manageDesc=managelevelCode;
    %>

    <% if("00".equals(resultCode)) { %>
      <table class="api-table">
        <colgroup><col width="15%"><col width="*"></colgroup>
        <tr><th>식물영명</th><td><%=plntzrNm%></td></tr>
        <tr><th>유통명</th><td><%=distbNm%></td></tr>
        <tr><th>원산지 정보</th><td><%=orgplceInfo%></td></tr>
        <tr><th>성장 높이 정보</th><td><%=growthHgInfo%></td></tr>
        <tr><th>냄새 정도</th><td><%=smellDesc%></td></tr>
        <tr><th>번식 시기 정보</th><td><%=prpgtEraInfo%></td></tr>
        <tr><th>관리 난이도</th><td><%=manageDesc%></td></tr>
        <tr><th>비료 정보</th><td><%=frtlzrInfo%></td></tr>
        <tr><th>토양 정보</th><td><%=soilInfo%></td></tr>
        <tr><th>기능성 정보</th><td><%=fncltyInfo%></td></tr>
      </table>
    <% } else { %>
      <p class="error-message"><%=resultMsg%></p>
    <% } %>

    <!-- 목록 버튼 -->
    <div class="btn-group">
      <button type="button" class="btn btn-secondary" onclick="fncList();">
        목록으로 돌아가기
      </button>
    </div>

    <form name="searchApiForm">
      <input type="hidden" name="cntntsNo">
      <input type="hidden" name="pageNo" value="${param.pageNo}">
      <%
        String[] params = {
          "pageNo","sType","sText","wordType","word",
          "lightChkVal","grwhstleChkVal","lefcolrChkVal","lefmrkChkVal",
          "flclrChkVal","fmldecolrChkVal","ignSeasonChkVal",
          "winterLwetChkVal","priceType","priceTypeSel","waterCycleSel"
        };
        for(String p:params){
          out.print("<input type='hidden' name='"+p+
            "' value='"+request.getParameter(p)+"'/>");
        }
      %>
    </form>
    <script>
      function fncList(){
        with(document.searchApiForm){
          method="get";
          action="/gardenList";
          submit();
        }
      }
    </script>
  </div>
</body>
</html>
