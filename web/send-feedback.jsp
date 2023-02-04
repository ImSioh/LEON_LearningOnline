<%@include file= "/template/header-profile.jsp" %>
<div class="content" style="margin-top: 50px;">
    <section class="contact section" id="contact" style="padding-top: 100px">
        <h2 class="section__title">Feedback</h2>
        <span class="section__subtitle">Support by LE.ON</span>

        <div class="contact__container container grid">
            <div>
                <div class="contact__information">
                    <i class="uil uil-phone contact__icon"></i>

                    <div>
                        <h3 class="contact__title">PhoneNumber</h3>
                        <span class="contact__subtitle">0912345678</span>

                    </div>
                </div>

                <div class="contact__information">
                    <i class="uil uil-envelope-heart contact__icon"></i>

                    <div>
                        <h3 class="contact__title">Email</h3>
                        <span class="contact__subtitle">leoneduservice@gmail.com</span>

                    </div>
                </div>


                <div class="contact__information">
                    <i class="uil uil-map-marker contact__icon"></i>

                    <div>
                        <h3 class="contact__title">Location</h3>
                        <span class="contact__subtitle">Hoa Lac,Ha Noi,Viet Nam</span>

                    </div>
                </div>
            </div>

            <form action="<c:url value="/SendFeedback"/>" method="post" class="contact__form" id="contact-form">
                <div class="contact__inputs grid">
                    <div class="contact__content">
                        <label for="" class="contact__label">Title</label>
                        <input name="feedbackTitle" type="text" class="contact__input" id="contact-name">
                    </div>
                    <div class="contact__content">
                        <label for="" class="contact__label">Content</label>
                        <textarea name="feedbackContent" id="contact-message" class="contact__input" id="" cols="0" rows="7"></textarea>
                    </div>
                    <p class="contact__mess" id="contact-mess"></p>
                    <div style="color : red">${msg}</div>
                    <div>
                        <button class="button button--flex" style="border : none ; font-size: medium ; margin-bottom: 20px">
                            Send Feedback
                            <i class="uil uil-envelope-send button__icon"></i>
                        </button>
                    </div>

                </div>
            </form>
        </div>
    </section>
</div>
<div class="footer">

</div>
</div>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--==================== UNICONS ====================-->
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

<!--==================== SWIPER CSS ====================-->
<link rel="stylesheet" href="assets/css/swiper-bundle.min.css">

<!--==================== CSS ====================-->
<link rel="stylesheet" href="assets/css/styles.css">
<!-- Icon -->
<link rel="icon" href="assets/img/leon-icon.png">
</body>



