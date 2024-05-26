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
    <title>${product.title }</title>
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="${base}/css/details.css">
    <style>
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
    <jsp:include page="/WEB-INF/views/khachhang/layouts/css.jsp"></jsp:include>
<%--    <link rel="stylesheet" type="text/css" href="${base}/css/details.css">--%>
</head>
<body>
<main class="container">

    <div class="free">Miễn phí vận chuyển với đơn hàng trên 1000k</div>
    <!--open header-->
    <jsp:include page="/WEB-INF/views/khachhang/layouts/header.jsp"></jsp:include>
    <!--close header-->

    <div class="navigation">
        <ul>
            <li><a href="${base }/home">Trang chủ </a></li>

            <li>/</li>

            <li><a href="#">${product.categories.name }</a></li>

            <li>/</li>

            <li>${product.title }</li>
        </ul>
    </div>
    <div class="content">

        <div class="content-cart">
            <div class="thongtin">
                <div class="tt-title">
                    <h1>${product.title }</h1>
                </div>
                <div class="tt-price">
                    <fmt:setLocale value="vi_VN"/>
                    <fmt:formatNumber value="${product.price}" type="currency"/>
                </div>
                <div style="margin-top: 20px;
                display: flex;
                align-items: center;">
                    <input id="quantity" type="hidden" value="${product.quantity - product.soldQuantity}" />
                    <div class="value-button" style="display: inline-block;
                    border: 1px solid #ddd;
                    margin: 0px;
                    width: 40px;
                    height: 20px;
                    text-align: center;
                    vertical-align: middle;
                    padding: 11px 0;
                    background: #eee;
                    -webkit-touch-callout: none;
                    -webkit-user-select: none;
                    -khtml-user-select: none;
                    -moz-user-select: none;
                    -ms-user-select: none;
                    cursor: pointer;
                    user-select: none;" id="decrease" onclick="decreaseValue()" value="Decrease Value">-</div>
                    <input style="text-align: center;
                    border: none;
                    border-top: 1px solid #ddd;
                    border-bottom: 1px solid #ddd;
                    margin: 0px;
                    width: 40px;
                    height: 40px;" onchange="changeValue(document.getElementById('quantity').value)" type="number" id="number" value="1" />
                    <div class="value-button" style="display: inline-block;
                    border: 1px solid #ddd;
                    margin: 0px;
                    width: 40px;
                    height: 20px;
                    text-align: center;
                    vertical-align: middle;
                    padding: 11px 0;
                    background: #eee;
                    cursor: pointer;
                    -webkit-touch-callout: none;
                    -webkit-user-select: none;
                    -khtml-user-select: none;
                    -moz-user-select: none;
                    -ms-user-select: none;
                    user-select: none;" id="increase" onclick="increaseValue(document.getElementById('quantity').value)" value="Increase Value">+</div>
                    <div style="margin-left: 15px;">
                        <span>${product.quantity - product.soldQuantity}</span><span> sản phẩm có sẵn</span>
                    </div>
                    <div style="margin-left: 15px;">
                        <span>${product.soldQuantity}</span><span> sản phẩm đã bán</span>
                    </div>
                </div>

                <div class="tt-cart">
<%--                    <div class="number-product">--%>
<%--                        <button type="button" onclick="UpdateQuanlityCart('${base }',${ci.productId })" class="cong">+--%>
<%--                        </button>--%>

<%--                        <strong><span--%>
<%--                                id="quanlity_${ci.productId }">${ci.quanlity }</span></strong>--%>
<%--                        <button type="button" class="tru">-</button>--%>
<%--                    </div>--%>

                    <c:if test="${product.quantity > 0}">
                        <div class="add">
                            <button type="button" class="add-cart"
                                    onclick="javascript:AddToCart('${base }', ${product.id}, document.getElementById('number').value);">THÊM
                                VÀO GIỎ
                            </button>
                        </div>
                    </c:if>
                    <c:if test="${product.quantity < 0}">
                        <div class="" style="color:black;opacity: .5;">
                            <button type="button" class="add-cart">HẾT HÀNG
                            </button>
                        </div>
                    </c:if>
                </div>
                <div class="tt-mota">
                    <h3>Mô tả</h3>
                    <p>${product.details}</p>
                </div>
            </div>
            <div class="sanpham">
                <img src="${base }/upload/${product.avatar}" width="100%">
            </div>
        </div>

        <div class="content-products">
            <div class="products-name">
                <a href="#"> SẢN PHẨM BÁN CHẠY</a>
            </div>
            <div class="list-product">

                <c:forEach items="${products }" var="product">
                    <div class="item">

                        <div class="item-images">
                            <a href="${base }/product/details/${product.seo}"> <img src="${base }/upload/${product.avatar}"
                                              width="100%">
                            </a>
                        </div>
                        <div class="item-content">
                            <a href="#">${product.title}</a>
                            <div class="price">
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${product.price}" type="currency"/>
                                <h4 class="new-price">
                                    <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber value="${product.price}" type="currency"/>
                                </h4>
                                <h5 class="old-price">
                                    <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber value="${product.price + 29000}" type="currency"/>
                                </h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!--close content-->

    <!--open footer -->
    <jsp:include page="/WEB-INF/views/khachhang/layouts/footer.jsp"></jsp:include>
    <!--close footer-->
    <div class="copyright">
        Copyright <i class="far fa-copyright"></i> <a href="#">pristine.</a> <a
            href="#">Powered by PRISTINE</a>
    </div>
</main>
</body>

<jsp:include page="/WEB-INF/views/khachhang/layouts/js.jsp"></jsp:include>
<script type="text/javascript">
    function increaseValue(quantity) {
  var value = parseInt(document.getElementById('number').value, 10);
  value = isNaN(value) ? 0 : value;
  value++;
  if(parseInt(quantity, 10) < value) {
    value = parseInt(quantity);
  }
  document.getElementById('number').value = value;
}

function decreaseValue() {
  var value = parseInt(document.getElementById('number').value, 10);
  value = isNaN(value) ? 0 : value;
  value < 1 ? value = 1 : '';
  value--;
  document.getElementById('number').value = value;
}

function changeValue(quantity) {
    if(parseInt(document.getElementById('number').value) > parseInt(quantity)) {
        document.getElementById('number').value = quantity;
    }
}
</script>
</html>