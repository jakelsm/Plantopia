<%@page import="java.util.HashMap"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.Element"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.net.URL"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>실내정원용 식물 목록</title>
  <link rel="icon" href="/img/favicon.ico">
  <script type="text/javascript">
    function fncDtl(cNo){
      with(document.searchApiForm){
        cntntsNo.value = cNo;
        method="get";
        action="gardenDtl";
        submit();
      }
    }
    function fncSearch(){
      with(document.searchApiForm){
        lightChkVal.value = fncCheckValue(lightChk);
        grwhstleChkVal.value = fncCheckValue(grwhstleChk);
        lefcolrChkVal.value = fncCheckValue(lefcolrChk);
        lefmrkChkVal.value = fncCheckValue(lefmrkChk);
        flclrChkVal.value = fncCheckValue(flclrChk);
        fmldecolrChkVal.value = fncCheckValue(fmldecolrChk);
        ignSeasonChkVal.value = fncCheckValue(ignSeasonChk);
        winterLwetChkVal.value = fncCheckValue(winterLwetChk);
        pageNo.value = "1";
        method="get";
        action="gardenList";
        submit();
      }
    }
    function fncGoPage(p){
      with(document.searchApiForm){
        pageNo.value = p;
        method="get";
        action="gardenList";
        submit();
      }
    }
    function fncWordTypeOption(){
      var wt = document.getElementById("wordType").value;
      document.getElementById("englishSrch").style.display = 
        wt==="plntbneNm"? "block":"none";
      document.getElementById("koreanSrch").style.display =
        wt==="cntntsSj"||wt===""? "block":"none";
    }
    function fncCheckValue(nodes){
      var v="";
      for(var i=0;i<nodes.length;i++){
        if(nodes[i].checked) v += nodes[i].value+",";
      }
      return v? v.slice(0,-1):"";
    }
  </script>
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
  <%@ include file="/WEB-INF/views/Main/header.jsp" %>
  <div class="white-box">
    <h3><strong>실내정원용 식물 검색 및 목록</strong></h3>
    <hr>
    <%
      String sType = request.getParameter("sType")==null?"":request.getParameter("sType");
      String wordType = request.getParameter("wordType")==null?"":request.getParameter("wordType");
      String sText = request.getParameter("sText")==null?"":request.getParameter("sText");
      String lightChkVal = request.getParameter("lightChkVal")==null?"":request.getParameter("lightChkVal");
      String grwhstleChkVal = request.getParameter("grwhstleChkVal")==null?"":request.getParameter("grwhstleChkVal");
      String lefcolrChkVal = request.getParameter("lefcolrChkVal")==null?"":request.getParameter("lefcolrChkVal");
      String lefmrkChkVal = request.getParameter("lefmrkChkVal")==null?"":request.getParameter("lefmrkChkVal");
      String flclrChkVal = request.getParameter("flclrChkVal")==null?"":request.getParameter("flclrChkVal");
      String fmldecolrChkVal = request.getParameter("fmldecolrChkVal")==null?"":request.getParameter("fmldecolrChkVal");
      String ignSeasonChkVal = request.getParameter("ignSeasonChkVal")==null?"":request.getParameter("ignSeasonChkVal");
      String winterLwetChkVal = request.getParameter("winterLwetChkVal")==null?"":request.getParameter("winterLwetChkVal");
    %>
    <form name="searchApiForm">
      <input type="hidden" name="cntntsNo">
      <input type="hidden" name="pageNo" value="<%=request.getParameter("pageNo")==null?"1":request.getParameter("pageNo")%>">
      <input type="hidden" name="sType" value="<%=sType%>">
      <input type="hidden" name="sText" value="<%=sText%>">
      <input type="hidden" name="wordType" value="<%=wordType%>">
      <input type="hidden" name="lightChkVal" value="<%=lightChkVal%>">
      <input type="hidden" name="grwhstleChkVal" value="<%=grwhstleChkVal%>">
      <input type="hidden" name="lefcolrChkVal" value="<%=lefcolrChkVal%>">
      <input type="hidden" name="lefmrkChkVal" value="<%=lefmrkChkVal%>">
      <input type="hidden" name="flclrChkVal" value="<%=flclrChkVal%>">
      <input type="hidden" name="fmldecolrChkVal" value="<%=fmldecolrChkVal%>">
      <input type="hidden" name="ignSeasonChkVal" value="<%=ignSeasonChkVal%>">
      <input type="hidden" name="winterLwetChkVal" value="<%=winterLwetChkVal%>">
      <table class="api-table">
        <colgroup><col width="20%"><col width="80%"></colgroup>
        <tr>
          <th>검색항목</th>
          <td>
            <select name="sType">
              <option value="sCntntsSj" <%=sType.equals("sCntntsSj")?"selected":""%>>식물명</option>
              <option value="sPlntbneNm" <%=sType.equals("sPlntbneNm")?"selected":""%>>학명</option>
              <option value="sPlntzrNm" <%=sType.equals("sPlntzrNm")?"selected":""%>>영명</option>
            </select>
            <input type="text" name="sText" value="<%=sText%>">
            <button type="button" onclick="fncSearch();">검색</button>
          </td>
        </tr>
<!--         <tr> -->
<!--           <th>첫글자 검색</th> -->
<!--           <td> -->
<!--             <select id="wordType" name="wordType" onchange="fncWordTypeOption();"> -->
<!--               <option value="">선택</option> -->
<%--               <option value="cntntsSj" <%=wordType.equals("cntntsSj")?"selected":""%>>국명</option> --%>
<%--               <option value="plntbneNm" <%=wordType.equals("plntbneNm")?"selected":""%>>학명</option> --%>
<!--             </select> -->
<!--             <div id="koreanSrch" style="display:block;"> -->
<%--               ㄱ~ㅎ 링크 --%>
<%--               <% String[] kor = {"ㄱ","ㄴ","ㄷ","ㄹ","ㅁ","ㅂ","ㅅ","ㅇ","ㅈ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"};  --%>
<%--                  for(String c:kor) { %> --%>
<%--                    <a href="#" onclick="document.searchApiForm.word.value='<%=c%>';fncSearch(); return false;" --%>
<%--                      style="font-weight:<%=request.getParameter("word")!=null&&request.getParameter("word").equals(c)?"bold":""%>"> --%>
<%--                      <%=c%> --%>
<!--                    </a>&nbsp; -->
<%--               <% } %> --%>
<!--             </div> -->
<!--             <div id="englishSrch" style="display:none;"> -->
<%--               <% for(char c='A';c<='Z';c++){ String cs=String.valueOf(c); %> --%>
<%--                 <a href="#" onclick="document.searchApiForm.word.value='<%=cs%>';fncSearch(); return false;" --%>
<%--                   style="font-weight:<%=request.getParameter("word")!=null&&request.getParameter("word").equals(cs)?"bold":""%>"> --%>
<%--                   <%=cs%> --%>
<!--                 </a>&nbsp; -->
<%--               <% } %> --%>
<!--             </div> -->
<%--            <input type="hidden" name="word" value="<%=request.getParameter("word")==null?"":request.getParameter("word")%>"> --%>
<!--           </td> -->
<!--         </tr> -->
      </table>
    </form>

    <%
      String apiKey="20250502MXMI0MWRC3UTKFU1WOKFQ";
      String serviceName="garden";
      String operationList="gardenList";
      String parameter = "/"+serviceName+"/"+operationList
        + "?apiKey="+apiKey
        + "&pageNo="+request.getParameter("pageNo");
      // URL 인코딩 및 파라미터 추가 (위에 form hidden과 동일)
      URL listUrl = new URL("http://api.nongsaro.go.kr/service"+parameter);
      InputStream listIs = listUrl.openStream();
      Document listDoc = null;
      try {
        listDoc = DocumentBuilderFactory.newInstance()
          .newDocumentBuilder().parse(listIs);
      } finally {
        listIs.close();
      }
      NodeList items = listDoc.getElementsByTagName("item");
      int size = items.getLength();
      NodeList cntNos = listDoc.getElementsByTagName("cntntsNo");
      NodeList cntSjs = listDoc.getElementsByTagName("cntntsSj");
      NodeList fileCours = listDoc.getElementsByTagName("rtnFileCours");
      NodeList fileNms   = listDoc.getElementsByTagName("rtnStreFileNm");
      String rc = listDoc.getElementsByTagName("resultCode")
        .item(0).getTextContent();
      String rm = listDoc.getElementsByTagName("resultMsg")
        .item(0).getTextContent();
    %>

    <% if("00".equals(rc)) { %>
      <hr>
      <table class="api-table">
        <% if(size==0) { %>
          <tr><td colspan="2" align="center">조회한 정보가 없습니다.</td></tr>
        <% } else {
             for(int i=0;i<size;i++){
               String no = cntNos.item(i).getTextContent();
               String sj = cntSjs.item(i).getTextContent();
               String[] coursArr = fileCours.item(i).getTextContent().split("[|]");
               String[] nmArr    = fileNms.item(i).getTextContent().split("[|]");
        %>
          <tr>
            <td style="width:15%;">
              <img class="img_inner"
                   src="http://www.nongsaro.go.kr/<%=coursArr[0]%>/<%=nmArr[0]%>"
                   alt="<%=sj%>">
            </td>
            <td>
              <a href="javascript:fncDtl('<%=no%>');"><%=sj%></a>
            </td>
          </tr>
        <% }
           } %>
      </table>
      <div class="pagination">
        <%
          int pageSize = Integer.parseInt(listDoc
            .getElementsByTagName("numOfRows").item(0).getTextContent());
          int totalCount = Integer.parseInt(listDoc
            .getElementsByTagName("totalCount").item(0).getTextContent());
          int currentPage = Integer.parseInt(listDoc
            .getElementsByTagName("pageNo").item(0).getTextContent());
          int pageCount = totalCount/pageSize 
            + (totalCount%pageSize==0?0:1);
          int pgSize = 10;
          int pgGroup = (int)Math.ceil((double)currentPage/pgSize);
          int startPage = (pgGroup-1)*pgSize+1;
          int endPage = Math.min(startPage+pgSize-1, pageCount);
          if(pgGroup>1){
            out.print("<a href='javascript:fncGoPage("+
              ((pgGroup-2)*pgSize+1)+");'>[이전]</a>");
          }
          for(int p=startPage;p<=endPage;p++){
            if(p==currentPage){
              out.print("<strong>["+p+"]</strong>");
            } else {
              out.print("<a href='javascript:fncGoPage("+p+");'>["+p+"]</a>");
            }
          }
          if(endPage<pageCount){
            out.print("<a href='javascript:fncGoPage("+
              (endPage+1)+");'>[다음]</a>");
          }
        %>
      </div>
    <% } else { %>
      <p class="error-message"><%=rm%></p>
    <% } %>
  </div>
  <%@ include file="/WEB-INF/views/Main/footer.jsp" %>
</body>
</html>
