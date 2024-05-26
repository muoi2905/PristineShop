<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!--import JSTL-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Fashion Msic</title>

    <jsp:include page="/WEB-INF/views/khachhang/layouts/css.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${base}/css/checkOrder.css">
</head>
<body>
<main class="container">
    <div class="free">Miễn phí vận chuyển với đơn hàng trên 1000k</div>

    <jsp:include page="/WEB-INF/views/khachhang/layouts/header.jsp"></jsp:include>

    <form action="${base }/checkOrder?email=${userLogined.email}" method="get">
        <div class="check-body">
            <div class="container-content">
                <h3>Danh sách đơn hàng</h3>
                <div id="TB_AJAX_CONTACT"
                     style="text-align: center; margin-top: 15px; color: #766b6b; margin-bottom: -16px;">
                </div>
                <c:if test="${not empty orderWithPaging}" >
                    <div class="showOrder">

                        <table class="">
                            <thead class="">
                            <tr class="">
                                <th scope="col">Mã đơn</th>
                                <th scope="col">Email</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Giá sản phẩm</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col"></th>
                            </tr>
                            </thead>

                            <tbody>

                            <c:forEach items="${orderWithPaging.data}" var="orderProduct"
                                       varStatus="loop">
                                <tr>
                                    <td>${orderProduct.saleOrder.code }</td>
                                    <td>${orderProduct.saleOrder.customer_email }</td>
                                    <td>${orderProduct.product.title }</td>
                                    <td>${orderProduct.product.price }</td>
                                    <td>${orderProduct.quality }</td>
                                    <td>${orderProduct.quality * orderProduct.product.price} </td>
                                    <c:if test="${orderProduct.saleOrder.orderStatus == 0}"><td>Chờ xử lý</td></c:if>
                                    <c:if test="${orderProduct.saleOrder.orderStatus == 1}"><td>Đang giao</td></c:if>
                                    <c:if test="${orderProduct.saleOrder.orderStatus == 2}"><td>Thành công</td></c:if>
                                    <c:if test="${orderProduct.saleOrder.orderStatus == 3}"><td>Đã hủy</td></c:if>
                                    <td>
                                        <c:if test="${orderProduct.saleOrder.orderStatus == 1}">
                                            <button><a href="${base}/orders/update-status/${orderProduct.saleOrder.id}?status=2&email=${userLogined.email}">Đã nhận được hàng</a></button>
                                        </c:if>
                                        <c:if test="${orderProduct.saleOrder.orderStatus == 0}">
                                            <button><a href="${base}/orders/update-status/${orderProduct.saleOrder.id}?status=3&email=${userLogined.email}">Hủy đơn</a></button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

            </div>
                </c:if>
            </div>
        </div>
    </form>
    <jsp:include page="/WEB-INF/views/khachhang/layouts/footer.jsp"></jsp:include>
    <div class="copyright">
        Copyright <i class="far fa-copyright"></i> <a href="#">pristine.</a> <a
            href="#">Powered by PRISTINE</a>
    </div>
</main>

</body>
<jsp:include page="/WEB-INF/views/khachhang/layouts/js.jsp"></jsp:include>
<script type="text/javascript">

</script>
</html>