<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
{
	"resultFrom" : ${resultFrom},
	"resultTo" : ${resultTo},
	"scatter" : [
    <jsp:useBean id="scatter" scope="request" type="java.util.List<com.navercorp.pinpoint.web.vo.scatter.Dot>"/>
	<c:forEach items="${scatter}" var="dot" varStatus="status">
		{
			"x" : ${dot.acceptedTime},
			"y" : ${dot.elapsedTime},
			"traceId" : "${dot.transactionId}",
			"type" : <c:choose><c:when test="${dot.exceptionCode == 1}">"Failed"</c:when><c:otherwise>"Success"</c:otherwise></c:choose>
		}
	    <c:if test="${!status.last}">,</c:if>
	</c:forEach>
	]
}