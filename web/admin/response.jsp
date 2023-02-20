<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="<c:url value="/assets/css/styles.css"/>">  
        <link rel="icon" href="assets/img/leon-icon.png">
        <script src="assets/js/swiper-bundle.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>


        <title>LE.ON VietNam</title>
    </head>
    <header class="header" id="header">
        <nav class="nav container">
            <a href="<c:url value="/"/>" class="nav__logo">
                <div id="leon-logo"></div>
            </a>


        </nav>
    </header>
    <body>
        <div class="content" style="margin-top: 50px;">
            <section class="contact section" id="contact" style="padding-top: 100px">
                <h2 class="section__title">Response feedback</h2>
                <span class="section__subtitle">Support by LE.ON</span>
                <form action="<c:url value="/admin/response"/>" method="post" class="contact__form" id="contact-form">
                    <div class="contact__inputs grid">
                        <div class="contact__content">
                            <label for="" class="contact__label">Email</label>
                            <input value="${emailResponse}" readonly="" name="feedbackEmail" type="text" class="contact__input" id="contact-name">
                        </div>
                        <div class="contact__content">
                            <label for="" class="contact__label">Title</label>
                            <input value="${titleFeedback}" readonly="" name="feedbackTitle" type="text" class="contact__input" id="contact-name">
                        </div>
                        <div class="contact__content">
                            <label for="" class="contact__label">Content</label>
                            <textarea readonly name="feedbackContent" id="contact-message" class="contact__input"  cols="0" rows="7">${contentFeedback}</textarea>
                        </div>
                        <div class="contact__content">
                            <label for="" class="contact__label">Response</label>
                            <textarea name="feedbackResponse" id="contact-message" class="contact__input" id="" cols="0" rows="5">${responseFeedback}</textarea>
                        </div>
                        <input hidden="" value="${feedbackId}" name="Id">
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

</body>



