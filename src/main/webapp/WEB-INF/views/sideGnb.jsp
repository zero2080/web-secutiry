<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="<%=request.getContextPath() %>"/>

<aside>
    <div>
        <img src="${conPath}/icon/apple-icon-180x180.png" alt="로고"/>
    </div>
    <ul class="gnb">
     <a href="${conPath}/main">
         <li>
             게시판
         </li>
     </a>
     <a href="${conPath}/message">
         <li>
           	메세지함
         </li>
     </a>
    </ul>
</aside>