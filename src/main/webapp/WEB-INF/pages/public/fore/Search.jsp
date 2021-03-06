<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 17-11-30
  Time: 下午4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<a href="${contextPath}">
    <img id="logo" src="https://chenbxxx.oss-cn-beijing.aliyuncs.com/tmallCopy_images/site/logo.gif" class="logo">
</a>

<form action="search">
    <div class="searchDiv">
        <input name="keyword" placeholder="时尚男鞋  太阳镜 ">
        <button class="searchButton">搜索</button>
        <div class="searchBelow">
            <c:forEach items="${categories}" var="c" varStatus="st">
                <c:if test="${st.count>=0 and st.count<=4}">
                        <span>
                            <a href="category?cid=${c.id}">
                                    ${c.name}
                            </a>
                            <c:if test="${st.count!=4}">
                                <span>|</span>
                            </c:if>
                        </span>
                </c:if>
            </c:forEach>
        </div>
    </div>
</form>
