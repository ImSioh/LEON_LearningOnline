<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Change password | LE.ON</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Quicksand', sans-serif;;
            }
            svg#freepik_stories-reset-password:not(.animated) .animable {
                opacity: 0;
            }
            svg#freepik_stories-reset-password.animated
                #freepik--background-complete--inject-3 {
                animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
                    slideLeft;
                animation-delay: 0s;
            }
            svg#freepik_stories-reset-password.animated
                #freepik--Shadow--inject-3 {
                animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
                    lightSpeedRight;
                animation-delay: 0s;
            }
            svg#freepik_stories-reset-password.animated
                #freepik--Tab--inject-3 {
                animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
                    slideDown;
                animation-delay: 0s;
            }
            #password-form {
                animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideDownFake;
                animation-delay: 1s;
            }
            svg#freepik_stories-reset-password.animated
                #freepik--Plant--inject-3 {
                animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
                    slideRight;
                animation-delay: 0s;
            }
            svg#freepik_stories-reset-password.animated
                #freepik--Icon--inject-3 {
                animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
                    zoomIn;
                animation-delay: 0s;
            }
            svg#freepik_stories-reset-password.animated
                #freepik--Padlock--inject-3 {
                animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
                    slideLeft;
                animation-delay: 0s;
            }
            svg#freepik_stories-reset-password.animated
                #freepik--speech-bubble--inject-3 {
                animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
                    slideLeft;
                animation-delay: 0s;
            }
            svg#freepik_stories-reset-password.animated
                #freepik--Character--inject-3 {
                animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38)
                    slideRight;
                animation-delay: 0s;
            }
            @keyframes slideLeft {
                0% {
                    opacity: 0;
                    transform: translateX(-30px);
                }
                100% {
                    opacity: 1;
                    transform: translateX(0);
                }
            }
            @keyframes lightSpeedRight {
                from {
                    transform: translate3d(50%, 0, 0) skewX(-20deg);
                    opacity: 0;
                }
                60% {
                    transform: skewX(10deg);
                    opacity: 1;
                }
                80% {
                    transform: skewX(-2deg);
                }
                to {
                    opacity: 1;
                    transform: translate3d(0, 0, 0);
                }
            }
            @keyframes slideDown {
                0% {
                    opacity: 0;
                    transform: translateY(-30px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            @keyframes slideRight {
                0% {
                    opacity: 0;
                    transform: translateX(30px);
                }
                100% {
                    opacity: 1;
                    transform: translateX(0);
                }
            }
            @keyframes zoomIn {
                0% {
                    opacity: 0;
                    transform: scale(0.5);
                }
                100% {
                    opacity: 1;
                    transform: scale(1);
                }
            }
            @keyframes slideDownFake {
                0% {
                    display: none;
                }
                100% {
                    display: block;
                }
            }
            
            body {
                max-height: 100vh;
                margin: 0 !important;
            }
            
            svg {
                max-height: 100%;
                max-width: 100%;
            }

            #input-list {
                font-family: Arial, Helvetica, sans-serif;
                font-weight: bold;
                position: absolute;
                left: 214.3px;
                top: 133.42px;
                height: 234.31px;
                width: 130.84px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                gap: 6px;
                color: #637483;
            }

            #input-list .input-label {
                font-size: 0.6rem;
                display: block;
                margin-bottom: 2px;
            }

            #input-list p {
                font-size: 0.5rem;
                font-weight: normal;
                text-align: center;
            }

            .password-input {
                width: 100%;
                height: 22.4px;
                outline-style: none;
                border-style: none;
                color: #a8adaf;
                font-size: 0.7rem;
                letter-spacing: 0.05rem;
                padding: 0 6px;
                border-radius: 4px;
            }
            
            input.error {
                border: 1px solid crimson;
            }

            .content {
                position: relative;
            }

            #password-form {
                width: 100%;
                max-height: 100vh;
                display: flex;
                justify-content: center;
            }

            #submit-btn {
                cursor: pointer;
                display: block;
                width: 80%;
                margin: 0 auto;
                background-color: #589ee0;
                color: white;
                font-size: 0.55rem;
                position: relative;
                z-index: 10;
                transition: all ease 0.2s;
                font-weight: bold;
            }

            #submit-btn:hover {
                top: -1px;
                filter: brightness(1.1);
            }

            .shadow {
                background-color: black;
                opacity: 0.2;
                position: absolute;
                top: 1px;
                left: 50%;
                width: 80%;
                height: 22.4px;
                border-radius: 4px;
                transform: translateX(-50%);
            }

            label.error {
                margin-top: 2px;
                font-weight: normal;
                color: crimson;
                font-size: 0.5rem;
                display: block;
            }

            #profile-picture {
                width: 36%;
                border-radius: 50%;
                overflow: hidden;
                box-shadow: 0 0 4px rgba(0, 0, 0, 0.1);
            }

            #profile-picture > div {
                width: 100%;
                background-image: url(<c:url value="${profilePicture == null ? '/assets/img/blank_profile_picture.jpg' : profilePicture}"/>);
                padding-top: 100%;
                background-position: center;
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
        <link rel="icon" href="<c:url value="/assets/img/leon-icon.png"/>">
        <link rel="stylesheet" href="<c:url value="/assets/css/styles.css"/>">
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    </head>
    <body>
        <header class="header" id="header">
            <nav class="nav container">
                <a href="<c:url value="/"/>" class="nav__logo">
                    <div id="leon-logo"></div>
                </a>
            </nav>
        </header>
        <div class="content">
            <form action="" method="POST" id="password-form">
                <input type="hidden" name="token" value="${token}">
                <input type="hidden" name="email" value="${email}">
                <svg class="animated" id="freepik_stories-reset-password" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs">
                    <g id="freepik--background-complete--inject-3" class="animable" style="transform-origin: 250px 228.23px;">
                      <rect y="382.4" width="500" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 250px 382.525px;" id="el3witchbjbl8" class="animable"></rect>
                      <rect x="416.78" y="398.49" width="33.12" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 433.34px 398.615px;" id="elsrctjeesb6c" class="animable"></rect>
                      <rect x="322.53" y="401.21" width="8.69" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 326.875px 401.335px;" id="el9xjtr7ts1l" class="animable"></rect>
                      <rect x="396.59" y="389.21" width="19.19" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 406.185px 389.335px;" id="elyssxctvlqog" class="animable"></rect>
                      <rect x="52.46" y="390.89" width="43.19" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 74.055px 391.015px;" id="el3iobp3rk32n" class="animable"></rect>
                      <rect x="104.56" y="390.89" width="6.33" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 107.725px 391.015px;" id="elcds7cujizm" class="animable"></rect>
                      <rect x="131.47" y="395.11" width="93.68" height="0.25" style="fill: rgb(235, 235, 235); transform-origin: 178.31px 395.235px;" id="el9n0b8isma9k" class="animable"></rect>
                      <path d="M237,337.8H43.91a5.71,5.71,0,0,1-5.7-5.71V60.66A5.71,5.71,0,0,1,43.91,55H237a5.71,5.71,0,0,1,5.71,5.71V332.09A5.71,5.71,0,0,1,237,337.8ZM43.91,55.2a5.46,5.46,0,0,0-5.45,5.46V332.09a5.46,5.46,0,0,0,5.45,5.46H237a5.47,5.47,0,0,0,5.46-5.46V60.66A5.47,5.47,0,0,0,237,55.2Z" style="fill: rgb(235, 235, 235); transform-origin: 140.46px 196.4px;" id="eloi66u2q59ti" class="animable"></path>
                      <path d="M453.31,337.8H260.21a5.72,5.72,0,0,1-5.71-5.71V60.66A5.72,5.72,0,0,1,260.21,55h193.1A5.71,5.71,0,0,1,459,60.66V332.09A5.71,5.71,0,0,1,453.31,337.8ZM260.21,55.2a5.47,5.47,0,0,0-5.46,5.46V332.09a5.47,5.47,0,0,0,5.46,5.46h193.1a5.47,5.47,0,0,0,5.46-5.46V60.66a5.47,5.47,0,0,0-5.46-5.46Z" style="fill: rgb(235, 235, 235); transform-origin: 356.75px 196.4px;" id="eltqxrv5mwwun" class="animable"></path>
                      <path d="M253.21,157.82a60.61,60.61,0,0,0-8.71-20.95l7.5-9.06-16-16-9.06,7.5A60.69,60.69,0,0,0,206,110.56l-1.1-11.67H182.18l-1.1,11.67a60.56,60.56,0,0,0-20.94,8.71l-9.06-7.5-16,16,7.5,9.06a60.61,60.61,0,0,0-8.71,20.95l-11.68,1.1v22.67l11.68,1.1a60.69,60.69,0,0,0,8.71,20.95L135,212.7l16,16,9.06-7.5a60.37,60.37,0,0,0,20.94,8.71l1.1,11.68h22.68l1.1-11.68a60.5,60.5,0,0,0,20.95-8.71l9.06,7.5,16-16-7.5-9.06a60.69,60.69,0,0,0,8.71-20.95l11.68-1.1V158.92Zm-29,12.43a30.7,30.7,0,1,1-30.7-30.7A30.69,30.69,0,0,1,224.22,170.25Z" style="fill: rgb(224, 224, 224); transform-origin: 193.485px 170.24px;" id="elszdwack34sm" class="animable"></path>
                      <path d="M318.25,266.65,319,275h16.29l.79-8.39a43.58,43.58,0,0,0,15.05-6.25l6.51,5.39,11.53-11.53-5.39-6.51a43.47,43.47,0,0,0,6.25-15.05l8.39-.79V215.62l-8.39-.79a43.47,43.47,0,0,0-6.25-15.05l5.39-6.51-11.53-11.52-6.51,5.39a43.41,43.41,0,0,0-15.05-6.26l-.79-8.39H319l-.79,8.39a43.49,43.49,0,0,0-15.05,6.26l-6.51-5.39-11.52,11.52,5.39,6.51a43.49,43.49,0,0,0-6.26,15.05l-8.39.79v16.29l8.39.79a43.49,43.49,0,0,0,6.26,15.05l-5.39,6.51,11.52,11.53,6.51-5.39A43.66,43.66,0,0,0,318.25,266.65Zm8.94-20.83a22.06,22.06,0,1,1,22.05-22A22.06,22.06,0,0,1,327.19,245.82Z" style="fill: rgb(224, 224, 224); transform-origin: 327.145px 223.745px;" id="el45cgawyzxbt" class="animable"></path>
                      <path d="M110.51,346.92l.4,4.28h8.31l.41-4.27a22.27,22.27,0,0,0,7.67-3.2l3.32,2.75,5.88-5.87-2.75-3.32a22.22,22.22,0,0,0,3.19-7.68l4.28-.4V320.9l-4.28-.4a22.22,22.22,0,0,0-3.19-7.68l2.75-3.32-5.88-5.88-3.32,2.75a22.25,22.25,0,0,0-7.67-3.19l-.41-4.28h-8.31l-.4,4.28a22.25,22.25,0,0,0-7.67,3.19l-3.32-2.75-5.88,5.88,2.75,3.32a22,22,0,0,0-3.19,7.68l-4.28.4v8.31l4.28.4a22,22,0,0,0,3.19,7.68l-2.75,3.32,5.88,5.87,3.32-2.75A22.06,22.06,0,0,0,110.51,346.92Zm4.56-10.62a11.25,11.25,0,1,1,11.25-11.25A11.25,11.25,0,0,1,115.07,336.3Z" style="fill: rgb(240, 240, 240); transform-origin: 115.07px 325.05px;" id="ele60xv252ylh" class="animable"></path>
                      <path d="M409.25,326.16l.33,3.52h6.84l.33-3.52a18.31,18.31,0,0,0,6.32-2.63l2.73,2.27,4.84-4.84-2.27-2.73a18.23,18.23,0,0,0,2.63-6.32l3.52-.33v-6.84l-3.52-.33a18.31,18.31,0,0,0-2.63-6.32l2.27-2.73-4.84-4.84-2.73,2.27a18.31,18.31,0,0,0-6.32-2.63l-.33-3.52h-6.84l-.33,3.52a18.31,18.31,0,0,0-6.32,2.63l-2.73-2.27-4.84,4.84,2.27,2.73a18.31,18.31,0,0,0-2.63,6.32l-3.52.33v6.84l3.52.33a18.23,18.23,0,0,0,2.63,6.32L395.36,321l4.84,4.84,2.73-2.27A18.31,18.31,0,0,0,409.25,326.16Zm3.75-8.74a9.26,9.26,0,1,1,9.26-9.26A9.27,9.27,0,0,1,413,317.42Z" style="fill: rgb(240, 240, 240); transform-origin: 413px 308.16px;" id="elnpw2x56nf8" class="animable"></path>
                      <path d="M231.73,380.75h19.4l.94-10A51.52,51.52,0,0,0,270,363.31l7.75,6.42L291.45,356,285,348.26a51.67,51.67,0,0,0,7.44-17.92l10-.94V310l-10-.94A51.7,51.7,0,0,0,285,291.15l6.41-7.75-13.72-13.72L270,276.09a51.91,51.91,0,0,0-17.91-7.45l-.94-10h-19.4l-.94,10a51.88,51.88,0,0,0-17.92,7.45l-7.75-6.41L191.4,283.4l6.42,7.75a51.52,51.52,0,0,0-7.45,17.91l-10,.94v19.4l10,.94a51.5,51.5,0,0,0,7.45,17.92L191.4,356l13.72,13.72,7.75-6.42a51.5,51.5,0,0,0,17.92,7.45Zm9.7-34.79a26.26,26.26,0,1,1,26.26-26.26A26.26,26.26,0,0,1,241.43,346Z" style="fill: rgb(224, 224, 224); transform-origin: 241.405px 319.695px;" id="elg7pr6l100i7" class="animable"></path>
                      <path d="M340.16,345.26l-1-2a13.06,13.06,0,0,0-17.62-5.49l-4.68,2.45a13.08,13.08,0,0,0-5.49,17.63l1,1.95-3.26,1.72,11.75,22.38,34.31-18-11.75-22.39ZM333,362.38l2.05,3.91-2.48,1.31-2.05-3.91a2.72,2.72,0,0,1-2.29-1.43,2.77,2.77,0,1,1,4.9-2.57A2.69,2.69,0,0,1,333,362.38ZM335,348l-17.49,9.18-1-2a7.25,7.25,0,0,1,3.05-9.77l4.67-2.45a7.25,7.25,0,0,1,9.77,3Z" style="fill: rgb(240, 240, 240); transform-origin: 332.14px 360.089px;" id="eltzn9relvdbh" class="animable"></path>
                      <path d="M100.31,226.35l.73-2.08A13.08,13.08,0,0,0,93,207.65l-5-1.73A13.07,13.07,0,0,0,71.39,214l-.73,2.09-3.47-1.21-8.3,23.89L95.5,251.45l8.29-23.89Zm-17.38,6.51L81.48,237l-2.65-.92,1.45-4.17a2.71,2.71,0,0,1-.53-2.64A2.77,2.77,0,1,1,85,231.1,2.73,2.73,0,0,1,82.93,232.86Zm11.89-8.41L76.16,218l.72-2.09a7.25,7.25,0,0,1,9.21-4.46l5,1.73a7.24,7.24,0,0,1,4.46,9.21Z" style="fill: rgb(240, 240, 240); transform-origin: 81.34px 228.328px;" id="elmtb34rooob9" class="animable"></path>
                      <path d="M427.93,214.67l-2.14-.68A13.31,13.31,0,1,0,414,210.24l-2.13-.68a12.37,12.37,0,0,0-15.54,8l-2.14,6.74,39.64,12.59L436,230.2A12.36,12.36,0,0,0,427.93,214.67Z" style="fill: rgb(240, 240, 240); transform-origin: 415.484px 212.232px;" id="el2a9sc8c509l" class="animable"></path>
                      <path d="M284.19,93.9l-1.33.56a8.57,8.57,0,1,0-7.34,3.09l-1.33.56a8,8,0,0,0-4.26,10.42l1.76,4.2,24.69-10.38-1.77-4.19A8,8,0,0,0,284.19,93.9Z" style="fill: rgb(240, 240, 240); transform-origin: 282.028px 96.5854px;" id="el7p4n6vmd5pt" class="animable"></path>
                      <path d="M105.5,122l-1.41-.29a8.59,8.59,0,1,0-7.8-1.63l-1.41-.29A8,8,0,0,0,85.46,126l-.93,4.45,26.21,5.46.93-4.45A8,8,0,0,0,105.5,122Z" style="fill: rgb(240, 240, 240); transform-origin: 98.1844px 120.383px;" id="ele1n45ydjqbi" class="animable"></path>
                    </g>
                    <g id="freepik--Shadow--inject-3" class="animable" style="transform-origin: 250px 416.24px;">
                      <ellipse id="freepik--path--inject-3" cx="250" cy="416.24" rx="193.89" ry="11.32" style="fill: rgb(245, 245, 245); transform-origin: 250px 416.24px;" class="animable"></ellipse>
                    </g>
                    <g id="freepik--Tab--inject-3" class="animable" style="transform-origin: 279.725px 250.575px;">
                      <rect x="182.95" y="133.42" width="193.55" height="234.31" rx="7.32" style="fill: #579EE0; transform-origin: 279.725px 250.575px;" id="el4pj2hw913rh" class="animable"></rect>
                      <g id="elkffsz6zeixc">
                        <rect x="182.95" y="133.42" width="193.55" height="234.31" rx="7.32" style="fill: rgb(255, 255, 255); isolation: isolate; opacity: 0.6; transform-origin: 279.725px 250.575px;" class="animable" id="elqqrix7xw2d"></rect>
                      </g>
                      <foreignobject width="100%" height="100%">
                        <body>
                            <div id="input-list">
                                <div id="profile-picture">
                                    <div></div>
                                </div>
                                <p><i>Change password for:</i><br><u>${email}</u></p>
                                <div>
                                    <label class="input-label" for="new-password">Enter new password</label>
                                    <input id="new-password" type="password" name="new-password" class="password-input">
                                    <label id="new-password-error" class="error" for="new-password">${requestScope['new-password-error']}</label>
                                </div>
                                <div>
                                    <label class="input-label" for="confirm-password">Confirm new password</label>
                                    <input id="confirm-password" type="password" name="confirm-password" class="password-input">
                                    <label id="confirm-password-error" class="error" for="confirm-password">${requestScope['confirm-password-error']}</label>
                                </div>
                                <div style="position: relative; width: 100%;">
                                    <input id="submit-btn" type="submit" value="Change password" class="password-input">
                                    <div class="shadow"></div>
                                </div>
                            </div>
                        </body>     
                      </foreignobject>
                    </g>
                    <g id="freepik--Plant--inject-3" class="animable" style="transform-origin: 404.006px 369.879px;">
                      <path d="M398.56,376.19s-6.18.82-8.82,0-1.65-12.8-4.34-13.05c-6.21-.57-5.15,15.34-2.51,18.69s16.23,1.93,16.23,1.93Z" style="fill: #579EE0; transform-origin: 389.962px 373.592px;" id="elljpjyxb403q" class="animable"></path>
                      <g id="elfm5o3eizijk">
                        <path d="M398.56,376.19s-6.18.82-8.82,0-1.65-12.8-4.34-13.05c-6.21-.57-5.15,15.34-2.51,18.69s16.23,1.93,16.23,1.93Z" style="fill: rgb(255, 255, 255); isolation: isolate; opacity: 0.2; transform-origin: 389.962px 373.592px;" class="animable" id="elb3mty97wua"></path>
                      </g>
                      <path d="M399.07,404.4s-9.15-81.24,1.77-82.17,13.56,27.71,9.34,81.14Z" style="fill: #579EE0; transform-origin: 403.784px 363.304px;" id="elxkepzgbck0s" class="animable"></path>
                      <g id="elofj1o0f0qm">
                        <path d="M399.07,404.4s-9.15-81.24,1.77-82.17,13.56,27.71,9.34,81.14Z" style="fill: rgb(255, 255, 255); isolation: isolate; opacity: 0.3; transform-origin: 403.784px 363.304px;" class="animable" id="elzwyw6yw7lgg"></path>
                      </g>
                      <polygon points="386.24 394.57 422.17 394.57 419.17 417.55 389.24 417.55 386.24 394.57" style="fill: rgb(38, 50, 56); transform-origin: 404.205px 406.06px;" id="elu8tww2h5s6a" class="animable"></polygon>
                      <path d="M409.92,348.86s10,.53,10.25,0,.3-12,4.52-11.35,2.37,14.52,0,16.13-14.77,2.48-14.77,2.48S408.26,351,409.92,348.86Z" style="fill: #579EE0; transform-origin: 418.195px 346.802px;" id="ely0azidrmmwt" class="animable"></path>
                      <g id="eltpcgooxjch8">
                        <path d="M409.92,348.86s10,.53,10.25,0,.3-12,4.52-11.35,2.37,14.52,0,16.13-14.77,2.48-14.77,2.48S408.26,351,409.92,348.86Z" style="fill: rgb(255, 255, 255); isolation: isolate; opacity: 0.4; transform-origin: 418.195px 346.802px;" class="animable" id="elm63uum3ror"></path>
                      </g>
                      <path d="M403.61,397c-2.21-21.67-4.61-43.45-4.06-65.26.16-1.67.27-9.85,3.05-8.6a2.66,2.66,0,0,1,.79,1.12,35.1,35.1,0,0,1,1.6,8.11c2.1,21.72,1.94,43.58,1.83,65.37-.41-21.77-.44-43.61-2.57-65.28-.28-2.65-1.88-14.28-3.51-5.29a95.13,95.13,0,0,0-.59,13.92c.37,18.67,1.88,37.3,3.46,55.91Z" style="fill: #579EE0; transform-origin: 403.173px 360.375px;" id="elqitv0wn5p4" class="animable"></path>
                      <path d="M411.17,351.59c2.92-.28,8.12-.46,10.62-1.11,0-3.43,1.21-8.09,2.44-11.74-.35,1.63-.69,4-1,5.71a41.88,41.88,0,0,0-.72,6.24c-.16.49-.77.58-1.16.68a45.27,45.27,0,0,1-10.21.22Z" style="fill: #579EE0; transform-origin: 417.685px 345.26px;" id="elhatptfwamrf" class="animable"></path>
                      <path d="M411.17,354.24c4.17-.77,8.82-1.07,12.91-2.05,1.06-1.68,1-4.05,1.3-6,.24-2.18.42-4.37.63-6.56a63.37,63.37,0,0,1,0,6.61,21.86,21.86,0,0,1-.9,5.8,1.6,1.6,0,0,1-.67.86,71.63,71.63,0,0,1-13.24,1.34Z" style="fill: #579EE0; transform-origin: 418.633px 346.935px;" id="elgz4j1rw0ibe" class="animable"></path>
                      <path d="M395.48,378.41c-2.88.06-5.86.2-8.65-.76a3.65,3.65,0,0,1-1.22-2.36,28.69,28.69,0,0,1-.54-5.52,48.24,48.24,0,0,1,.19-5.51c.14,1.83.25,3.66.41,5.48a43.23,43.23,0,0,0,.7,5.38c.21.82.41,1.85,1.08,2a48.91,48.91,0,0,0,8,1.31Z" style="fill: #579EE0; transform-origin: 390.269px 371.357px;" id="el1k13cn7xivq" class="animable"></path>
                      <path d="M383.42,365.71l.65,6.39c.4,2.79.33,5.83,1.44,8.41a2.45,2.45,0,0,0,.57.32c3,1,6.27,1.07,9.4,1.44a44.71,44.71,0,0,1-6.44-.13c-1.48-.25-4-.2-4.51-2-1.24-4.71-1.17-9.64-1.11-14.47Z" style="fill: #579EE0; transform-origin: 389.437px 374px;" id="elkuaeis9ld1a" class="animable"></path>
                    </g>
                    <g id="freepik--Icon--inject-3" class="animable" style="transform-origin: 381.442px 151.312px;">
                      <path d="M361,139.57a23.65,23.65,0,0,1,32.25-8.76l-1,1.69,6.7-1.82-1.82-6.7-1,1.68a29.56,29.56,0,0,0-36.92,45.14l4.46-3.91A23.62,23.62,0,0,1,361,139.57Z" style="fill: rgb(38, 50, 56); transform-origin: 375.411px 146.273px;" id="eloqonz7fdj9" class="animable"></path>
                      <path d="M404,132.19,399.5,136a23.63,23.63,0,0,1-29.77,35.79l1-1.69L364,172l1.82,6.7,1-1.69A29.57,29.57,0,0,0,404,132.19Z" style="fill: rgb(38, 50, 56); transform-origin: 387.506px 156.534px;" id="eloskn7iuuz7q" class="animable"></path>
                      <g id="el31k1clg942t">
                        <g style="isolation: isolate; opacity: 0.6; transform-origin: 381.442px 151.312px;" class="animable" id="elopob82li5h">
                          <path d="M361,139.57a23.65,23.65,0,0,1,32.25-8.76l-1,1.69,6.7-1.82-1.82-6.7-1,1.68a29.56,29.56,0,0,0-36.92,45.14l4.46-3.91A23.62,23.62,0,0,1,361,139.57Z" style="fill: rgb(255, 255, 255); transform-origin: 375.411px 146.273px;" id="elzhkyjqkz059" class="animable"></path>
                          <path d="M404,132.19,399.5,136a23.63,23.63,0,0,1-29.77,35.79l1-1.69L364,172l1.82,6.7,1-1.69A29.57,29.57,0,0,0,404,132.19Z" style="fill: rgb(255, 255, 255); transform-origin: 387.506px 156.534px;" id="eluyk00pcy7" class="animable"></path>
                        </g>
                      </g>
                    </g>
                    <g id="freepik--Padlock--inject-3" class="animable" style="transform-origin: 356.83px 118.815px;">
                      <path d="M377.22,123.29H370.7v-20a13.87,13.87,0,0,0-27.74,0v20h-6.52v-20a20.39,20.39,0,0,1,40.78,0Z" style="fill: rgb(38, 50, 56); transform-origin: 356.83px 103.095px;" id="elkrg4wn6wgas" class="animable"></path>
                      <g id="el1j7d5c9ifgn">
                        <g style="opacity: 0.3; transform-origin: 356.83px 103.095px;" class="animable" id="el0dekmrf7vtn">
                          <path d="M377.22,123.29H370.7v-20a13.87,13.87,0,0,0-27.74,0v20h-6.52v-20a20.39,20.39,0,0,1,40.78,0Z" style="fill: rgb(255, 255, 255); transform-origin: 356.83px 103.095px;" id="elcc8ciafpj7c" class="animable"></path>
                        </g>
                      </g>
                      <path d="M384.69,118.2v32.73a3.8,3.8,0,0,1-3.8,3.8H332.75a3.79,3.79,0,0,1-3.78-3.8V118.2a3.79,3.79,0,0,1,3.78-3.8h48.14a3.65,3.65,0,0,1,1.8.46A3.77,3.77,0,0,1,384.69,118.2Z" style="fill: #579EE0; transform-origin: 356.83px 134.565px;" id="elymvycepi6k" class="animable"></path>
                      <g id="elkgrlzofk4q">
                        <path d="M382.69,114.86v32.07a3.79,3.79,0,0,1-3.8,3.79H330.75a3.7,3.7,0,0,1-1.78-.45V118.2a3.79,3.79,0,0,1,3.78-3.8h48.14A3.65,3.65,0,0,1,382.69,114.86Z" style="fill: rgb(255, 255, 255); isolation: isolate; opacity: 0.2; transform-origin: 355.83px 132.56px;" class="animable" id="el9jppeintf6f"></path>
                      </g>
                      <g id="elfd1qtcj6gtb">
                        <path d="M364,130.46a7.17,7.17,0,1,0-9.67,6.82L354,146h5.73l-.85-8.55A7.27,7.27,0,0,0,364,130.46Z" style="opacity: 0.5; transform-origin: 356.83px 134.695px;" class="animable" id="el2oigc81489t"></path>
                      </g>
                    </g>
                    <g id="freepik--speech-bubble--inject-3" class="animable" style="transform-origin: 130.685px 132.16px;">
                      <polygon points="127.37 139.57 130.69 150.24 134 139.57 127.37 139.57" style="fill: #579EE0; transform-origin: 130.685px 144.905px;" id="el14zvpthd51l" class="animable"></polygon>
                      <rect x="94.95" y="114.08" width="71.47" height="28.75" rx="8.59" style="fill: #579EE0; transform-origin: 130.685px 128.455px;" id="el8uucqf38ph" class="animable"></rect>
                      <path d="M111.75,128.44l1.88,1.06-.49.86-1.91-1.12,0,2.15h-1v-2.15l-1.91,1.12-.49-.86,1.9-1.06-1.9-1,.49-.88,1.91,1.12V125.5h1l0,2.13,1.91-1.12.49.88Z" style="fill: rgb(255, 255, 255); transform-origin: 110.73px 128.445px;" id="eliv87zh8um4" class="animable"></path>
                      <path d="M118.39,128.44l1.88,1.06-.49.86-1.91-1.12v2.15h-.94v-2.15L115,130.36l-.49-.86,1.9-1.06-1.9-1,.49-.88,1.91,1.12V125.5h.94v2.13l1.91-1.12.49.88Z" style="fill: rgb(255, 255, 255); transform-origin: 117.39px 128.445px;" id="elqixngiis71c" class="animable"></path>
                      <path d="M125,128.44l1.88,1.06-.49.86-1.91-1.12v2.15h-1l0-2.15-1.91,1.12-.49-.86,1.89-1.06-1.89-1,.49-.88,1.91,1.12,0-2.13h1v2.13l1.91-1.12.49.88Z" style="fill: rgb(255, 255, 255); transform-origin: 123.98px 128.47px;" id="elyy39jdvcjh" class="animable"></path>
                      <path d="M131.67,128.44l1.88,1.06-.49.86-1.91-1.12v2.15h-.95l0-2.15-1.91,1.12-.49-.86,1.89-1.06-1.89-1,.49-.88,1.91,1.12,0-2.13h.95v2.13l1.91-1.12.49.88Z" style="fill: rgb(255, 255, 255); transform-origin: 130.675px 128.47px;" id="elzmtevhs64" class="animable"></path>
                      <path d="M138.31,128.44l1.88,1.06-.49.86-1.92-1.12,0,2.15h-1l0-2.15L135,130.36l-.5-.86,1.9-1.06-1.9-1,.5-.88,1.91,1.12,0-2.13h1l0,2.13,1.92-1.12.49.88Z" style="fill: rgb(255, 255, 255); transform-origin: 137.41px 128.47px;" id="el85axdklktky" class="animable"></path>
                      <path d="M144.94,128.44l1.89,1.06-.49.86-1.92-1.12,0,2.15h-.95l0-2.15-1.92,1.12-.49-.86,1.9-1.06-1.9-1,.49-.88,1.92,1.12,0-2.13h.95l0,2.13,1.92-1.12.49.88Z" style="fill: rgb(255, 255, 255); transform-origin: 143.945px 128.47px;" id="elzty4eczr6i" class="animable"></path>
                      <path d="M151.58,128.44l1.88,1.06-.49.86-1.91-1.12,0,2.15h-1v-2.15l-1.91,1.12-.49-.86,1.9-1.06-1.9-1,.49-.88,1.91,1.12V125.5h1l0,2.13,1.91-1.12.49.88Z" style="fill: rgb(255, 255, 255); transform-origin: 150.56px 128.445px;" id="elofx3ab798kb" class="animable"></path>
                    </g>
                    <g id="freepik--Character--inject-3" class="animable" style="transform-origin: 142.853px 287.932px;">
                      <path d="M174.07,214.07l6.1-3.95-6.87-4.22s-5.23,3.85-3.13,6.46Z" style="fill: rgb(181, 91, 82); transform-origin: 174.921px 209.985px;" id="el80ohusdy8ph" class="animable"></path>
                      <polygon points="183.3 203.63 176.16 202.01 173.3 205.9 180.17 210.12 183.3 203.63" style="fill: rgb(181, 91, 82); transform-origin: 178.3px 206.065px;" id="elsm0pomhmgaf" class="animable"></polygon>
                      <path d="M149,201.25c3.86,5.84,7.73,12.94,13,17.49.1.08.06,0-.33,0-.2.05-.1.15.31,0a10.69,10.69,0,0,0,3.11-2.68,51.65,51.65,0,0,0,5.2-7.59c.07-.11,0,0,0,.12a2,2,0,0,0,0,.55c.09.09-.23-.17.39,1.2a2.66,2.66,0,0,0,2.73,1.13,2.44,2.44,0,0,0,1.59-1.15s0,0,0,0a4.3,4.3,0,0,0-.42.59L170.1,209a4,4,0,0,1,.76-1.75,2.66,2.66,0,0,1,1.37-.82,2.69,2.69,0,0,1,2.75,1.14c.62,1.38.31,1.12.4,1.22a3.69,3.69,0,0,1-.09.95c-1.57,6.67-5.67,17.66-14.17,17.72-6-.55-10.55-7.14-13.92-11.3a103.24,103.24,0,0,1-6.6-10l8.35-4.9Z" style="fill: rgb(181, 91, 82); transform-origin: 157.991px 214.355px;" id="elzs8kgoo14f" class="animable"></path>
                      <path d="M145.92,196.86c4,1.32,12.11,19.75,12.11,19.75l-13.78,6.54S141.45,208.67,142,204A11,11,0,0,1,145.92,196.86Z" style="fill: #579EE0; transform-origin: 149.979px 210.005px;" id="el8910sc1tkdm" class="animable"></path>
                      <g id="elelcemzmf4a9">
                        <path d="M145.92,196.86c4,1.32,12.11,19.75,12.11,19.75l-13.78,6.54S141.45,208.67,142,204A11,11,0,0,1,145.92,196.86Z" style="fill: rgb(255, 255, 255); opacity: 0.7; transform-origin: 149.979px 210.005px;" class="animable" id="elmivh9l6mij"></path>
                      </g>
                      <polygon points="162.12 410.53 155.1 412.52 153.43 401.59 152.53 395.75 159.55 393.76 160.75 401.59 162.12 410.53" style="fill: rgb(181, 91, 82); transform-origin: 157.325px 403.14px;" id="elja7j4012pzq" class="animable"></polygon>
                      <polygon points="121.76 411.1 114.52 412.06 114.45 401.59 114.4 395.08 121.65 394.14 121.7 401.59 121.76 411.1" style="fill: rgb(181, 91, 82); transform-origin: 118.08px 403.1px;" id="elhnyr4givbkd" class="animable"></polygon>
                      <g id="elump3h91hszf">
                        <polygon points="121.65 394.14 121.7 401.59 114.45 401.59 114.4 395.08 121.65 394.14" style="opacity: 0.2; transform-origin: 118.05px 397.865px;" class="animable" id="elfxk6ji3t4o6"></polygon>
                      </g>
                      <g id="elyw517gv2cxl">
                        <polygon points="160.75 401.59 153.43 401.59 152.53 395.75 159.55 393.76 160.75 401.59" style="opacity: 0.2; transform-origin: 156.64px 397.675px;" class="animable" id="el8keu77rumq5"></polygon>
                      </g>
                      <path d="M162,409.43l-8-.21a.64.64,0,0,0-.64.48l-1.67,6.42a1,1,0,0,0,1,1.32c2.88,0,7,0,10.65.07,4.23.12,6.92-.09,11.88,0,3,.08,3.93-2.91,2.69-3.22-5.67-1.4-9.37-1.12-14.2-4.28A3.34,3.34,0,0,0,162,409.43Z" style="fill: rgb(38, 50, 56); transform-origin: 165.04px 413.384px;" id="elo7qurlhf71g" class="animable"></path>
                      <path d="M162.61,410.32a.17.17,0,0,1,.09-.18c.34-.16,3.33-1.57,4.2-1.05a.54.54,0,0,1,.27.47,1,1,0,0,1-.36.83c-.82.68-2.9.34-4.07.07h0A.16.16,0,0,1,162.61,410.32Zm.71-.08c1.61.31,2.81.27,3.27-.12a.6.6,0,0,0,.23-.54.2.2,0,0,0-.1-.19l-.06,0C166.11,409.16,164.5,409.72,163.32,410.24Z" style="fill: #579EE0; transform-origin: 164.89px 409.882px;" id="el3evzhm1p429" class="animable"></path>
                      <path d="M162.67,410.43a.14.14,0,0,1-.06-.15,4.87,4.87,0,0,1,1.23-2.77,1.24,1.24,0,0,1,1-.27c.47.06.6.3.63.5.1.82-1.7,2.35-2.6,2.72a.24.24,0,0,1-.12,0Zm2.09-2.85a.93.93,0,0,0-.71.2,4,4,0,0,0-1,2.21c.92-.51,2.15-1.71,2.08-2.21,0,0,0-.11-.15-.16Z" style="fill: #579EE0; transform-origin: 164.04px 408.845px;" id="elykugh7jgwls" class="animable"></path>
                      <path d="M121.47,409.43l-8-.21a.64.64,0,0,0-.64.48l-1.68,6.42a1.05,1.05,0,0,0,1,1.32c2.87,0,7,0,10.65.07,4.23.12,6.91-.09,11.87,0,3,.08,3.94-2.91,2.69-3.22-5.66-1.4-9.37-1.12-14.19-4.28A3.37,3.37,0,0,0,121.47,409.43Z" style="fill: rgb(38, 50, 56); transform-origin: 124.506px 413.384px;" id="eldvbndxtttx" class="animable"></path>
                      <path d="M122,410.32a.17.17,0,0,1,.1-.18c.34-.16,3.32-1.57,4.19-1.05a.54.54,0,0,1,.27.47,1,1,0,0,1-.35.83c-.83.68-2.91.34-4.08.07h0A.18.18,0,0,1,122,410.32Zm.72-.08c1.6.31,2.81.27,3.27-.12a.62.62,0,0,0,.23-.54.22.22,0,0,0-.11-.19l-.06,0C125.55,409.16,123.94,409.72,122.76,410.24Z" style="fill: #579EE0; transform-origin: 124.28px 409.882px;" id="elw8t0gzti6d8" class="animable"></path>
                      <path d="M122.11,410.43a.15.15,0,0,1-.07-.15,4.9,4.9,0,0,1,1.24-2.77,1.23,1.23,0,0,1,1-.27c.47.06.6.3.62.5.11.82-1.7,2.35-2.59,2.72a.29.29,0,0,1-.13,0Zm2.09-2.85a.92.92,0,0,0-.71.2,4.08,4.08,0,0,0-1,2.21c.92-.51,2.15-1.71,2.09-2.21a.21.21,0,0,0-.16-.16A.61.61,0,0,0,124.2,407.58Z" style="fill: #579EE0; transform-origin: 123.472px 408.845px;" id="eljbubqs7pguc" class="animable"></path>
                      <path d="M106.83,252c-3.84,16.62,2.74,147.39,2.74,147.39h12.72l5.44-109,20,109,13.6-1c-8.89-84.42-16.74-134.82-16.74-134.82v-6.37Z" style="fill: rgb(38, 50, 56); transform-origin: 133.478px 325.695px;" id="el8efec2wktc" class="animable"></path>
                      <g id="el6ffqmfbek2r">
                        <path d="M161.35,398.37l-13.6,1L132,313.57l-4.26-23.19-5.44,109H109.58S103,268.59,106.83,252l37.8,5.21,0,6.37S152.46,314,161.35,398.37Z" style="fill: rgb(255, 255, 255); opacity: 0.2; transform-origin: 133.491px 325.69px;" class="animable" id="el7z5vn9j49xw"></path>
                      </g>
                      <path d="M106,195.79a160.19,160.19,0,0,1,2.23,23.74c.13,5.55,0,10.83-.19,15.61-.5,11.21-1.58,19.69-1.53,22.6l38.16.68c9.1-39.9,1.28-61.56,1.28-61.56a75.92,75.92,0,0,0-9-1.92q-1-.13-2-.24a141.37,141.37,0,0,0-16.22-.3c-1,0-2.07.09-3.08.17C110.55,195,106,195.79,106,195.79Z" style="fill: #579EE0; transform-origin: 127.538px 226.356px;" id="elcduo6bhm09o" class="animable"></path>
                      <path d="M136.19,196s-2.27,3.29-4.09,3.52c-2.58.35-12-5.42-12-5.42,2.18-1.61,3.25-5.12,3.72-8.83a50.34,50.34,0,0,0,.19-9.07l8.81,9.58c-1.16,3-1.85,6.2.43,8.45h0A7.88,7.88,0,0,0,136.19,196Z" style="fill: rgb(181, 91, 82); transform-origin: 128.145px 187.868px;" id="elk49cgsvdjom" class="animable"></path>
                      <g id="el5r5p7j2om6i">
                        <path d="M133.23,194.2a25.11,25.11,0,0,1-9.43-9,50.34,50.34,0,0,0,.19-9.07l8.81,9.58C131.64,188.74,131,192,133.23,194.2Z" style="opacity: 0.2; transform-origin: 128.515px 185.165px;" class="animable" id="el2os6adeld6k"></path>
                      </g>
                      <path d="M143,167.56c.75,2.77,0,8.39-3.72,6.39S141.75,162.78,143,167.56Z" style="fill: rgb(38, 50, 56); transform-origin: 140.683px 170.284px;" id="eluyg4x0xsgjn" class="animable"></path>
                      <path d="M123.12,170.41c-.73,7-1.51,11.1,1.42,15.23,4.42,6.2,13.57,4.35,16.38-2.34,2.54-6,3.3-16.5-3.07-20.34A9.75,9.75,0,0,0,123.12,170.41Z" style="fill: rgb(181, 91, 82); transform-origin: 132.615px 175.498px;" id="elt6mqs8u01t" class="animable"></path>
                      <path d="M128.22,166.79l.35-7.87s-8.36-1-8.17,3.32c-4.74,2.1-2.86,9.41,3.22,13.22,3.54-2.58,3.43-9.19,3.43-9.19C127.41,166.45,127.81,166.62,128.22,166.79Z" style="fill: rgb(38, 50, 56); transform-origin: 123.15px 167.14px;" id="elq0w5m7e0249" class="animable"></path>
                      <path d="M119.47,175.76a6.63,6.63,0,0,0,2.64,4.38c1.9,1.38,3.69-.14,3.85-2.36.15-2-.66-5.13-2.9-5.63A3.06,3.06,0,0,0,119.47,175.76Z" style="fill: rgb(181, 91, 82); transform-origin: 122.693px 176.38px;" id="elfyjl8eutscn" class="animable"></path>
                      <path d="M133.39,174c-.1.57.13,1.07.5,1.13s.75-.35.84-.92-.13-1.07-.5-1.13S133.48,173.43,133.39,174Z" style="fill: rgb(38, 50, 56); transform-origin: 134.058px 174.105px;" id="elnqiqyauvy2" class="animable"></path>
                      <path d="M139.81,175c-.09.57.14,1.08.51,1.13s.75-.35.84-.92-.13-1.07-.5-1.13S139.91,174.44,139.81,175Z" style="fill: rgb(38, 50, 56); transform-origin: 140.485px 175.104px;" id="elwj1nlm0axrn" class="animable"></path>
                      <path d="M137.72,175a20,20,0,0,0,2,5.1,3.42,3.42,0,0,1-2.78,0Z" style="fill: rgb(160, 39, 36); transform-origin: 138.33px 177.698px;" id="elhls4gefowoj" class="animable"></path>
                      <path d="M133.53,181.8a4.89,4.89,0,0,0,.73.17.17.17,0,0,0,.19-.14.17.17,0,0,0-.14-.2,4.54,4.54,0,0,1-3.38-2.32.16.16,0,0,0-.22-.09.17.17,0,0,0-.09.22A4.71,4.71,0,0,0,133.53,181.8Z" style="fill: rgb(38, 50, 56); transform-origin: 132.53px 180.588px;" id="elkvvo97fb79" class="animable"></path>
                      <path d="M131.75,171.62a.32.32,0,0,0,.33-.08,2.76,2.76,0,0,1,2.33-.78.33.33,0,1,0,.15-.65,3.34,3.34,0,0,0-2.94.95.34.34,0,0,0,0,.48A.37.37,0,0,0,131.75,171.62Z" style="fill: rgb(38, 50, 56); transform-origin: 133.17px 170.85px;" id="ellhidr1ewnap" class="animable"></path>
                      <path d="M143,173.23a.31.31,0,0,0,.19,0,.34.34,0,0,0,.23-.42,3.31,3.31,0,0,0-2.09-2.25.35.35,0,0,0-.42.23.34.34,0,0,0,.23.42,2.55,2.55,0,0,1,1.63,1.8A.34.34,0,0,0,143,173.23Z" style="fill: rgb(38, 50, 56); transform-origin: 142.165px 171.897px;" id="elz2870x0g9m" class="animable"></path>
                      <path d="M120.4,162.24s-4.32-4.29,10.34-3.9,17.1,8.61,10.38,10.52l-.3-1.34a9.12,9.12,0,0,1-7.52.38l1.06-.66S124.35,168.26,120.4,162.24Z" style="fill: rgb(38, 50, 56); transform-origin: 132.242px 163.587px;" id="el53d8vzlnsre" class="animable"></path>
                      <path d="M132.1,199.49s-1.87,2.16-4,4.29c-3.11-1.57-10.39-5.78-10-9.67.43-1.13,3.39-1.85,3.39-1.85S124.63,196.45,132.1,199.49Z" style="fill: #579EE0; transform-origin: 125.092px 198.02px;" id="elaez9u4qm21" class="animable"></path>
                      <path d="M132.1,199.49a20.73,20.73,0,0,1,4,4.29c2.29-1.48,1.14-8.72.3-9.52a8.17,8.17,0,0,0-3.95-1A6.68,6.68,0,0,1,132.1,199.49Z" style="fill: #579EE0; transform-origin: 134.772px 198.52px;" id="elmax48lmmedg" class="animable"></path>
                      <g id="el9kl101qerlb">
                        <g style="opacity: 0.5; transform-origin: 127.765px 198.02px;" class="animable" id="elyqp7k1842ok">
                          <path d="M132.1,199.49s-1.87,2.16-4,4.29c-3.11-1.57-10.39-5.78-10-9.67.43-1.13,3.39-1.85,3.39-1.85S124.63,196.45,132.1,199.49Z" style="fill: rgb(255, 255, 255); transform-origin: 125.092px 198.02px;" id="elle10tofq2vj" class="animable"></path>
                          <path d="M132.1,199.49a20.73,20.73,0,0,1,4,4.29c2.29-1.48,1.14-8.72.3-9.52a8.17,8.17,0,0,0-3.95-1A6.68,6.68,0,0,1,132.1,199.49Z" style="fill: rgb(255, 255, 255); transform-origin: 134.772px 198.52px;" id="el7w06psqunje" class="animable"></path>
                        </g>
                      </g>
                      <g id="el9oajvzrgxkf">
                        <path d="M132,313.57l-4.26-23.19.82-12.27S134.39,299.39,132,313.57Z" style="opacity: 0.2; transform-origin: 130.158px 295.84px;" class="animable" id="el2wejljbae74"></path>
                      </g>
                      <path d="M110,206.38c-3.7,6.17-9.43,15-12.57,21.27-1.67,3.55-2.19,7.35-3.1,11.18-.87,4.09-1.74,8.26-2.7,12.38l-4.78-.42c-.17-4.33-.13-8.62.13-12.95.33-4.51.57-9.38,2.27-13.66,3.38-8.23,7.83-15.59,12.6-23l8.15,5.22Z" style="fill: rgb(181, 91, 82); transform-origin: 98.3737px 226.195px;" id="elbktd3vhkvpf" class="animable"></path>
                      <path d="M106,195.79c-5.37,1.39-15,20.69-15,20.69l11.41,7.39,10.29-10a24.73,24.73,0,0,0-.65-10.85C110.38,197,106,195.79,106,195.79Z" style="fill: #579EE0; transform-origin: 102.011px 209.83px;" id="elbj4n24un85e" class="animable"></path>
                      <g id="el6h293z3mx6c">
                        <path d="M106,195.79c-5.37,1.39-15,20.69-15,20.69l11.41,7.39,10.29-10a24.73,24.73,0,0,0-.65-10.85C110.38,197,106,195.79,106,195.79Z" style="fill: rgb(255, 255, 255); opacity: 0.7; transform-origin: 102.011px 209.83px;" class="animable" id="el1hsclrtag2y"></path>
                      </g>
                      <g id="elzb4w5spo8">
                        <path d="M95.58,209.63H211.12a4.74,4.74,0,0,1,4.74,4.74V217a4.74,4.74,0,0,1-4.74,4.74H95.58a0,0,0,0,1,0,0V209.63A0,0,0,0,1,95.58,209.63Z" style="fill: rgb(38, 50, 56); transform-origin: 155.72px 215.685px; transform: rotate(-46.68deg);" class="animable" id="el0nq0aoffd0xb"></path>
                      </g>
                      <g id="el7pjp9ymah1">
                        <path d="M95.58,209.63H211.12a4.74,4.74,0,0,1,4.74,4.74V217a4.74,4.74,0,0,1-4.74,4.74H95.58a0,0,0,0,1,0,0V209.63A0,0,0,0,1,95.58,209.63Z" style="fill: rgb(255, 255, 255); isolation: isolate; opacity: 0.6; transform-origin: 155.72px 215.685px; transform: rotate(-46.68deg);" class="animable" id="ellltyhx5c38d"></path>
                      </g>
                      <g id="elr84xqq448q">
                        <path d="M196.6,171.59l1.33,1.25a4.73,4.73,0,0,1,.2,6.69L118.86,263.6l-1.32-1.25,79.27-84.07A4.73,4.73,0,0,0,196.6,171.59Z" style="opacity: 0.2; transform-origin: 158.479px 217.595px;" class="animable" id="elg1cmbe2ykf9"></path>
                      </g>
                      <polygon points="171.31 204.14 186 218 187.91 215.97 186.01 214.18 189.03 210.97 187.92 209.92 192.46 205.11 193.57 206.16 196.41 203.15 198.31 204.95 200.28 202.85 199.17 201.8 202.01 198.78 199.78 196.68 201.64 194.71 204.99 197.86 208.39 194.26 193.7 180.4 171.31 204.14" style="fill: rgb(38, 50, 56); transform-origin: 189.85px 199.2px;" id="elcakcg2i27h9" class="animable"></polygon>
                      <g id="el00gmsk2d1hlb8">
                        <polygon points="171.31 204.14 186 218 187.91 215.97 186.01 214.18 189.03 210.97 187.92 209.92 192.46 205.11 193.57 206.16 196.41 203.15 198.31 204.95 200.28 202.85 199.17 201.8 202.01 198.78 199.78 196.68 201.64 194.71 204.99 197.86 208.39 194.26 193.7 180.4 171.31 204.14" style="fill: rgb(255, 255, 255); isolation: isolate; opacity: 0.6; transform-origin: 189.85px 199.2px;" class="animable" id="eli5r9hykhiv"></polygon>
                      </g>
                      <g id="el8m20wfqwxlt">
                        <g style="opacity: 0.2; transform-origin: 196.537px 205.498px;" class="animable" id="elo880fddm3hh">
                          <g id="elnb472vnvn9q">
                            <rect x="184.91" y="215.45" width="2.78" height="1.82" style="isolation: isolate; opacity: 0.6; transform-origin: 186.3px 216.36px; transform: rotate(-46.68deg);" class="animable" id="el9ujgbq09nwv"></rect>
                          </g>
                          <g id="eld5m41sbruyi">
                            <polygon points="193.57 206.16 192.46 205.1 187.92 209.92 189.03 210.97 186.01 214.18 184.68 212.93 187.71 209.72 186.59 208.67 191.13 203.85 192.25 204.91 195.08 201.9 196.41 203.15 193.57 206.16" style="isolation: isolate; opacity: 0.6; transform-origin: 190.545px 208.04px;" class="animable" id="elk6pax6kvdy"></polygon>
                          </g>
                          <g id="el0f23t290hmas">
                            <polygon points="197.84 200.54 200.69 197.53 202.02 198.78 199.17 201.8 200.29 202.85 198.31 204.95 196.99 203.7 198.96 201.6 197.84 200.54" style="isolation: isolate; opacity: 0.6; transform-origin: 199.505px 201.24px;" class="animable" id="elx0kvep9f5xn"></polygon>
                          </g>
                          <g id="el5nn4yorc212">
                            <rect x="198.69" y="194.15" width="2.71" height="1.82" style="isolation: isolate; opacity: 0.6; transform-origin: 200.045px 195.06px; transform: rotate(-46.68deg);" class="animable" id="el1670yo86j6t"></rect>
                          </g>
                          <g id="elifj88m7efej">
                            <rect x="203.55" y="194.52" width="4.96" height="1.82" style="isolation: isolate; opacity: 0.6; transform-origin: 206.03px 195.43px; transform: rotate(-46.68deg);" class="animable" id="elali2zh2p8fn"></rect>
                          </g>
                        </g>
                      </g>
                      <g id="elvixz1dbf0vl">
                        <rect x="161.47" y="182.56" width="37.54" height="14.24" rx="1.06" style="fill: rgb(38, 50, 56); transform-origin: 180.24px 189.68px; transform: rotate(-46.68deg);" class="animable" id="elpf8rtxc4iz"></rect>
                      </g>
                      <path d="M119.32,290.77h0a20.47,20.47,0,0,1-28.94.85l-6.64-6.26a20.47,20.47,0,0,1-.85-28.94h0a20.48,20.48,0,0,1,29-.85l6.63,6.26A20.47,20.47,0,0,1,119.32,290.77Z" style="fill: rgb(38, 50, 56); transform-origin: 101.117px 273.582px;" id="elbi3qy41gi47" class="animable"></path>
                      <path d="M111.69,283.57h0a10.19,10.19,0,0,1-14.41.43L91,278a10.19,10.19,0,0,1-.42-14.41h0a10.17,10.17,0,0,1,14.4-.42l6.34,6A10.19,10.19,0,0,1,111.69,283.57Z" style="fill: rgb(255, 255, 255); transform-origin: 101.144px 273.581px;" id="el8f29wjp0fxe" class="animable"></path>
                      <g id="elhu17w8dvzh">
                        <rect x="161.47" y="182.56" width="37.54" height="14.24" rx="1.06" style="fill: rgb(255, 255, 255); isolation: isolate; opacity: 0.5; transform-origin: 180.24px 189.68px; transform: rotate(-46.68deg);" class="animable" id="elucraqwhtu28"></rect>
                      </g>
                      <g id="eldj310hu93a">
                        <g style="isolation: isolate; opacity: 0.5; transform-origin: 101.117px 273.582px;" class="animable" id="elm1wmh3psxgf">
                          <path d="M119.32,290.77h0a20.47,20.47,0,0,1-28.94.85l-6.64-6.26a20.47,20.47,0,0,1-.85-28.94h0a20.48,20.48,0,0,1,29-.85l6.63,6.26A20.47,20.47,0,0,1,119.32,290.77Z" style="fill: rgb(255, 255, 255); transform-origin: 101.117px 273.582px;" id="elbal9dwvlv59" class="animable"></path>
                          <path d="M111.69,283.57h0a10.19,10.19,0,0,1-14.41.43L91,278a10.19,10.19,0,0,1-.42-14.41h0a10.17,10.17,0,0,1,14.4-.42l6.34,6A10.19,10.19,0,0,1,111.69,283.57Z" style="fill: rgb(255, 255, 255); transform-origin: 101.144px 273.581px;" id="ellbu2p4idj4" class="animable"></path>
                        </g>
                      </g>
                      <g id="elqlnmq9hlmza">
                        <path d="M194.87,177.68l2.66,2.5a1.06,1.06,0,0,1,0,1.51l-24.3,25.76a1.05,1.05,0,0,1-1.5,0l-2.65-2.5a1.06,1.06,0,0,0,1.49,0l24.3-25.77A1.05,1.05,0,0,0,194.87,177.68Z" style="opacity: 0.2; transform-origin: 183.463px 192.723px;" class="animable" id="elcb3pcl7eher"></path>
                      </g>
                      <g id="ellb4yw83iof">
                        <g style="opacity: 0.2; transform-origin: 105.213px 277.741px;" class="animable" id="elwg37ccdaoa">
                          <path d="M103,261.32l2,1.87A10.2,10.2,0,0,0,91,278l-2-1.88a10.19,10.19,0,0,1,14-14.83Z" id="eldro5zubyof" class="animable" style="transform-origin: 95.4014px 268.254px;"></path>
                          <path d="M116.49,260l2,1.88a20.48,20.48,0,0,1-28.1,29.79l-2-1.87a20.48,20.48,0,0,0,28.1-29.8Z" id="el3zn55e7kf9i" class="animable" style="transform-origin: 106.507px 278.487px;"></path>
                        </g>
                      </g>
                      <g id="elnfohlovcg2">
                        <g style="opacity: 0.2; transform-origin: 95.4014px 268.254px;" class="animable" id="el36dtj1slluh">
                          <path d="M103,261.32l2,1.87A10.2,10.2,0,0,0,91,278l-2-1.88a10.19,10.19,0,0,1,14-14.83Z" id="elgdid2c7xfvf" class="animable" style="transform-origin: 95.4014px 268.254px;"></path>
                          <path d="M103,261.32l2,1.87A10.2,10.2,0,0,0,91,278l-2-1.88a10.19,10.19,0,0,1,14-14.83Z" id="el6x26mxp6235" class="animable" style="transform-origin: 95.4014px 268.254px;"></path>
                        </g>
                      </g>
                      <polygon points="87.78 262.21 95.13 260.37 94.31 255 85.35 256.81 87.78 262.21" style="fill: rgb(181, 91, 82); transform-origin: 90.24px 258.605px;" id="elesuf3xazd8" class="animable"></polygon>
                      <path d="M87.06,249.78l-1.71,7,9-1.81s.12-6.29-3.22-6.7Z" style="fill: rgb(181, 91, 82); transform-origin: 89.8503px 252.525px;" id="elmudv3k9wo9" class="animable"></path>
                    </g>
                    <defs>
                      <filter id="active" height="200%">
                        <feMorphology in="SourceAlpha" result="DILATED" operator="dilate" radius="2"></feMorphology>
                        <feFlood flood-color="#32DFEC" flood-opacity="1" result="PINK"></feFlood>
                        <feComposite in="PINK" in2="DILATED" operator="in" result="OUTLINE"></feComposite>
                        <feMerge>
                          <feMergeNode in="OUTLINE"></feMergeNode>
                          <feMergeNode in="SourceGraphic"></feMergeNode>
                        </feMerge>
                      </filter>
                      <filter id="hover" height="200%">
                        <feMorphology in="SourceAlpha" result="DILATED" operator="dilate" radius="2"></feMorphology>
                        <feFlood flood-color="#ff0000" flood-opacity="0.5" result="PINK"></feFlood>
                        <feComposite in="PINK" in2="DILATED" operator="in" result="OUTLINE"></feComposite>
                        <feMerge>
                          <feMergeNode in="OUTLINE"></feMergeNode>
                          <feMergeNode in="SourceGraphic"></feMergeNode>
                        </feMerge>
                        <feColorMatrix type="matrix" values="0   0   0   0   0                0   1   0   0   0                0   0   0   0   0                0   0   0   1   0 "></feColorMatrix>
                      </filter>
                    </defs>
                  </svg>
            </form>
        </div>
        <script>
            $(document).ready(() => {
                $('#password-form').validate({
                    rules: {
                        'new-password': {
                            required: true,
                        },
                        'confirm-password': {
                            required: true,
                            equalTo: '#new-password',
                        }
                    },
                    messages: {
                        'new-password': {
                            required: 'Please enter new password',
                        },
                        'confirm-password': {
                            required: 'Please confirm new password',
                            equalTo: 'New assword and confirm password does not match',
                        }
                    }
                })
            })
        </script>
    </body>
</html>