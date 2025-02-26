<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
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

        <title>LE.ON VietNam</title>
    </head>

<body>
    <!--==================== HEADER ====================-->
    <header class="header" id="header">
        <nav class="nav container">
             <a href="<c:url value="/"/>" class="nav__logo">
                    <div id="leon-logo"></div>
                </a>
            <div class="nav__menu" id="nav-menu">
                <ul class="nav__list grid" style="padding-right : 3rem; align-items: center;">
                    <li class="nav__item">
                        <a href="#home" class="nav__link active-link">
                            <i class="uil uil-estate nav__icon"></i>Home
                        </a>
                    </li>
                    <li class="nav__item">
                        <a href="#about" class="nav__link">
                            <i class="uil uil-user nav__icon"></i>About
                        </a>
                    </li>
                    <li class="nav__item">
                        <a href="#portfolio" class="nav__link">
                            <i class="uil uil-user nav__icon"></i>Feature
                        </a>
                    </li>

                        <li class="nav__item">

                            <a href="<c:url value="/signin"/>" class="nav__link button--signin">Sign In
                                <i class="uil uil-briefcase-alt nav__icon"></i>
                            </a>

                        </li>
                        <li class="nav__item">
                            <a href="<c:url value="/signup"/>" class="nav__link button--signup">
                                <i class="uil uil-scenery nav__icon"></i>Sign Up
                            </a>
                        </li>
                        <li class="nav__item">
                            <a href="#contact" class="nav__link">
                                <i class="uil uil-message nav__icon"></i>Contact
                            </a>
                        </li>
                    </ul>
                    <i class="uil uil-times nav__close" id="nav-close"></i>
                </div>

                <div class="nav__btns">
                    <!-- Theme chage button -->
                    <i class="uil uil-moon change-theme" id="theme-button"></i>
                    <div class="nav__toggle" id="nav-toggle">
                        <i class="uil uil-apps"></i>
                    </div>
                </div>

            </nav>
        </header>

        <!--==================== MAIN ====================-->
        <main class="main">
            <!--==================== HOME ====================-->
            <section class="home section" id="home">
                <div class="home__container container grid">
                    <div class="home__content grid">
                        <div class="home__social">
                            <a href="#" target="_blank" class="home__social-icon">
                                <i class="uil uil-instagram"></i>
                            </a>

                            <a href="#" target="_blank" class="home__social-icon">
                                <i class="uil uil-facebook-f"></i>
                            </a>

                            <a href="#" target="_blank" class="home__social-icon">
                                <i class="uil uil-facebook-messenger-alt"></i>
                            </a>



                        </div>

                        <div class="home__img">
                            <img src="assets/img/about.png" alt="">

                        </div>
                        <div class="home__data">
                            <h1 class="home__title">LE.ON</h1>
                            <h3 class="home__subtitle">An efficient way to manage the classroom</h3>
                            <p class="home__description button--data"><i class="uil uil-cloud-upload" style="color : blue ; padding-right: 10px;"></i>Provide resources for students</p>
                            <p class="home__description button--data"><i class="uil uil-desktop data--icon" style="color : orange ; padding-right: 10px;"></i>Exploiting learning materials</p>
                            <p class="home__description button--data" style="width : 250px"><i class="uil uil-channel data--icon" style="color : green ; padding-right: 10px;"></i>Give homework
                            </p>
                            <a href="<c:url value="/signin"/>" class="button button--flex">Sign In
                                <i class="uil uil-message button__icon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="home__scroll">
                        <a href="#about" class="home__scroll-button button--flex">
                            <i class="uil uil-mouse-alt home__scroll-mouse"></i>
                            <span class="home_scroll-name">Scrolldown</span>
                            <i class="uil uil-arrow-down home__scroll-arrow"></i>
                        </a>
                    </div>
                </div>
            </section>

            <!--==================== ABOUT ====================-->
            <section class="about section" id="about">
                <h2 class="section__title">About</h2>
                <span class="section__subtitle">LE.ON accompanies education nationwide</span>

                <div class="about__container container grid">
                    <img src="assets/img/Introduce.avif" alt="" class="about__img">
                    <div class="about__data">
                        <p class="about__description">
                            Present in 63 provinces and cities, with more than 3,000,000 users per day for teaching and learning, LE.ON becomes an online education community, a vast learning, teaching and sharing environment.
                        </p>

                        <div class="about__info">
                            <div>
                                <span class="about__info--title">3M +</span>
                                <span class="about__info--name">Student<br>
                                </span>
                            </div>
                            <div>
                                <span class="about__info--title">100K +</span>
                                <span class="about__info--name">Teacher<br>
                                </span>
                            </div>
                            <div>
                                <span class="about__info--title">2K +</span>
                                <span class="about__info--name">School<br>
                                    </div>
                                    </div>
                                    <div class="about__buttons">
                                        <a target="_blank" href="<c:url value="/signup"/>" class="button button--flex">
                                            Sign up<i style="padding-left : 5px ; font-size: 1.25rem;" class="uil uil-rocket"></i>
                                        </a>
                                    </div>
                            </div>
                        </div>
                        </section>


                        <!--==================== PORTFOLIO ====================-->
                        <section class="portfolio section" id="portfolio">
                            <h2 class="section__title">LE.ON brings you</h2>
                            <span class="section__subtitle">All modern teaching toolsi</span>

                            <div class="portfolio__container container swiper mySwiper">

                                <div class="swiper-wrapper">
                                    <!--==================== PORTFOLIO 1 ====================-->
                                    <div class="portfolio__content grid swiper-slide">
                                        <img src="assets/img/tinhang.avif" alt="" class="portfolio__img">
                                        <div class="portfolio__data">
                                            <h3 class="portfolio__title">Create and manage assignments and tests with AI</h3>
                                            <p class="portfolio__description">No need to edit complicated formulas, everything is okay Fully automatic identification with LE.ON Classroom. Besides, you are also provided with a variety of in-depth customizations according to each use need.</p>
                                            <a target="_blank" href="<c:url value="/signin"/>" class="button button--flex button--small portfolio__button">
                                                Sgin In
                                                <i class="uil uil-arrow-right button__icon"></i>
                                            </a>

                                        </div>
                                    </div>

                                    <!--==================== PORTFOLIO 2 ====================-->
                                    <div class="portfolio__content grid swiper-slide">
                                        <img src="assets/img/tinhnang2.jpg" alt="" class="portfolio__img">
                                        <div class="portfolio__data">
                                            <h3 class="portfolio__title">Highly customizable classes</h3>
                                            <p class="portfolio__description">Classes on LE.ON Classroom can be used for many different purposes such as: regular classes, extra classes, foreign language classes, professional skills, professional skills, online classes, livestream...</p>
                                            <a target="_blank" href="<c:url value="/signin"/>" class="button button--flex button--small portfolio__button">
                                                Sign In
                                                <i class="uil uil-arrow-right button__icon"></i>
                                            </a>

                                        </div>
                                    </div>

                                    <!--==================== PORTFOLIO 3 ====================-->
                                    <div class="portfolio__content grid swiper-slide">
                                        <img src="assets/img/tinhang3.JPEG" alt="" class="portfolio__img">
                                        <div class="portfolio__data">
                                            <h3 class="portfolio__title">Unlimited storage of learning materials</h3>
                                            <p class="portfolio__description">Your resources are conveniently stored and organized, which you can share with your students and reuse them for the next class.</p>
                                            <a target="_blank" href="<c:url value="/signin"/>" class="button button--flex button--small portfolio__button">
                                                Sign In
                                                <i class="uil uil-arrow-right button__icon"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- add arrows -->
                                <div class="swiper-button-next">
                                    <i class="uil uil-angle-right swiper-portfolio-icon"></i>
                                </div>
                                <div class="swiper-button-prev">
                                    <i class="uil uil-angle-left swiper-portfolio-icon"></i>
                                </div>
                                <!--add pagination  -->
                                <div class="swiper-pagination"></div>
                            </div>
                        </section>

                        <!--==================== PROJECT IN MIND ====================-->
                        <section class="project section">
                            <div class="project__bg">
                                <div class="project__container container grid">
                                    <div class="project__data">
                                        <h2 class="project__title">Update LE.ON Plus</h2>
                                        <p class="project__description">Discount 25% now</p>
                                        <a href="#" class="button button--flex button--white">
                                            Click to update LE.ON+
                                            <i class="uil uil-message project__icon button__icon"></i>
                                        </a>
                                    </div>
                                    <img src="assets/img/plus.png" alt="">
                                </div>
                            </div>
                        </section>

                        <!--==================== TESTIMONIAL ====================-->
                        <section class="testimonial section">
                            <h2 class="section__title">What students say about LE.ON</h2>
                            <span class="section__subtitle">90% of students who use LE.ON say they have improved their grades.</span>
                            <div class="testimonial__container container swiper mySwiper">
                                <div class="swiper-wrapper">
                                    <!--==================== TESTIMONIAL  1====================-->
                                    <div class="testimonial__content swiper-slide">
                                        <div class="testimonial__data">
                                            <div class="testimonial__header">
                                                <img src="assets/img/hocsinh1.png" alt="" class="testimonial__img">

                                                <div>
                                                    <h3 class="testimonial__name">Nguyen Le Mai</h3>
                                                    <span class="testimonial__client">FBT University</span>
                                                </div>
                                            </div>

                                            <div>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>

                                            </div>
                                        </div>

                                        <p class="testimonial__description">
                                            All of our friends use LE.ON. It's a fun way to learn and we feel more confident as we prepare for midterms and finals.
                                        </p>
                                    </div>



                                    <!--==================== TESTIMONIAL  2====================-->
                                    <div class="testimonial__content swiper-slide">
                                        <div class="testimonial__data">
                                            <div class="testimonial__header">
                                                <img src="assets/img/hocsinh2.png" alt="" class="testimonial__img">

                                                <div>
                                                    <h3 class="testimonial__name">Tony Ducanh</h3>
                                                    <span class="testimonial__client">English Pododo</span>
                                                </div>
                                            </div>

                                            <div>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>

                                            </div>
                                        </div>

                                        <p class="testimonial__description">
                                            LE.ON has fueled my success since high school. The flashcards that can be used on the go are helping me a lot in college.
                                    </div>

                                    <!--==================== TESTIMONIAL  3====================-->
                                    <div class="testimonial__content swiper-slide">
                                        <div class="testimonial__data">
                                            <div class="testimonial__header">
                                                <img src="assets/img/hocsinh4.png" alt="" class="testimonial__img">

                                                <div>
                                                    <h3 class="testimonial__name">Le Phi Phi</h3>
                                                    <span class="testimonial__client">Student of NEU</span>
                                                </div>
                                            </div>

                                            <div>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>
                                                <i class="uil uil-star testimonial__icon-star"></i>

                                            </div>
                                        </div>

                                        <p class="testimonial__description">
                                            LE.ON is the best learning app I've ever used. A perfect website that can help me study up to 7-8 hours a day
                                        </p>
                                    </div>
                                </div>
                                <!-- add pagination -->
                                <div class="swiper-pagination swiper-pagination-testimonial"></div>
                            </div>
                        </section>

                        <!--==================== CONTACT ME ====================-->
                        <section class="contact section" id="contact">
                            <h2 class="section__title">Contact</h2>
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

                                <form action="" class="contact__form" id="contact-form">
                                    <div class="contact__inputs grid">
                                        <div class="contact__content">
                                            <label for="" class="contact__label">Name</label>
                                            <input name="from_name" type="text" class="contact__input" id="contact-name">
                                        </div>

                                        <div class="contact__content">
                                            <label for="" class="contact__label">Email</label>
                                            <input name="user_email" type="email" class="contact__input" id="contact-email">
                                        </div>
                                        <div class="contact__content">
                                            <label for="" class="contact__label">Message</label>
                                            <textarea name="message" id="contact-message" class="contact__input" id="" cols="0" rows="7"></textarea>
                                            <!-- <input name="message" class="contact__input" id="contact-message"></inpit> -->
                                        </div>
                                        <p class="contact__mess" id="contact-mess"></p>


                                        <div>
                                            <button class="button button--flex" style="border : none ; font-size: medium ;">
                                                Send Message
                                                <i class="uil uil-envelope-send button__icon"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </section>
                        </main>

                        <!--==================== FOOTER ====================-->
                        <footer class="footer">
                            <div class="footer__bg">
                                <div class="footer__container container grid">
                                    <div class="footer__data">
                                        <h1 class="footer__title">LE.ON</h1>
                                        <span class="footer__subtitle">By LE.ON Company</span>
                                    </div>
                                    <ul class="footer__links">
                                        <!-- <li>
                                            <a href="#services" class="footer__link">
                                                Services
                                            </a>
                                        </li> -->

                                        <li>
                                            <a href="#portfolio" class="footer__link">

                                            </a>
                                        </li>

                                        <li>
                                            <a href="#contact" class="footer__link">
                                                Contact
                                            </a>
                                        </li>
                                    </ul>

                                    <div class="footer__socials">
                                        <a href="#" class="footer__social" target="_blank">
                                            <i class="uil uil-facebook-f"></i>
                                        </a>

                                        <a href="#" class="footer__social" target="_blank">
                                            <i class="uil uil-instagram"></i>
                                        </a>


                                    </div>
                                </div>

                                <p class="footer__copy">LE.ON 2022</p>
                            </div>
                        </footer>

                        <!-- <button class="theme-btn theme-btn-desktop light">
                            <i class="uil uil-moonset moon"></i>
                            <i class="uil uil-sun sun"></i>
                          </button> -->

                        <!--==================== SCROLL TOP ====================-->
                        <a href="#" class="scrollup" id="scroll-up">
                            <i class="uil uil-arrow-up scrollup__icon"></i>
                        </a>

                        <!--==================== EMAIL JS ====================-->
                        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

                        <!--==================== SWIPER JS ====================-->
                        <script src="assets/js/swiper-bundle.min.js"></script>

                        <!--==================== MAIN JS ====================-->
                        <script src="assets/js/main.js"></script>



                        </body>

                        </html>