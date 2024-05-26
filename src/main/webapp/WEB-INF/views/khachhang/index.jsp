<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>

<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PRISTINE</title>

    <jsp:include page="/WEB-INF/views/khachhang/layouts/css.jsp"></jsp:include>
</head>
<body>
<main class="container">
    <div class="free">Miễn phí vận chuyển với đơn hàng trên 1000k</div>

    <jsp:include page="/WEB-INF/views/khachhang/layouts/header.jsp"></jsp:include>

    <%--open content --%>
    <div class="content">
        <img style="height: 487px;" src="${base }/img/a.jpg" width="100%">
        <!--open new item-->

        <div class="products">
            <div class="products-name">
                <a href="#"> SẢN PHẨM </a>
            </div>

            <div class="list-product" style="flex-wrap: wrap;">

                <c:forEach items="${productsWithPaging.data }" var="product">
                    <div class="item">

                        <div class="item-images">
                            <a href="${base }/product/details/${product.seo}"> <img
                                    src="${base }/upload/${product.avatar}"
                                    width="100%">
                            </a>
                        </div>
                        <div class="item-content">
                            <a href="${base }/product/details/${product.seo}">
                                    ${product.title } </a>
                            <div class="price">
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${product.price}" type="currency"/>
                            </div>

                        </div>
                    </div>

                    <!-- Paging -->

                </c:forEach>
            </div>

            <div style="padding: 0 0 20px 0;" class="row">
                <div style="display: flex;align-items: center;justify-content: center;" class="col-12 d-flex justify-content-center">
                    <div id="paging"></div>
                </div>
            </div>



            <!--open product-->

            <div class="logo-item">
                <div class="logo-item-list">
                    <a href="${base }/collection/43"> <img
                            src="${base }/img/c.jpg" width="100%">
                    </a>
                    <h3 class="logo-name">VÒNG CỔ</h3>
                    <div class="add">
                        <a href="${base }/collection/43">MUA NGAY</a>
                    </div>
                </div>
                <div class="logo-item-list">
                    <a href="${base }/collection"> <img
                            src="${base }/img/d.jpg" width="100%">
                    </a>
                    <h3 class="logo-name-collection">PRISTINE</h3>
                    <div class="add-collection">
                        <a href="${base }/collection">XEM THÊM</a>
                    </div>
                </div>
                <div class="logo-item-list">
                    <a href="${base }/collection/42"> <img
                            src="${base }/img/e.jpg" width="100%">
                    </a>
                    <h3 class="logo-name">NHẪN</h3>
                    <div class="add">
                        <a href="${base }/collection/42">MUA NGAY</a>
                    </div>
                </div>
            </div>
        </div>
        <!--close products-->

        <!--open about us -->
        <div class="about">
            <div class="about-us">
                <a href="${base }/introduction"> <img
                        src="${base }/img/aboutus.png" width="80%">
                </a>
                <h3 class="about-title">ABOUT US</h3>
                <div class="about-button">
                    <a href="${base }/introduction"> XEM NGAY </a>
                </div>
            </div>
            <div class="about-us">

                <p>PRISTINE là thương hiệu được thành lập từ
                    25/03/2024.</p>

                <p>Chào mừng đến với Pristine - điểm đến lý tưởng cho những người yêu thích và tìm kiếm những món trang sức tinh tế và sang trọng. Pristine không chỉ là một trang web bán hàng, mà còn là một điểm đến tinh tế và đầy sức hút cho những người đam mê thời trang.</p>

                <p>Với một bộ sưu tập đa dạng các loại trang sức, từ nhẫn đính đá lấp lánh, dây chuyền thanh lịch, đến bông tai tinh tế và vòng cổ quyến rũ, Pristine cung cấp một loạt các sản phẩm độc đáo được thiết kế với tinh thần sáng tạo và tinh tế.</p>

                <p>Sứ mệnh của chúng tôi là mang lại trải nghiệm mua sắm trực tuyến hoàn hảo, nơi mọi khách hàng đều có thể tìm thấy những món trang sức phản ánh phong cách và cá tính riêng của mình. Chúng tôi cam kết mang đến sự hài lòng cao nhất cho khách hàng thông qua chất lượng sản phẩm, dịch vụ chăm sóc khách hàng tận tâm và trải nghiệm mua sắm trực tuyến thuận tiện và an toàn.</p>

                <p>Hãy khám phá bộ sưu tập độc đáo của chúng tôi và tạo ra phong cách riêng của bạn với Pristine - nơi nâng tầm vẻ đẹp và phong cách của bạn!</p>
            </div>
        </div>
        <!--close about us-->

    </div>
    <!--close content-->

    <%--close content --%>
    <jsp:include page="/WEB-INF/views/khachhang/layouts/footer.jsp"></jsp:include>
    <div class="copyright">
        Copyright <i class="far fa-copyright"></i> <a href="#">pristine.</a> <a
            href="#">Powered by PRISTINE</a>
    </div>
</main>

</body>
<jsp:include page="/WEB-INF/views/khachhang/layouts/js.jsp"></jsp:include>
<script type="text/javascript">

		
    $( document ).ready(function() {
        console.log(${productsWithPaging.totalItems})
        $("#paging").pagination({
            currentPage: ${productsWithPaging.currentPage + 1},
            items: ${productsWithPaging.totalItems},
            itemsOnPage: 20,
            cssStyle: 'dark-theme',
            onPageClick: function(pageNumber, event) {
                event.preventDefault();
                window.location.href = window.location.href.substring(0, window.location.href.indexOf('&') != -1 ? window.location.href.indexOf('&') : window.location.href.length) + (window.location.href.indexOf('?') != -1 ? '&page=' :'?page=') + (pageNumber - 1);
            },
        });
    });
</script>
</html>