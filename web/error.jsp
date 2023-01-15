<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        svg#freepik_stories-dizzy-face:not(.animated) .animable {
            opacity: 0;
        }
        svg#freepik_stories-dizzy-face.animated #freepik--background-simple--inject-81 {
            animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) zoomIn,
                6s Infinite linear floating;
            animation-delay: 0s, 1s;
        }
        svg#freepik_stories-dizzy-face.animated #freepik--Spiral--inject-81 {
            animation: 24s Infinite linear spin;
            animation-delay: 0s;
        }
        svg#freepik_stories-dizzy-face.animated #freepik--Plant--inject-81 {
            animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) fadeIn;
            animation-delay: 0s;
        }
        svg#freepik_stories-dizzy-face.animated #freepik--Floor--inject-81 {
            animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideUp;
            animation-delay: 0s;
        }
        svg#freepik_stories-dizzy-face.animated #freepik--face-4--inject-81 {
            animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideUp,
                6s Infinite linear wind;
            animation-delay: 0s, 1s;
        }
        svg#freepik_stories-dizzy-face.animated #freepik--face-3--inject-81 {
            animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideLeft,
                1.5s Infinite linear wind;
            animation-delay: 0s, 1s;
        }
        svg#freepik_stories-dizzy-face.animated #freepik--face-2--inject-81 {
            animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideDown,
                3s Infinite linear wind;
            animation-delay: 0s, 1s;
        }
        svg#freepik_stories-dizzy-face.animated #freepik--face-1--inject-81 {
            animation: 1s 1 forwards cubic-bezier(0.36, -0.01, 0.5, 1.38) slideRight,
                1.5s Infinite linear wind;
            animation-delay: 0s, 1s;
        }
        svg#freepik_stories-dizzy-face.animated #freepik--Character--inject-81 {
            animation: 1s 1 forwards ease-out slideLeft, 18s Infinite linear shake;
            animation-delay: 0s, 1s;
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
        @keyframes floating {
            0% {
                opacity: 1;
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-10px);
            }
            100% {
                opacity: 1;
                transform: translateY(0px);
            }
        }
        @keyframes spin {
            from {
                transform: rotate(0);
            }
            to {
                transform: rotate(360deg);
            }
        }
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
        @keyframes slideUp {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }
            100% {
                opacity: 1;
                transform: inherit;
            }
        }
        @keyframes wind {
            0% {
                transform: rotate(0deg);
            }
            25% {
                transform: rotate(1deg);
            }
            75% {
                transform: rotate(-1deg);
            }
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
        @keyframes shake {
            10%,
            90% {
                transform: translate3d(-1px, 0, 0);
            }
            20%,
            80% {
                transform: translate3d(2px, 0, 0);
            }
            30%,
            50%,
            70% {
                transform: translate3d(-4px, 0, 0);
            }
            40%,
            60% {
                transform: translate3d(4px, 0, 0);
            }
        }

        html {
            font-family: 'Quicksand', sans-serif;;
        }

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            font-family: inherit;
        }

        .content {
            padding-top: 40px;
            display: flex;
            height: 100vh;
            flex-direction: column-reverse;
            justify-content: flex-end;
            align-items: center;
            color: #5a5a5a;
            position: relative;
        }

        svg {
            filter: drop-shadow(0 0 12px white);
            height: 50%;
        }

        .content > div {
            width: 600px;
            max-width: 100%;
            box-shadow: -10px 10px 65px -10px rgb(0 0 0 / 30%);
            margin-top: 50px;
            text-align: center;
            padding: 60px 40px;
            background-color: white
        }

        .content > div > p {
            margin-bottom: 16px;
            font-size: 1.2rem;
        }

        .content .title {
            font-weight: bold;
        }

        .content button {
            font-weight: bold;
            cursor: pointer;
            font-size: 1rem;
            padding: 8px 12px;
            border: 3px solid #595959;
            color: #595959;
            background-color: transparent;
            margin-top: 12px;
        }
        
        .content button:hover {
            border-color: black;
            color: black;
        }
    </style>
    <style>
        body {
            margin: 0;
            font-size: 20px;
        }

        * {
            box-sizing: border-box;
        }

        .container {
            position: relative;
            background: white;
            overflow: hidden;
        }

        .particle {
            position: absolute;
            display: block;
            pointer-events: none;
        }
        .particle:nth-child(1) {
            top: 49.8777506112%;
            left: 83.4970530452%;
            font-size: 18px;
            filter: blur(0.02px);
            animation: 25s floatReverse2 infinite;
        }
        .particle:nth-child(2) {
            top: 58.6080586081%;
            left: 15.7016683023%;
            font-size: 19px;
            filter: blur(0.04px);
            animation: 21s floatReverse2 infinite;
        }
        .particle:nth-child(3) {
            top: 5.8536585366%;
            left: 20.5882352941%;
            font-size: 20px;
            filter: blur(0.06px);
            animation: 40s floatReverse2 infinite;
        }
        .particle:nth-child(4) {
            top: 1.9393939394%;
            left: 28.2926829268%;
            font-size: 25px;
            filter: blur(0.08px);
            animation: 38s floatReverse2 infinite;
        }
        .particle:nth-child(5) {
            top: 86.6180048662%;
            left: 80.2348336595%;
            font-size: 22px;
            filter: blur(0.1px);
            animation: 35s float2 infinite;
        }
        .particle:nth-child(6) {
            top: 77.9537149817%;
            left: 37.2184133203%;
            font-size: 21px;
            filter: blur(0.12px);
            animation: 28s float infinite;
        }
        .particle:nth-child(7) {
            top: 42.9268292683%;
            left: 20.5882352941%;
            font-size: 20px;
            filter: blur(0.14px);
            animation: 36s floatReverse2 infinite;
        }
        .particle:nth-child(8) {
            top: 90.5109489051%;
            left: 37.1819960861%;
            font-size: 22px;
            filter: blur(0.16px);
            animation: 23s float2 infinite;
        }
        .particle:nth-child(9) {
            top: 37.8181818182%;
            left: 8.7804878049%;
            font-size: 25px;
            filter: blur(0.18px);
            animation: 24s floatReverse2 infinite;
        }
        .particle:nth-child(10) {
            top: 53.9215686275%;
            left: 26.5748031496%;
            font-size: 16px;
            filter: blur(0.2px);
            animation: 27s floatReverse infinite;
        }
        .particle:nth-child(11) {
            top: 75.9556103576%;
            left: 88.0316518299%;
            font-size: 11px;
            filter: blur(0.22px);
            animation: 26s float2 infinite;
        }
        .particle:nth-child(12) {
            top: 82.0265379976%;
            left: 35.9572400389%;
            font-size: 29px;
            filter: blur(0.24px);
            animation: 30s floatReverse infinite;
        }
        .particle:nth-child(13) {
            top: 40.2948402948%;
            left: 87.7712031558%;
            font-size: 14px;
            filter: blur(0.26px);
            animation: 29s floatReverse infinite;
        }
        .particle:nth-child(14) {
            top: 96.2332928311%;
            left: 14.6627565982%;
            font-size: 23px;
            filter: blur(0.28px);
            animation: 21s floatReverse infinite;
        }
        .particle:nth-child(15) {
            top: 32.15590743%;
            left: 26.444662096%;
            font-size: 21px;
            filter: blur(0.3px);
            animation: 38s floatReverse infinite;
        }
        .particle:nth-child(16) {
            top: 66.5060240964%;
            left: 56.3106796117%;
            font-size: 30px;
            filter: blur(0.32px);
            animation: 32s floatReverse2 infinite;
        }
        .particle:nth-child(17) {
            top: 65.5256723716%;
            left: 43.2220039293%;
            font-size: 18px;
            filter: blur(0.34px);
            animation: 36s floatReverse infinite;
        }
        .particle:nth-child(18) {
            top: 61.7647058824%;
            left: 16.7322834646%;
            font-size: 16px;
            filter: blur(0.36px);
            animation: 34s float infinite;
        }
        .particle:nth-child(19) {
            top: 21.5158924205%;
            left: 25.5402750491%;
            font-size: 18px;
            filter: blur(0.38px);
            animation: 39s float infinite;
        }
        .particle:nth-child(20) {
            top: 10.6537530266%;
            left: 80.8966861598%;
            font-size: 26px;
            filter: blur(0.4px);
            animation: 26s float2 infinite;
        }
        .particle:nth-child(21) {
            top: 61.0086100861%;
            left: 13.8203356367%;
            font-size: 13px;
            filter: blur(0.42px);
            animation: 24s floatReverse2 infinite;
        }
        .particle:nth-child(22) {
            top: 84.7290640394%;
            left: 51.3833992095%;
            font-size: 12px;
            filter: blur(0.44px);
            animation: 29s float2 infinite;
        }
        .particle:nth-child(23) {
            top: 36.4981504316%;
            left: 76.1622156281%;
            font-size: 11px;
            filter: blur(0.46px);
            animation: 33s floatReverse infinite;
        }
        .particle:nth-child(24) {
            top: 93.4809348093%;
            left: 6.9101678184%;
            font-size: 13px;
            filter: blur(0.48px);
            animation: 25s floatReverse2 infinite;
        }
        .particle:nth-child(25) {
            top: 33.8983050847%;
            left: 26.3157894737%;
            font-size: 26px;
            filter: blur(0.5px);
            animation: 22s floatReverse2 infinite;
        }
        .particle:nth-child(26) {
            top: 25.2121212121%;
            left: 65.3658536585%;
            font-size: 25px;
            filter: blur(0.52px);
            animation: 21s floatReverse2 infinite;
        }
        .particle:nth-child(27) {
            top: 38.5542168675%;
            left: 62.1359223301%;
            font-size: 30px;
            filter: blur(0.54px);
            animation: 33s float2 infinite;
        }
        .particle:nth-child(28) {
            top: 22.6322263223%;
            left: 40.473840079%;
            font-size: 13px;
            filter: blur(0.56px);
            animation: 23s float infinite;
        }
        .particle:nth-child(29) {
            top: 13.4939759036%;
            left: 83.4951456311%;
            font-size: 30px;
            filter: blur(0.58px);
            animation: 37s floatReverse2 infinite;
        }
        .particle:nth-child(30) {
            top: 16.5048543689%;
            left: 34.1796875%;
            font-size: 24px;
            filter: blur(0.6px);
            animation: 23s floatReverse2 infinite;
        }
        .particle:nth-child(31) {
            top: 48.9596083231%;
            left: 33.4316617502%;
            font-size: 17px;
            filter: blur(0.62px);
            animation: 37s floatReverse infinite;
        }
        .particle:nth-child(32) {
            top: 33.04981774%;
            left: 49.853372434%;
            font-size: 23px;
            filter: blur(0.64px);
            animation: 21s floatReverse infinite;
        }
        .particle:nth-child(33) {
            top: 22.4938875306%;
            left: 18.6640471513%;
            font-size: 18px;
            filter: blur(0.66px);
            animation: 30s floatReverse2 infinite;
        }
        .particle:nth-child(34) {
            top: 22.6044226044%;
            left: 59.1715976331%;
            font-size: 14px;
            filter: blur(0.68px);
            animation: 40s float infinite;
        }
        .particle:nth-child(35) {
            top: 60.024600246%;
            left: 77.9861796644%;
            font-size: 13px;
            filter: blur(0.7px);
            animation: 21s float2 infinite;
        }
        .particle:nth-child(36) {
            top: 40.146878825%;
            left: 74.7295968535%;
            font-size: 17px;
            filter: blur(0.72px);
            animation: 28s floatReverse infinite;
        }
        .particle:nth-child(37) {
            top: 92.9782082324%;
            left: 58.4795321637%;
            font-size: 26px;
            filter: blur(0.74px);
            animation: 34s floatReverse2 infinite;
        }
        .particle:nth-child(38) {
            top: 28.431372549%;
            left: 22.6377952756%;
            font-size: 16px;
            filter: blur(0.76px);
            animation: 29s floatReverse2 infinite;
        }
        .particle:nth-child(39) {
            top: 22.2760290557%;
            left: 38.9863547758%;
            font-size: 26px;
            filter: blur(0.78px);
            animation: 29s floatReverse infinite;
        }
        .particle:nth-child(40) {
            top: 39.7575757576%;
            left: 47.8048780488%;
            font-size: 25px;
            filter: blur(0.8px);
            animation: 29s floatReverse2 infinite;
        }
        .particle:nth-child(41) {
            top: 91.7073170732%;
            left: 45.0980392157%;
            font-size: 20px;
            filter: blur(0.82px);
            animation: 40s floatReverse infinite;
        }
        .particle:nth-child(42) {
            top: 74.9391727494%;
            left: 95.8904109589%;
            font-size: 22px;
            filter: blur(0.84px);
            animation: 36s floatReverse infinite;
        }
        .particle:nth-child(43) {
            top: 18.4466019417%;
            left: 76.171875%;
            font-size: 24px;
            filter: blur(0.86px);
            animation: 39s float2 infinite;
        }
        .particle:nth-child(44) {
            top: 50.9179926561%;
            left: 28.5152409046%;
            font-size: 17px;
            filter: blur(0.88px);
            animation: 26s float2 infinite;
        }
        .particle:nth-child(45) {
            top: 61.1650485437%;
            left: 1.953125%;
            font-size: 24px;
            filter: blur(0.9px);
            animation: 36s floatReverse2 infinite;
        }
        .particle:nth-child(46) {
            top: 32.4723247232%;
            left: 30.602171767%;
            font-size: 13px;
            filter: blur(0.92px);
            animation: 39s float2 infinite;
        }
        .particle:nth-child(47) {
            top: 55.2404438964%;
            left: 90.9990108803%;
            font-size: 11px;
            filter: blur(0.94px);
            animation: 29s float2 infinite;
        }
        .particle:nth-child(48) {
            top: 57.8431372549%;
            left: 25.5905511811%;
            font-size: 16px;
            filter: blur(0.96px);
            animation: 31s floatReverse2 infinite;
        }
        .particle:nth-child(49) {
            top: 8.8343558282%;
            left: 35.4679802956%;
            font-size: 15px;
            filter: blur(0.98px);
            animation: 34s float infinite;
        }
        .particle:nth-child(50) {
            top: 78.640776699%;
            left: 52.734375%;
            font-size: 24px;
            filter: blur(1px);
            animation: 28s float2 infinite;
        }
        .particle:nth-child(51) {
            top: 86.3803680982%;
            left: 25.6157635468%;
            font-size: 15px;
            filter: blur(1.02px);
            animation: 21s float infinite;
        }
        .particle:nth-child(52) {
            top: 32.7710843373%;
            left: 38.8349514563%;
            font-size: 30px;
            filter: blur(1.04px);
            animation: 29s float2 infinite;
        }
        .particle:nth-child(53) {
            top: 83.8471023428%;
            left: 36.5974282888%;
            font-size: 11px;
            filter: blur(1.06px);
            animation: 36s float2 infinite;
        }
        .particle:nth-child(54) {
            top: 55.4744525547%;
            left: 38.1604696673%;
            font-size: 22px;
            filter: blur(1.08px);
            animation: 36s floatReverse2 infinite;
        }
        .particle:nth-child(55) {
            top: 42.4607961399%;
            left: 22.351797862%;
            font-size: 29px;
            filter: blur(1.1px);
            animation: 32s floatReverse2 infinite;
        }
        .particle:nth-child(56) {
            top: 56.157635468%;
            left: 3.95256917%;
            font-size: 12px;
            filter: blur(1.12px);
            animation: 21s float infinite;
        }
        .particle:nth-child(57) {
            top: 29.9516908213%;
            left: 42.8015564202%;
            font-size: 28px;
            filter: blur(1.14px);
            animation: 35s floatReverse infinite;
        }
        .particle:nth-child(58) {
            top: 10.6537530266%;
            left: 18.5185185185%;
            font-size: 26px;
            filter: blur(1.16px);
            animation: 21s float infinite;
        }
        .particle:nth-child(59) {
            top: 92.0440636475%;
            left: 31.465093412%;
            font-size: 17px;
            filter: blur(1.18px);
            animation: 24s float infinite;
        }
        .particle:nth-child(60) {
            top: 69.4376528117%;
            left: 15.7170923379%;
            font-size: 18px;
            filter: blur(1.2px);
            animation: 22s floatReverse infinite;
        }
        .particle:nth-child(61) {
            top: 29.520295203%;
            left: 68.1145113524%;
            font-size: 13px;
            filter: blur(1.22px);
            animation: 40s float2 infinite;
        }
        .particle:nth-child(62) {
            top: 38.9768574909%;
            left: 61.7042115573%;
            font-size: 21px;
            filter: blur(1.24px);
            animation: 25s floatReverse infinite;
        }
        .particle:nth-child(63) {
            top: 89.1041162228%;
            left: 92.5925925926%;
            font-size: 26px;
            filter: blur(1.26px);
            animation: 31s floatReverse infinite;
        }
        .particle:nth-child(64) {
            top: 82.0265379976%;
            left: 90.3790087464%;
            font-size: 29px;
            filter: blur(1.28px);
            animation: 29s float2 infinite;
        }
        .particle:nth-child(65) {
            top: 12.6520681265%;
            left: 95.8904109589%;
            font-size: 22px;
            filter: blur(1.3px);
            animation: 22s float2 infinite;
        }
        .particle:nth-child(66) {
            top: 94.8004836759%;
            left: 26.2901655307%;
            font-size: 27px;
            filter: blur(1.32px);
            animation: 34s float2 infinite;
        }
        .particle:nth-child(67) {
            top: 88.6746987952%;
            left: 11.6504854369%;
            font-size: 30px;
            filter: blur(1.34px);
            animation: 25s float infinite;
        }
        .particle:nth-child(68) {
            top: 84.1596130593%;
            left: 14.605647517%;
            font-size: 27px;
            filter: blur(1.36px);
            animation: 40s float infinite;
        }
        .particle:nth-child(69) {
            top: 70.243902439%;
            left: 40.1960784314%;
            font-size: 20px;
            filter: blur(1.38px);
            animation: 29s floatReverse infinite;
        }
        .particle:nth-child(70) {
            top: 84.6248462485%;
            left: 60.2171767029%;
            font-size: 13px;
            filter: blur(1.4px);
            animation: 28s floatReverse2 infinite;
        }
        .particle:nth-child(71) {
            top: 39.9512789281%;
            left: 62.6836434868%;
            font-size: 21px;
            filter: blur(1.42px);
            animation: 28s floatReverse infinite;
        }
        .particle:nth-child(72) {
            top: 21.4111922141%;
            left: 32.28962818%;
            font-size: 22px;
            filter: blur(1.44px);
            animation: 31s float infinite;
        }
        .particle:nth-child(73) {
            top: 21.3851761847%;
            left: 19.550342131%;
            font-size: 23px;
            filter: blur(1.46px);
            animation: 23s float2 infinite;
        }
        .particle:nth-child(74) {
            top: 78.5454545455%;
            left: 83.9024390244%;
            font-size: 25px;
            filter: blur(1.48px);
            animation: 37s float infinite;
        }
        .particle:nth-child(75) {
            top: 40.7272727273%;
            left: 94.6341463415%;
            font-size: 25px;
            filter: blur(1.5px);
            animation: 24s float infinite;
        }
        .particle:nth-child(76) {
            top: 80.9756097561%;
            left: 87.2549019608%;
            font-size: 20px;
            filter: blur(1.52px);
            animation: 25s floatReverse infinite;
        }
        .particle:nth-child(77) {
            top: 6.8796068796%;
            left: 52.2682445759%;
            font-size: 14px;
            filter: blur(1.54px);
            animation: 33s floatReverse2 infinite;
        }
        .particle:nth-child(78) {
            top: 11.7647058824%;
            left: 5.905511811%;
            font-size: 16px;
            filter: blur(1.56px);
            animation: 38s floatReverse2 infinite;
        }
        .particle:nth-child(79) {
            top: 84.2615012107%;
            left: 85.7699805068%;
            font-size: 26px;
            filter: blur(1.58px);
            animation: 21s float infinite;
        }
        .particle:nth-child(80) {
            top: 40.8262454435%;
            left: 20.5278592375%;
            font-size: 23px;
            filter: blur(1.6px);
            animation: 33s floatReverse infinite;
        }

        @keyframes apparition {
            from {
                opacity: 0;
                transform: translateY(100px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(180px);
            }
        }
        @keyframes floatReverse {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-180px);
            }
        }
        @keyframes float2 {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(28px);
            }
        }
        @keyframes floatReverse2 {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-28px);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
            <div>
                <p class="title">Oops, you got ${statusCode}${exceptionType} error!</p>
                <p>${errorMessage}</p>
                <a href="<c:url value="/"/>">
                    <button>Go back to home.</button>
                </a>
            </div>
            <svg class="animated" id="freepik_stories-dizzy-face" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 500" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs">
                <g id="freepik--background-simple--inject-81" class="animable" style="transform-origin: 245.544px 235.123px;">
                    <path d="M433.62,110.35q-2.3-3.84-4.8-7.53c-22.23-32.66-59.23-55-95.19-65.14a204.26,204.26,0,0,0-48.08-7.36c-105.91-3.85-144.82,83.47-178.94,106s-86.49,61-79.92,141.76c5,61.42,39.93,120.16,103.75,146.88a180.85,180.85,0,0,0,22.15,7.65,212,212,0,0,0,46.77,7.19c48.25,2.15,87.43-9.49,125.75-38.77,8.91-6.81,17.77-14.49,29.33-15.33,8.41-.61,16.37,2.4,7.59,10.53-10.32,9.54,1.59,28.31,27.79,15.27,43.77-21.78,61.77-68.78,70.25-116.57C470.48,236.26,465.44,163.32,433.62,110.35Z" style="fill: #579EE0; transform-origin: 245.544px 235.123px;" id="elr4we2u1a4t" class="animable"></path>
                    <g id="el2pbdw9s7fa4">
                        <path d="M433.62,110.35q-2.3-3.84-4.8-7.53c-22.23-32.66-59.23-55-95.19-65.14a204.26,204.26,0,0,0-48.08-7.36c-105.91-3.85-144.82,83.47-178.94,106s-86.49,61-79.92,141.76c5,61.42,39.93,120.16,103.75,146.88a180.85,180.85,0,0,0,22.15,7.65,212,212,0,0,0,46.77,7.19c48.25,2.15,87.43-9.49,125.75-38.77,8.91-6.81,17.77-14.49,29.33-15.33,8.41-.61,16.37,2.4,7.59,10.53-10.32,9.54,1.59,28.31,27.79,15.27,43.77-21.78,61.77-68.78,70.25-116.57C470.48,236.26,465.44,163.32,433.62,110.35Z" style="fill: rgb(255, 255, 255); opacity: 0.7; transform-origin: 245.544px 235.123px;" class="animable" id="el826asqve8aq"></path>
                    </g>
                </g>
                <g id="freepik--Spiral--inject-81" class="animable" style="transform-origin: 250.17px 232.534px;">
                    <path d="M216,270.52a29.7,29.7,0,0,1-21.11-8.72,24,24,0,0,1-.09-34,19.37,19.37,0,0,1,27.36-.07,15.59,15.59,0,0,1,.05,22,12.44,12.44,0,0,1-8.87,3.7h0a12.46,12.46,0,0,1-8.86-3.65,10.16,10.16,0,0,1,0-14.35,8.13,8.13,0,0,1,5.81-2.42h0a8.11,8.11,0,0,1,5.79,2.39,6.69,6.69,0,0,1,0,9.44,5.39,5.39,0,0,1-3.84,1.6h0a5.38,5.38,0,0,1-3.83-1.58,4.44,4.44,0,0,1,0-6.3,3.65,3.65,0,0,1,2.59-1.08h0a3.63,3.63,0,0,1,2.58,1.07,3,3,0,0,1,0,4.28,2.53,2.53,0,0,1-3.57,0,2.13,2.13,0,0,1,0-3,.51.51,0,0,1,.71,0,.5.5,0,0,1,0,.71,1.12,1.12,0,0,0,0,1.58,1.46,1.46,0,0,0,1.07.44h0a1.55,1.55,0,0,0,1.08-.44,2.05,2.05,0,0,0,.59-1.44,2,2,0,0,0-.6-1.43,2.64,2.64,0,0,0-1.87-.78h0a2.62,2.62,0,0,0-1.88.79,3.43,3.43,0,0,0-1,2.44,3.49,3.49,0,0,0,1,2.44,4.43,4.43,0,0,0,3.13,1.29h0a4.41,4.41,0,0,0,3.14-1.31,5.67,5.67,0,0,0,0-8,7.15,7.15,0,0,0-5.09-2.1h0a7.17,7.17,0,0,0-5.1,2.12,9.17,9.17,0,0,0,0,12.94,11.51,11.51,0,0,0,8.16,3.36h0a11.45,11.45,0,0,0,8.16-3.4,14.58,14.58,0,0,0-.05-20.61,18.36,18.36,0,0,0-25.94.06,23.06,23.06,0,0,0,.08,32.6A28.73,28.73,0,0,0,216,269.52h.08A28.75,28.75,0,0,0,236.49,261a36.3,36.3,0,0,0-.13-51.34,45.52,45.52,0,0,0-64.35.16,57.14,57.14,0,0,0-14.48,55.61.5.5,0,1,1-1,.27,58.17,58.17,0,0,1,14.74-56.58,46.19,46.19,0,0,1,32.85-13.7h.12A46.18,46.18,0,0,1,237.07,209a37.3,37.3,0,0,1,.13,52.75,29.73,29.73,0,0,1-21.15,8.82Z" style="fill: rgb(38, 50, 56); transform-origin: 201.228px 232.995px;" id="el1x8hs04sru0i" class="animable"></path>
                    <path d="M222.55,312.21a71.9,71.9,0,0,1-51-21.07,58.06,58.06,0,0,1-10.36-14,.49.49,0,0,1,.2-.67.5.5,0,0,1,.68.2,57.06,57.06,0,0,0,10.18,13.73,70.94,70.94,0,0,0,50.34,20.78h.19a71,71,0,0,0,50.42-21,89.45,89.45,0,0,0-.32-126.36A111.7,111.7,0,0,0,130.22,151.2a.5.5,0,0,1-.7-.12.51.51,0,0,1,.13-.7,112.7,112.7,0,0,1,143.9,12.73,90.46,90.46,0,0,1,.32,127.77,71.91,71.91,0,0,1-51.13,21.33Z" style="fill: rgb(38, 50, 56); transform-origin: 214.78px 221.214px;" id="el3mo40c8sk3x" class="animable"></path>
                    <path d="M109,170.08a.46.46,0,0,1-.33-.13.48.48,0,0,1,0-.7c1.73-1.95,3.55-3.88,5.4-5.74,2.51-2.52,5.15-4.94,7.87-7.21a.5.5,0,0,1,.7.07.49.49,0,0,1-.06.7c-2.69,2.24-5.32,4.65-7.8,7.14-1.84,1.85-3.64,3.77-5.37,5.7A.5.5,0,0,1,109,170.08Z" style="fill: rgb(38, 50, 56); transform-origin: 115.639px 163.135px;" id="ellulwipei7d" class="animable"></path>
                    <path d="M238.81,414a176,176,0,0,1-124.3-51.25,140.9,140.9,0,0,1-13-184.87.5.5,0,1,1,.79.6C60.24,234,65.79,312.86,115.21,362a175.1,175.1,0,0,0,211.62,27.15.5.5,0,1,1,.5.86A175.23,175.23,0,0,1,238.81,414Z" style="fill: rgb(38, 50, 56); transform-origin: 200.308px 295.815px;" id="elnpdo1it2lqc" class="animable"></path>
                    <path d="M340.73,381.26a.48.48,0,0,1-.4-.21.5.5,0,0,1,.11-.69,176.94,176.94,0,0,0,22.23-18.93c80.82-81.22,85.07-212.29,9.67-298.39a.51.51,0,0,1,0-.71.51.51,0,0,1,.71.05,219.87,219.87,0,0,1-9.71,299.75,176.63,176.63,0,0,1-22.36,19A.48.48,0,0,1,340.73,381.26Z" style="fill: rgb(38, 50, 56); transform-origin: 383.794px 221.735px;" id="elsqeltimzkv" class="animable"></path>
                    <path d="M369.29,59.39a.54.54,0,0,1-.37-.16c-2.26-2.47-4.62-4.92-7-7.31a.5.5,0,0,1,0-.71.5.5,0,0,1,.7,0c2.41,2.4,4.78,4.87,7.05,7.34a.5.5,0,0,1-.37.84Z" style="fill: rgb(38, 50, 56); transform-origin: 365.788px 55.2285px;" id="eljgokzsvaol" class="animable"></path>
                </g>
                <g id="freepik--Plant--inject-81" class="animable" style="transform-origin: 351.447px 422.738px;">
                    <path d="M371.08,424c-1.59-.23-4.61-2.2-4.61-2.2s1.9-1.6,2-1.68c1.54-1,5.1-2,6.69-.69a2.43,2.43,0,0,1,.05,3.62A5.12,5.12,0,0,1,371.08,424Z" style="fill: rgb(38, 50, 56); transform-origin: 371.232px 421.453px;" id="el8ibs9h7tpvy" class="animable"></path>
                    <path d="M341.46,408.77s.71-2.38.77-2.52c.74-1.68,3.16-4.48,5.2-4.26a2.42,2.42,0,0,1,2,3,5.06,5.06,0,0,1-3,3.09C345.07,408.75,341.47,408.77,341.46,408.77Z" style="fill: rgb(38, 50, 56); transform-origin: 345.483px 405.374px;" id="elgnv7sk2dhgo" class="animable"></path>
                    <path d="M338.5,448.5c-.7.87-1.34,1.69-1.92,2.45h-1.44c.73-.93,1.57-2,2.53-3.13.56-.66,1.17-1.36,1.8-2.08a22,22,0,0,1-1.61-2.2,15.51,15.51,0,0,1-4.26.3c-.1.85-.19,1.67-.26,2.45-.17,1.77-.27,3.34-.33,4.66h-1.18c.1-1.35.24-2.95.45-4.77.09-.86.21-1.78.35-2.72a14.56,14.56,0,0,1-4-1.82,4.48,4.48,0,0,1-1.73-3.34,2.13,2.13,0,0,1,2.45-2c1.78.32,3.13,3.27,3.34,4.87,0,.1,0,1.13,0,1.79.06-.39.11-.76.17-1.16.12-.78.26-1.56.41-2.4l.27-1.22c.08-.4.21-.83.32-1.25.26-1,.58-1.93.92-2.9a14.06,14.06,0,0,1-4.13-1.17,4.44,4.44,0,0,1-2.21-3,2.14,2.14,0,0,1,2.12-2.37c1.8.05,3.59,2.77,4,4.31,0,.1.23,1.25.33,1.88.2-.58.41-1.16.64-1.74.67-1.68,1.4-3.35,2.11-5,.23-.52.44-1,.65-1.54a14.88,14.88,0,0,1-4.28-1.2,4.47,4.47,0,0,1-2.21-3,2.14,2.14,0,0,1,2.12-2.37c1.8.05,3.59,2.77,4,4.32,0,.11.32,1.76.37,2.19.48-1.13.94-2.26,1.35-3.4a36.34,36.34,0,0,0,1.38-4.67,15.22,15.22,0,0,1-4.3-1.2,4.44,4.44,0,0,1-2.21-3,2.13,2.13,0,0,1,2.11-2.37c1.81.05,3.59,2.77,4,4.31,0,.1.25,1.36.34,2h.11a27.94,27.94,0,0,0,.52-4.87c0-.9,0-1.77,0-2.6a14.64,14.64,0,0,1-4.31-.72,4.45,4.45,0,0,1-2.53-2.77,2.14,2.14,0,0,1,1.85-2.59c1.79-.15,3.86,2.36,4.48,3.85,0,.08.29.94.46,1.57,0-.38,0-.77-.07-1.13-.11-1.36-.3-2.6-.48-3.7-.1-.62-.21-1.18-.31-1.7a14.42,14.42,0,0,1-3.48-2.61,4.46,4.46,0,0,1-1-3.63,2.13,2.13,0,0,1,2.83-1.44c1.67.7,2.35,3.88,2.21,5.48,0,.14-.44,2.29-.47,2.27l0,0c.11.5.22,1,.34,1.63.2,1.1.41,2.33.56,3.7A40.22,40.22,0,0,1,342,412a27.29,27.29,0,0,1-.42,4.93s0,0,0,.06c.25-.47,1-1.75,1.05-1.84.95-1.3,3.55-3.26,5.26-2.69a2.14,2.14,0,0,1,1.19,2.95,4.47,4.47,0,0,1-3.11,2.1,14.89,14.89,0,0,1-4.43-.33,38.58,38.58,0,0,1-1.32,4.86c-.32.93-.66,1.86-1,2.78l.46-.8c1-1.3,3.56-3.25,5.27-2.68a2.13,2.13,0,0,1,1.19,2.94,4.45,4.45,0,0,1-3.11,2.11,14.19,14.19,0,0,1-4.31-.31l-.42,1.06c-.68,1.69-1.37,3.37-2,5.05-.22.59-.41,1.17-.61,1.76.2-.35.37-.65.4-.69,1-1.3,3.56-3.25,5.27-2.68a2.13,2.13,0,0,1,1.19,2.94,4.47,4.47,0,0,1-3.11,2.1,13.58,13.58,0,0,1-4.19-.28c-.19.61-.37,1.22-.52,1.82-.1.41-.22.8-.29,1.21s-.16.82-.23,1.23c-.13.78-.26,1.59-.35,2.35-.08.54-.14,1.05-.2,1.56.21-.59.65-1.74.7-1.83a8.29,8.29,0,0,1,2.92-3,1.8,1.8,0,0,1,.25-.4,2.13,2.13,0,0,1,3.16-.33c1.3,1.24.8,4.46.1,5.91,0,.08-.6,1-1,1.51.26-.29.51-.58.78-.87.53-.59,1.08-1.16,1.67-1.78l.89-.87c.29-.3.64-.57,1-.86.75-.66,1.55-1.3,2.37-1.91a14.23,14.23,0,0,1-2.8-3.26,4.48,4.48,0,0,1-.17-3.75,2.14,2.14,0,0,1,3.07-.81c1.48,1,1.47,4.29,1,5.83,0,.1-.49,1.16-.76,1.74.5-.37,1-.74,1.5-1.09,1.48-1,3-2,4.53-3l1.39-.93a15,15,0,0,1-2.91-3.36,4.48,4.48,0,0,1-.17-3.75,2.13,2.13,0,0,1,3.07-.8c1.48,1,1.47,4.29,1,5.83,0,.11-.7,1.64-.89,2,1-.68,2-1.37,3-2.09A36,36,0,0,0,361,428.5a15.07,15.07,0,0,1-2.93-3.37,4.48,4.48,0,0,1-.17-3.75,2.14,2.14,0,0,1,3.07-.81c1.48,1,1.47,4.29,1,5.83,0,.1-.55,1.27-.8,1.82l.08.06a28.37,28.37,0,0,0,3.13-3.78c.52-.74,1-1.47,1.4-2.19a14.41,14.41,0,0,1-3.2-3,4.43,4.43,0,0,1-.58-3.7,2.12,2.12,0,0,1,3-1.14c1.59.86,1.93,4.1,1.63,5.68,0,.09-.28.94-.48,1.56.18-.33.38-.66.56-1,.65-1.2,1.18-2.33,1.64-3.34.25-.58.47-1.11.67-1.6a14.6,14.6,0,0,1-1.46-4.09,4.48,4.48,0,0,1,1.2-3.56,2.13,2.13,0,0,1,3.15.35c1,1.5-.18,4.53-1.18,5.8-.08.11-1.63,1.66-1.64,1.63l0,0c-.18.48-.38,1-.62,1.54-.43,1-.94,2.17-1.57,3.39a37,37,0,0,1-2.22,3.82,27.83,27.83,0,0,1-3.07,3.89l0,0c.46-.26,1.78-.92,1.89-1,1.51-.56,4.75-.76,5.87.66a2.13,2.13,0,0,1-.63,3.11,4.45,4.45,0,0,1-3.76,0,14.46,14.46,0,0,1-3.51-2.72,38.23,38.23,0,0,1-3.79,3.33c-.77.6-1.57,1.18-2.38,1.76l.83-.41c1.51-.56,4.76-.76,5.87.66a2.13,2.13,0,0,1-.63,3.11,4.43,4.43,0,0,1-3.75,0,14,14,0,0,1-3.43-2.63l-.93.65c-1.51,1-3,2.06-4.45,3.11-.51.37-1,.75-1.49,1.13l.72-.35c1.51-.56,4.76-.75,5.87.67a2.13,2.13,0,0,1-.63,3.11,4.47,4.47,0,0,1-3.75,0,13.44,13.44,0,0,1-3.34-2.55c-.49.4-1,.81-1.44,1.22s-.62.55-.91.86l-.87.89c-.53.59-1.09,1.19-1.59,1.78-.36.4-.69.79-1,1.19.5-.38,1.5-1.09,1.59-1.14,1.41-.78,4.59-1.47,5.9-.23a2.13,2.13,0,0,1-.15,3.17,4.43,4.43,0,0,1-3.7.6,14.5,14.5,0,0,1-3.87-2.14C339.52,447.25,339,447.89,338.5,448.5Z" style="fill: rgb(38, 50, 56); transform-origin: 349.595px 422.738px;" id="elzck69y9wjtr" class="animable"></path>
                </g>
                <g id="freepik--Floor--inject-81" class="animable" style="transform-origin: 245.82px 453.92px;">
                    <ellipse cx="245.82" cy="453.92" rx="186.58" ry="10.45" style="fill: rgb(38, 50, 56); transform-origin: 245.82px 453.92px;" id="el7oi4x4hf1yu" class="animable"></ellipse>
                </g>
                <g id="freepik--face-4--inject-81" class="animable" style="transform-origin: 361.45px 205.37px;">
                    <path d="M364.76,252.61A47.24,47.24,0,1,1,412,205.37,47.29,47.29,0,0,1,364.76,252.61Zm0-93.48A46.24,46.24,0,1,0,411,205.37,46.29,46.29,0,0,0,364.76,159.13Z" style="fill: rgb(38, 50, 56); transform-origin: 364.76px 205.37px;" id="elv07j7ie4dz" class="animable"></path>
                    <path d="M346.59,220.24a11.62,11.62,0,0,1-10.68-6.89c-1.89-4.65.16-10.41,4.5-12.56a7.91,7.91,0,0,1,9.24,1.46A5.82,5.82,0,0,1,351,207.2a7.49,7.49,0,0,1-3.75,5.13,1,1,0,0,1-1.36-.41,1,1,0,0,1,.41-1.35,5.46,5.46,0,0,0,2.73-3.72,3.77,3.77,0,0,0-.91-3.27,5.85,5.85,0,0,0-6.85-1c-3.38,1.68-5,6.36-3.53,10a9.74,9.74,0,0,0,9.61,5.61,11.91,11.91,0,0,0,9.41-6.79,13,13,0,0,0-1.12-13.57,14.17,14.17,0,0,0-13.37-5.64c-8.37,1.1-14.32,7.86-15.15,17.22a1,1,0,0,1-2-.18c.93-10.33,7.55-17.8,16.89-19a16.19,16.19,0,0,1,15.25,6.46,15.09,15.09,0,0,1,1.3,15.61,13.92,13.92,0,0,1-11,7.91C347.23,220.23,346.91,220.24,346.59,220.24Z" style="fill: rgb(38, 50, 56); transform-origin: 342.631px 205.16px;" id="elksfe3bup42c" class="animable"></path>
                    <path d="M382.19,220.24c-.32,0-.64,0-1,0a13.92,13.92,0,0,1-11-7.91,15.09,15.09,0,0,1,1.3-15.61,16.19,16.19,0,0,1,15.25-6.46c9.34,1.23,16,8.7,16.88,19a1,1,0,0,1-2,.18c-.83-9.36-6.78-16.12-15.15-17.22a14.15,14.15,0,0,0-13.37,5.65A12.93,12.93,0,0,0,372,211.42a11.91,11.91,0,0,0,9.41,6.79A9.73,9.73,0,0,0,391,212.6c1.49-3.66-.16-8.34-3.53-10a5.85,5.85,0,0,0-6.85,1,3.78,3.78,0,0,0-.91,3.27,5.43,5.43,0,0,0,2.73,3.72,1,1,0,0,1,.4,1.35,1,1,0,0,1-1.35.41,7.49,7.49,0,0,1-3.75-5.13,5.82,5.82,0,0,1,1.38-4.95,7.91,7.91,0,0,1,9.24-1.46c4.33,2.15,6.39,7.91,4.49,12.56A11.6,11.6,0,0,1,382.19,220.24Z" style="fill: rgb(38, 50, 56); transform-origin: 386.114px 205.175px;" id="elba7bdsz8s5i" class="animable"></path>
                    <path d="M374.94,234c0,3.6-5.51,3.91-11.16,3.91s-9.3-.31-9.3-3.91,4.58-8.74,10.23-8.74S374.94,230.38,374.94,234Z" style="fill: rgb(38, 50, 56); transform-origin: 364.71px 231.585px;" id="eloel351fseom" class="animable"></path>
                    <path d="M349.9,174.16l-19.19,9.75a2,2,0,0,0-1,2.41h0a2,2,0,0,0,2.66,1.33l20.15-7.44a2,2,0,0,0,1.18-2.69l-.95-2.32A2,2,0,0,0,349.9,174.16Z" style="fill: rgb(38, 50, 56); transform-origin: 341.738px 180.847px;" id="elc4r5jtf4sem" class="animable"></path>
                    <path d="M378.21,174.16l19.19,9.75a2,2,0,0,1,1,2.41h0a2,2,0,0,1-2.67,1.33l-20.15-7.44a2,2,0,0,1-1.18-2.69l.95-2.32A2.05,2.05,0,0,1,378.21,174.16Z" style="fill: rgb(38, 50, 56); transform-origin: 386.366px 180.857px;" id="el4om1mwjih58" class="animable"></path>
                    <path d="M414.87,232.27a5.14,5.14,0,1,1,5.13-5.13A5.14,5.14,0,0,1,414.87,232.27Zm0-9.27a4.14,4.14,0,1,0,4.13,4.14A4.14,4.14,0,0,0,414.87,223Z" style="fill: rgb(38, 50, 56); transform-origin: 414.86px 227.13px;" id="elkwgwommxoye" class="animable"></path>
                    <path d="M304.9,194.61a3.5,3.5,0,1,1,3.5-3.5A3.5,3.5,0,0,1,304.9,194.61Zm0-6a2.5,2.5,0,1,0,2.5,2.5A2.5,2.5,0,0,0,304.9,188.61Z" style="fill: rgb(38, 50, 56); transform-origin: 304.9px 191.11px;" id="elj7t3vts6x0r" class="animable"></path>
                    <path d="M318.6,239.48a.5.5,0,0,1-.5-.5v-3.21a.51.51,0,0,1,.5-.5.5.5,0,0,1,.5.5V239A.5.5,0,0,1,318.6,239.48Z" style="fill: rgb(38, 50, 56); transform-origin: 318.6px 237.375px;" id="elnulks44f38p" class="animable"></path>
                    <path d="M318.6,246.17a.51.51,0,0,1-.5-.5v-3.21a.5.5,0,0,1,.5-.5.5.5,0,0,1,.5.5v3.21A.5.5,0,0,1,318.6,246.17Z" style="fill: rgb(38, 50, 56); transform-origin: 318.6px 244.065px;" id="eleg687hfc8rs" class="animable"></path>
                    <path d="M323.55,241.22h-3.21a.5.5,0,0,1,0-1h3.21a.5.5,0,0,1,0,1Z" style="fill: rgb(38, 50, 56); transform-origin: 321.945px 240.72px;" id="eltdr6di6d348" class="animable"></path>
                    <path d="M316.86,241.22h-3.2a.5.5,0,0,1,0-1h3.2a.5.5,0,0,1,0,1Z" style="fill: rgb(38, 50, 56); transform-origin: 315.26px 240.72px;" id="eletnjty8r0qs" class="animable"></path>
                    <path d="M417.8,184.76a.5.5,0,0,1-.5-.5V182.2a.5.5,0,0,1,1,0v2.06A.5.5,0,0,1,417.8,184.76Z" style="fill: rgb(38, 50, 56); transform-origin: 417.8px 183.23px;" id="elivn6wl1x4l" class="animable"></path>
                    <path d="M417.8,189.07a.5.5,0,0,1-.5-.5V186.5a.5.5,0,1,1,1,0v2.07A.5.5,0,0,1,417.8,189.07Z" style="fill: rgb(38, 50, 56); transform-origin: 417.8px 187.535px;" id="el8hfsflts5oi" class="animable"></path>
                    <path d="M421,185.88h-2.06a.5.5,0,1,1,0-1H421a.5.5,0,0,1,0,1Z" style="fill: rgb(38, 50, 56); transform-origin: 419.97px 185.38px;" id="el1druhukwvgr" class="animable"></path>
                    <path d="M416.68,185.88h-2.07a.5.5,0,0,1,0-1h2.07a.5.5,0,0,1,0,1Z" style="fill: rgb(38, 50, 56); transform-origin: 415.645px 185.38px;" id="elfoktbw23f6j" class="animable"></path>
                </g>
                <g id="freepik--face-3--inject-81" class="animable" style="transform-origin: 426.89px 363.8px;">
                    <path d="M428.74,390.22a26.42,26.42,0,1,1,26.42-26.42A26.45,26.45,0,0,1,428.74,390.22Zm0-51.83a25.42,25.42,0,1,0,25.42,25.41A25.44,25.44,0,0,0,428.74,338.39Z" style="fill: rgb(38, 50, 56); transform-origin: 428.74px 363.8px;" id="el0e2suu2jnm6l" class="animable"></path>
                    <path d="M434.38,379.66c0,2-3.05,2.17-6.19,2.17s-5.15-.17-5.15-2.17,2.54-4.84,5.67-4.84S434.38,377.67,434.38,379.66Z" style="fill: rgb(38, 50, 56); transform-origin: 428.71px 378.325px;" id="elyucpfziqim" class="animable"></path>
                    <path d="M420.5,346.5l-10.64,5.41a1.12,1.12,0,0,0-.57,1.33h0a1.12,1.12,0,0,0,1.47.74l11.18-4.13a1.12,1.12,0,0,0,.65-1.49l-.53-1.28A1.13,1.13,0,0,0,420.5,346.5Z" style="fill: rgb(38, 50, 56); transform-origin: 415.96px 350.214px;" id="elcny2t1pu545" class="animable"></path>
                    <path d="M436.2,346.5l10.64,5.41a1.12,1.12,0,0,1,.57,1.33h0a1.13,1.13,0,0,1-1.48.74l-11.17-4.13a1.12,1.12,0,0,1-.65-1.49l.52-1.28A1.14,1.14,0,0,1,436.2,346.5Z" style="fill: rgb(38, 50, 56); transform-origin: 440.74px 350.214px;" id="elrh95b2a5hb" class="animable"></path>
                    <path d="M424.65,371a1,1,0,0,1-.67-.26l-12.46-11.21a1,1,0,0,1,1.34-1.49l12.46,11.22a1,1,0,0,1-.67,1.74Z" style="fill: rgb(38, 50, 56); transform-origin: 418.418px 364.392px;" id="elr6vmbmrbsh" class="animable"></path>
                    <path d="M412.19,371a1,1,0,0,1-.67-1.74L424,358a1,1,0,0,1,1.34,1.49l-12.46,11.21A1,1,0,0,1,412.19,371Z" style="fill: rgb(38, 50, 56); transform-origin: 418.432px 364.372px;" id="elww1wcio0yw" class="animable"></path>
                    <path d="M444.27,371a1,1,0,0,1-.67-.26l-12.46-11.21a1,1,0,0,1,1.34-1.49l12.46,11.22a1,1,0,0,1,.07,1.41A1,1,0,0,1,444.27,371Z" style="fill: rgb(38, 50, 56); transform-origin: 438.038px 364.392px;" id="elzfuhwp1ct6" class="animable"></path>
                    <path d="M431.81,371a1,1,0,0,1-.67-1.74L443.6,358a1,1,0,0,1,1.34,1.49l-12.46,11.21A1,1,0,0,1,431.81,371Z" style="fill: rgb(38, 50, 56); transform-origin: 438.042px 364.372px;" id="elk0us7rrp5" class="animable"></path>
                    <path d="M456.52,378.94a3.07,3.07,0,1,1,3.07-3.07A3.07,3.07,0,0,1,456.52,378.94Zm0-5.14a2.07,2.07,0,1,0,2.07,2.07A2.07,2.07,0,0,0,456.52,373.8Z" style="fill: rgb(38, 50, 56); transform-origin: 456.52px 375.87px;" id="elie31rxqahl" class="animable"></path>
                    <path d="M395.55,358.06a2.17,2.17,0,1,1,2.16-2.16A2.17,2.17,0,0,1,395.55,358.06Zm0-3.33a1.17,1.17,0,1,0,1.16,1.17A1.17,1.17,0,0,0,395.55,354.73Z" style="fill: rgb(38, 50, 56); transform-origin: 395.54px 355.89px;" id="el1m0q0kdkxsv" class="animable"></path>
                    <path d="M403.14,382.94a.5.5,0,0,1-.5-.5v-1.78a.51.51,0,0,1,.5-.5.5.5,0,0,1,.5.5v1.78A.5.5,0,0,1,403.14,382.94Z" style="fill: rgb(38, 50, 56); transform-origin: 403.14px 381.55px;" id="elljvmtkg77eh" class="animable"></path>
                    <path d="M403.14,386.65a.51.51,0,0,1-.5-.5v-1.78a.5.5,0,0,1,.5-.5.5.5,0,0,1,.5.5v1.78A.5.5,0,0,1,403.14,386.65Z" style="fill: rgb(38, 50, 56); transform-origin: 403.14px 385.26px;" id="el0a52vo6ia3yu" class="animable"></path>
                    <path d="M405.89,383.9h-1.78a.5.5,0,0,1-.5-.5.5.5,0,0,1,.5-.5h1.78a.51.51,0,0,1,.5.5A.5.5,0,0,1,405.89,383.9Z" style="fill: rgb(38, 50, 56); transform-origin: 405px 383.4px;" id="elw1hkdovs6j" class="animable"></path>
                    <path d="M402.18,383.9H400.4a.5.5,0,0,1-.5-.5.51.51,0,0,1,.5-.5h1.78a.5.5,0,0,1,.5.5A.5.5,0,0,1,402.18,383.9Z" style="fill: rgb(38, 50, 56); transform-origin: 401.29px 383.4px;" id="eljuacs27vpqp" class="animable"></path>
                    <path d="M458.15,352.6a.5.5,0,0,1-.5-.5V351a.5.5,0,0,1,.5-.5.51.51,0,0,1,.5.5v1.15A.5.5,0,0,1,458.15,352.6Z" style="fill: rgb(38, 50, 56); transform-origin: 458.15px 351.55px;" id="elgmr38dju6iv" class="animable"></path>
                    <path d="M458.15,355a.5.5,0,0,1-.5-.5v-1.15a.5.5,0,0,1,.5-.5.5.5,0,0,1,.5.5v1.15A.51.51,0,0,1,458.15,355Z" style="fill: rgb(38, 50, 56); transform-origin: 458.15px 353.925px;" id="el8x4a53yu9k7" class="animable"></path>
                    <path d="M459.91,353.22h-1.14a.5.5,0,0,1,0-1h1.14a.5.5,0,1,1,0,1Z" style="fill: rgb(38, 50, 56); transform-origin: 459.34px 352.72px;" id="elk1cmkop20on" class="animable"></path>
                    <path d="M457.53,353.22h-1.15a.5.5,0,0,1,0-1h1.15a.5.5,0,0,1,0,1Z" style="fill: rgb(38, 50, 56); transform-origin: 456.955px 352.72px;" id="elcfsljatm3vj" class="animable"></path>
                </g>
                <g id="freepik--face-2--inject-81" class="animable" style="transform-origin: 72.5px 402.96px;">
                    <path d="M75,439.06A36.1,36.1,0,1,1,111.13,403,36.14,36.14,0,0,1,75,439.06Zm0-71.2A35.1,35.1,0,1,0,110.13,403,35.14,35.14,0,0,0,75,367.86Z" style="fill: rgb(38, 50, 56); transform-origin: 75.03px 402.96px;" id="el4fw32pc2ygc" class="animable"></path>
                    <path d="M82.79,424.74c0,2.74-4.2,3-8.5,3s-7.08-.24-7.08-3,3.48-6.65,7.79-6.65S82.79,422,82.79,424.74Z" style="fill: rgb(38, 50, 56); transform-origin: 75px 422.915px;" id="el98h4slkhh3s" class="animable"></path>
                    <path d="M63.72,379.19,49.1,386.62a1.55,1.55,0,0,0-.78,1.84h0a1.56,1.56,0,0,0,2,1l15.34-5.67a1.55,1.55,0,0,0,.9-2.05L65.87,380A1.57,1.57,0,0,0,63.72,379.19Z" style="fill: rgb(38, 50, 56); transform-origin: 57.4646px 384.287px;" id="el0hi7ntnyuash" class="animable"></path>
                    <path d="M85.28,379.19l14.62,7.43a1.55,1.55,0,0,1,.78,1.84h0a1.56,1.56,0,0,1-2,1L83.31,383.8a1.55,1.55,0,0,1-.9-2.05l.72-1.76A1.57,1.57,0,0,1,85.28,379.19Z" style="fill: rgb(38, 50, 56); transform-origin: 91.5204px 384.286px;" id="elxig0tvijyc" class="animable"></path>
                    <path d="M69.42,412.4a1,1,0,0,1-.67-.25l-17.11-15.4A1,1,0,1,1,53,395.26l17.11,15.4a1,1,0,0,1-.67,1.74Z" style="fill: rgb(38, 50, 56); transform-origin: 60.8744px 403.698px;" id="elwtxs2qomrz" class="animable"></path>
                    <path d="M52.31,412.4a1,1,0,0,1-.67-1.74l17.11-15.4a1,1,0,0,1,1.41.07,1,1,0,0,1-.07,1.42L53,412.15A1,1,0,0,1,52.31,412.4Z" style="fill: rgb(38, 50, 56); transform-origin: 60.8676px 403.701px;" id="eltj6c8opa2b" class="animable"></path>
                    <path d="M96.37,412.4a1,1,0,0,1-.67-.25l-17.11-15.4a1,1,0,1,1,1.34-1.49L97,410.66a1,1,0,0,1-.67,1.74Z" style="fill: rgb(38, 50, 56); transform-origin: 87.7912px 403.7px;" id="el3grksvj10bc" class="animable"></path>
                    <path d="M79.26,412.4a1,1,0,0,1-.67-1.74l17.11-15.4a1,1,0,0,1,1.41.07,1,1,0,0,1-.07,1.42l-17.11,15.4A1,1,0,0,1,79.26,412.4Z" style="fill: rgb(38, 50, 56); transform-origin: 87.8176px 403.701px;" id="eljngwkuoqrn" class="animable"></path>
                    <path d="M113.19,423.57a4,4,0,1,1,4-4A4,4,0,0,1,113.19,423.57Zm0-7.06a3,3,0,1,0,3,3A3,3,0,0,0,113.19,416.51Z" style="fill: rgb(38, 50, 56); transform-origin: 113.19px 419.57px;" id="elam342q48ajn" class="animable"></path>
                    <path d="M29.45,394.89a2.79,2.79,0,1,1,2.78-2.79A2.79,2.79,0,0,1,29.45,394.89Zm0-4.58a1.79,1.79,0,1,0,1.78,1.79A1.79,1.79,0,0,0,29.45,390.31Z" style="fill: rgb(38, 50, 56); transform-origin: 29.44px 392.1px;" id="eljdmgldi0wg" class="animable"></path>
                    <path d="M39.88,429.06a.5.5,0,0,1-.5-.5v-2.44a.5.5,0,0,1,1,0v2.44A.5.5,0,0,1,39.88,429.06Z" style="fill: rgb(38, 50, 56); transform-origin: 39.88px 427.34px;" id="el79bgyr0soxc" class="animable"></path>
                    <path d="M39.88,434.15a.5.5,0,0,1-.5-.5v-2.44a.5.5,0,0,1,1,0v2.44A.5.5,0,0,1,39.88,434.15Z" style="fill: rgb(38, 50, 56); transform-origin: 39.88px 432.43px;" id="elce5242ohawb" class="animable"></path>
                    <path d="M43.65,430.38H41.2a.5.5,0,0,1-.5-.5.51.51,0,0,1,.5-.5h2.45a.51.51,0,0,1,.5.5A.5.5,0,0,1,43.65,430.38Z" style="fill: rgb(38, 50, 56); transform-origin: 42.425px 429.88px;" id="el9j520cmpq" class="animable"></path>
                    <path d="M38.56,430.38H36.11a.5.5,0,0,1-.5-.5.51.51,0,0,1,.5-.5h2.45a.51.51,0,0,1,.5.5A.5.5,0,0,1,38.56,430.38Z" style="fill: rgb(38, 50, 56); transform-origin: 37.335px 429.88px;" id="ell3gq1i2y9v" class="animable"></path>
                    <path d="M115.43,387.39a.5.5,0,0,1-.5-.5v-1.58a.5.5,0,0,1,.5-.5.51.51,0,0,1,.5.5v1.58A.51.51,0,0,1,115.43,387.39Z" style="fill: rgb(38, 50, 56); transform-origin: 115.43px 386.1px;" id="elx7tuf7liql" class="animable"></path>
                    <path d="M115.43,390.66a.5.5,0,0,1-.5-.5v-1.57a.5.5,0,0,1,.5-.5.5.5,0,0,1,.5.5v1.57A.5.5,0,0,1,115.43,390.66Z" style="fill: rgb(38, 50, 56); transform-origin: 115.43px 389.375px;" id="elc74eig0ohgr" class="animable"></path>
                    <path d="M117.85,388.24h-1.57a.5.5,0,0,1-.5-.5.5.5,0,0,1,.5-.5h1.57a.5.5,0,0,1,.5.5A.5.5,0,0,1,117.85,388.24Z" style="fill: rgb(38, 50, 56); transform-origin: 117.065px 387.74px;" id="el9td24b99yuc" class="animable"></path>
                    <path d="M114.58,388.24H113a.51.51,0,0,1-.5-.5.5.5,0,0,1,.5-.5h1.58a.5.5,0,0,1,.5.5A.51.51,0,0,1,114.58,388.24Z" style="fill: rgb(38, 50, 56); transform-origin: 113.79px 387.74px;" id="elemd1ou5e3b" class="animable"></path>
                </g>
                <g id="freepik--face-1--inject-81" class="animable" style="transform-origin: 103.945px 106.67px;">
                    <path d="M105.91,134.81a28.14,28.14,0,1,1,28.14-28.14A28.17,28.17,0,0,1,105.91,134.81Zm0-55.28a27.14,27.14,0,1,0,27.14,27.14A27.17,27.17,0,0,0,105.91,79.53Z" style="fill: rgb(38, 50, 56); transform-origin: 105.91px 106.67px;" id="el5ckywmyxf0t" class="animable"></path>
                    <path d="M95.17,115.87a7.29,7.29,0,0,1-6.7-4.33,6.4,6.4,0,0,1,2.86-8,5,5,0,0,1,6,1,3.82,3.82,0,0,1,.91,3.27,4.83,4.83,0,0,1-2.42,3.32,1,1,0,1,1-1-1.76,2.81,2.81,0,0,0,1.41-1.91,1.82,1.82,0,0,0-.44-1.59,3.1,3.1,0,0,0-3.56-.5,4.39,4.39,0,0,0-1.89,5.41,5.32,5.32,0,0,0,5.27,3.06,6.63,6.63,0,0,0,5.23-3.78,7.25,7.25,0,0,0-.63-7.61,8,8,0,0,0-7.52-3.17c-4.75.62-8.13,4.48-8.61,9.81a1,1,0,1,1-2-.17c.57-6.31,4.62-10.87,10.34-11.62a10,10,0,0,1,9.4,4,9.32,9.32,0,0,1,.81,9.64,8.62,8.62,0,0,1-6.86,4.91Q95.47,115.87,95.17,115.87Z" style="fill: rgb(38, 50, 56); transform-origin: 92.8414px 106.54px;" id="elzkgmu2t8tb" class="animable"></path>
                    <path d="M116.21,115.87q-.3,0-.6,0a8.64,8.64,0,0,1-6.86-4.91,9.32,9.32,0,0,1,.81-9.64,9.94,9.94,0,0,1,9.4-4c5.72.75,9.77,5.31,10.34,11.62a1,1,0,1,1-2,.17c-.48-5.33-3.86-9.19-8.61-9.81a8,8,0,0,0-7.52,3.17,7.27,7.27,0,0,0-.63,7.61,6.63,6.63,0,0,0,5.23,3.78,5.31,5.31,0,0,0,5.27-3.06,4.39,4.39,0,0,0-1.89-5.41,3.1,3.1,0,0,0-3.56.5,1.81,1.81,0,0,0-.44,1.59,2.81,2.81,0,0,0,1.41,1.91,1,1,0,0,1-1,1.76,4.83,4.83,0,0,1-2.42-3.32,3.85,3.85,0,0,1,.91-3.27,5,5,0,0,1,6-1,6.4,6.4,0,0,1,2.86,8A7.29,7.29,0,0,1,116.21,115.87Z" style="fill: rgb(38, 50, 56); transform-origin: 118.539px 106.548px;" id="elw0sfpktpu7o" class="animable"></path>
                    <path d="M111.93,123.58c0,2.13-3.26,2.31-6.6,2.31s-5.5-.18-5.5-2.31,2.71-5.17,6-5.17S111.93,121.46,111.93,123.58Z" style="fill: rgb(38, 50, 56); transform-origin: 105.88px 122.15px;" id="elxdiyht3smxo" class="animable"></path>
                    <path d="M97.13,88.21,85.78,94a1.21,1.21,0,0,0-.61,1.43h0a1.21,1.21,0,0,0,1.57.78l11.92-4.4a1.19,1.19,0,0,0,.69-1.59l-.56-1.37A1.21,1.21,0,0,0,97.13,88.21Z" style="fill: rgb(38, 50, 56); transform-origin: 92.2824px 92.1842px;" id="elkf3bmop0t9g" class="animable"></path>
                    <path d="M113.86,88.21,125.21,94a1.22,1.22,0,0,1,.61,1.43h0a1.21,1.21,0,0,1-1.57.78l-11.92-4.4a1.21,1.21,0,0,1-.7-1.59l.57-1.37A1.21,1.21,0,0,1,113.86,88.21Z" style="fill: rgb(38, 50, 56); transform-origin: 118.706px 92.1842px;" id="elp5ahg9045s" class="animable"></path>
                    <path d="M135.54,122.78a3.24,3.24,0,1,1,3.24-3.24A3.24,3.24,0,0,1,135.54,122.78Zm0-5.48a2.24,2.24,0,1,0,2.24,2.24A2.24,2.24,0,0,0,135.54,117.3Z" style="fill: rgb(38, 50, 56); transform-origin: 135.54px 119.54px;" id="elq0oyb8aslje" class="animable"></path>
                    <path d="M70.51,100.51a2.28,2.28,0,1,1,2.28-2.27A2.27,2.27,0,0,1,70.51,100.51Zm0-3.55a1.28,1.28,0,1,0,1.28,1.28A1.27,1.27,0,0,0,70.51,97Z" style="fill: rgb(38, 50, 56); transform-origin: 70.51px 98.23px;" id="el3zu79sj7l7t" class="animable"></path>
                    <path d="M78.61,127a.5.5,0,0,1-.5-.5v-1.89a.5.5,0,0,1,.5-.5.5.5,0,0,1,.5.5v1.89A.5.5,0,0,1,78.61,127Z" style="fill: rgb(38, 50, 56); transform-origin: 78.61px 125.555px;" id="ell1ytkw8wl1" class="animable"></path>
                    <path d="M78.61,131a.51.51,0,0,1-.5-.5v-1.9a.5.5,0,0,1,.5-.5.5.5,0,0,1,.5.5v1.9A.5.5,0,0,1,78.61,131Z" style="fill: rgb(38, 50, 56); transform-origin: 78.61px 129.55px;" id="elxiu35anpltk" class="animable"></path>
                    <path d="M81.54,128.07h-1.9a.5.5,0,0,1-.5-.5.51.51,0,0,1,.5-.5h1.9a.5.5,0,0,1,.5.5A.5.5,0,0,1,81.54,128.07Z" style="fill: rgb(38, 50, 56); transform-origin: 80.59px 127.57px;" id="elhrequietvlp" class="animable"></path>
                    <path d="M77.59,128.07h-1.9a.5.5,0,0,1-.5-.5.5.5,0,0,1,.5-.5h1.9a.51.51,0,0,1,.5.5A.5.5,0,0,1,77.59,128.07Z" style="fill: rgb(38, 50, 56); transform-origin: 76.64px 127.57px;" id="eld373q0swtab" class="animable"></path>
                    <path d="M137.27,94.69a.51.51,0,0,1-.5-.5V93a.51.51,0,0,1,.5-.5.5.5,0,0,1,.5.5v1.23A.5.5,0,0,1,137.27,94.69Z" style="fill: rgb(38, 50, 56); transform-origin: 137.27px 93.595px;" id="elbg084p5e0mm" class="animable"></path>
                    <path d="M137.27,97.23a.5.5,0,0,1-.5-.5V95.51a.5.5,0,0,1,.5-.5.5.5,0,0,1,.5.5v1.22A.5.5,0,0,1,137.27,97.23Z" style="fill: rgb(38, 50, 56); transform-origin: 137.27px 96.12px;" id="elma95lb8i44" class="animable"></path>
                    <path d="M139.16,95.35h-1.22a.5.5,0,0,1-.5-.5.5.5,0,0,1,.5-.5h1.22a.5.5,0,0,1,.5.5A.51.51,0,0,1,139.16,95.35Z" style="fill: rgb(38, 50, 56); transform-origin: 138.55px 94.85px;" id="elxa6h1hlrm7n" class="animable"></path>
                    <path d="M136.61,95.35h-1.22a.5.5,0,0,1-.5-.5.5.5,0,0,1,.5-.5h1.22a.5.5,0,0,1,.5.5A.5.5,0,0,1,136.61,95.35Z" style="fill: rgb(38, 50, 56); transform-origin: 136px 94.85px;" id="el3ipbhn4abn" class="animable"></path>
                </g>
                <g id="freepik--Character--inject-81" class="animable" style="transform-origin: 261.532px 248.285px;">
                    <path d="M279.2,207.92,278,218.25s2.66,11.83,1.18,57.07c-.32,9.74,2.86,19.92,1.24,23.4s-6.26,7.65-6.26,7.65l-1.86-31.66L262,226.47l.93-21.34Z" style="fill: rgb(255, 255, 255); transform-origin: 271.441px 255.75px;" id="el6d5lxl72ttp" class="animable"></path>
                    <path d="M274.11,306.87a.41.41,0,0,1-.19,0,.49.49,0,0,1-.31-.43l-1.86-31.66-10.2-48.17a.49.49,0,0,1,0-.12l.93-21.34a.5.5,0,0,1,.19-.37.5.5,0,0,1,.39-.1l16.24,2.78a.51.51,0,0,1,.41.56l-1.24,10.25c.25,1.22,2.59,13.8,1.17,57.11a80,80,0,0,0,1,13.13c.62,4.74,1.12,8.48.19,10.46-1.65,3.53-6.19,7.64-6.38,7.81A.46.46,0,0,1,274.11,306.87Zm-11.57-80.44,10.2,48.18,1.8,30.66c1.37-1.33,4.21-4.26,5.37-6.76.81-1.72.31-5.51-.28-9.9a81.85,81.85,0,0,1-1-13.31c1.46-44.59-1.14-56.82-1.17-56.94a1,1,0,0,1,0-.17l1.2-9.86-15.21-2.61Z" style="fill: rgb(38, 50, 56); transform-origin: 271.445px 255.777px;" id="el5rxkri6sfn8" class="animable"></path>
                    <polygon points="279.13 209.38 262.87 214.7 262.79 209.37 279.13 209.38" style="fill: rgb(38, 50, 56); transform-origin: 270.96px 212.035px;" id="el4wk5igh7dy8" class="animable"></polygon>
                    <path d="M262.87,215.2a.5.5,0,0,1-.29-.09.49.49,0,0,1-.21-.4l-.08-5.34a.5.5,0,0,1,.14-.35.51.51,0,0,1,.36-.15h16.34a.51.51,0,0,1,.5.42.5.5,0,0,1-.34.55L263,215.18Zm.43-5.33.06,4.14L276,209.88Z" style="fill: rgb(38, 50, 56); transform-origin: 270.963px 212.035px;" id="elea41dms6ye" class="animable"></path>
                    <path d="M283.13,163.34s.71,8.21.71,15.34-.71,31.4-.71,31.4l-20.34-.71s2.14-15,4.28-20.7S283.13,163.34,283.13,163.34Z" style="fill: #579EE0; transform-origin: 273.315px 186.71px;" id="eleykrvzms90e" class="animable"></path>
                    <path d="M283.13,210.58h0l-20.34-.71a.52.52,0,0,1-.48-.57c.09-.62,2.18-15.11,4.31-20.8s15.55-24.64,16.12-25.45a.49.49,0,0,1,.54-.19.48.48,0,0,1,.36.44c0,.08.72,8.31.72,15.38s-.71,31.17-.71,31.41a.5.5,0,0,1-.16.35A.49.49,0,0,1,283.13,210.58Zm-19.76-1.69,19.27.67c.1-3.51.7-24.4.7-30.88,0-5.31-.4-11.28-.6-13.92-3,4.26-13.4,19.29-15.2,24.09C265.67,193.83,263.78,206.13,263.37,208.89Z" style="fill: rgb(38, 50, 56); transform-origin: 273.334px 186.71px;" id="elqpc4coi0mn8" class="animable"></path>
                    <path d="M274.11,428.83s8.72,9.74,11.8,12.05,13.33,5.89,13.33,7.69-1.8,4.1-1.8,4.1-12.56-.51-20.76-2.31-15.9-3.33-15.9-3.33S249,445,248.22,444s1.28-11.79,1.28-11.79Z" style="fill: rgb(255, 255, 255); transform-origin: 273.642px 440.75px;" id="el74h8hbtq78" class="animable"></path>
                    <path d="M297.44,453.17h0c-.12,0-12.7-.54-20.85-2.32s-15.81-3.32-15.89-3.33c-3.59-.63-12.06-2.2-12.86-3.27s.56-8.88,1.19-12.18a.5.5,0,0,1,.42-.41l24.62-3.33a.51.51,0,0,1,.43.16c.09.1,8.72,9.73,11.73,12a42.09,42.09,0,0,0,6.09,3.22c4.75,2.23,7.44,3.56,7.44,4.88,0,1.94-1.83,4.31-1.9,4.4A.49.49,0,0,1,297.44,453.17Zm-47.51-20.56c-.93,4.94-1.66,10.35-1.3,11.06.57.55,6.68,1.9,12.24,2.87.09,0,7.8,1.56,15.91,3.33,7.42,1.62,18.56,2.2,20.42,2.29a7.71,7.71,0,0,0,1.54-3.59c-.06-.78-4.32-2.78-6.87-4a42.69,42.69,0,0,1-6.26-3.31c-2.88-2.16-10.4-10.49-11.69-11.92Z" style="fill: rgb(38, 50, 56); transform-origin: 273.677px 440.749px;" id="elgqudsdh4f09" class="animable"></path>
                    <path d="M298.76,450.44l-.45-.2s-1.05,0-10.23-.83a66.76,66.76,0,0,1-23.59-6.06,51.91,51.91,0,0,0-16.16-3.9c-.28,2.18-.41,4.1-.11,4.5.77,1,12.56,3.08,12.56,3.08s7.69,1.54,15.9,3.33,20.76,2.31,20.76,2.31A12,12,0,0,0,298.76,450.44Z" style="fill: rgb(255, 255, 255); transform-origin: 273.404px 446.06px;" id="el5g54dtrs2mf" class="animable"></path>
                    <path d="M297.44,453.17h0c-.12,0-12.7-.54-20.85-2.32s-15.81-3.32-15.89-3.33c-3.59-.63-12.06-2.2-12.86-3.27-.27-.36-.45-1.19,0-4.86a.5.5,0,0,1,.54-.44,52.16,52.16,0,0,1,16.33,3.95,66.16,66.16,0,0,0,23.42,6c8.95.81,10.14.83,10.19.83a.65.65,0,0,1,.2,0l.45.2a.45.45,0,0,1,.26.28.5.5,0,0,1,0,.38,12.6,12.6,0,0,1-1.38,2.33A.49.49,0,0,1,297.44,453.17ZM248.76,440c-.36,3-.17,3.59-.13,3.68.57.55,6.68,1.9,12.24,2.87.09,0,7.8,1.56,15.91,3.33,7.41,1.62,18.56,2.2,20.42,2.29a14.18,14.18,0,0,0,.86-1.43c-.64,0-2.87-.17-10-.83a66.73,66.73,0,0,1-23.74-6.09A50.61,50.61,0,0,0,248.76,440Z" style="fill: rgb(38, 50, 56); transform-origin: 273.417px 446.059px;" id="eljqib56m1fc" class="animable"></path>
                    <path d="M193.61,429.34l9,16.66,10,10a2.64,2.64,0,0,1,.26,3.33c-.77,1.29-4.36,1.8-8.2,1.29S188,456.77,185.41,455,169,443.44,168,441.64s1.53-6.92,1.53-6.92Z" style="fill: rgb(255, 255, 255); transform-origin: 190.554px 445.078px;" id="elxevi4rrwpb" class="animable"></path>
                    <path d="M207.54,461.31a22.45,22.45,0,0,1-3-.2c-3.58-.48-16.73-3.82-19.45-5.73-3.86-2.7-16.53-11.65-17.58-13.49s1.25-6.84,1.53-7.39a.5.5,0,0,1,.33-.27l24.1-5.38a.5.5,0,0,1,.55.25L203,445.7l9.95,9.95a3.14,3.14,0,0,1,.33,3.94C212.53,460.82,210.13,461.31,207.54,461.31Zm-37.68-26.15c-.93,1.92-2.08,5.14-1.45,6.24s9.19,7.5,17.29,13.17c2.42,1.69,15.14,5,19,5.55,4.06.54,7.16-.12,7.71-1a2.18,2.18,0,0,0-.18-2.73l-10-10-.08-.12-8.8-16.33Z" style="fill: rgb(38, 50, 56); transform-origin: 190.531px 445.074px;" id="elwpale3ptnv" class="animable"></path>
                    <path d="M212.84,459.33c-4.49.63-12.05-1-25.14-7.93a76.71,76.71,0,0,1-19-14.79c-.64,1.65-1.33,3.95-.71,5,1,1.8,14.87,11.54,17.43,13.34s15.38,5.12,19.23,5.64S212.07,460.62,212.84,459.33Z" style="fill: rgb(255, 255, 255); transform-origin: 190.294px 448.702px;" id="eluy3021ovov" class="animable"></path>
                    <path d="M207.54,461.31a22.45,22.45,0,0,1-3-.2c-3.58-.48-16.73-3.82-19.45-5.73-3.86-2.7-16.53-11.65-17.58-13.49-.57-1-.34-2.83.68-5.46a.52.52,0,0,1,.37-.31.49.49,0,0,1,.46.15A77.07,77.07,0,0,0,187.94,451c11.25,6,19.61,8.6,24.83,7.88a.53.53,0,0,1,.49.22.51.51,0,0,1,0,.53C212.53,460.82,210.13,461.31,207.54,461.31Zm-38.66-23.77c-.65,1.86-.82,3.24-.47,3.86.7,1.23,9.19,7.5,17.29,13.17,2.42,1.69,15.14,5,19,5.55a16.35,16.35,0,0,0,6.1-.17c-5.44-.06-13.27-2.78-23.33-8.11A77.51,77.51,0,0,1,168.88,437.54Z" style="fill: rgb(38, 50, 56); transform-origin: 190.27px 448.71px;" id="elyxo8jbpnmyo" class="animable"></path>
                    <path d="M198.74,257.83l3.08,87.68s-13.59,27.17-16.92,39-14.62,47.43-14.62,47.43-2.82,4.36-1.79,4.87,1.28.26,6.41-1,19.23-3.85,19.23-3.85,1.53-1.54,1.79-5.13-.77-3.33-.77-6.66,36.92-72.81,37.17-75.37,2.82-50,2.82-50l6.67-2.82S258.22,344,258,345.25s-2.56,27.94-3.33,35.89S249,436.26,249,436.26s4.87.26,7.43-.51,20.26-5.39,20.26-5.39.77-3.33-.77-5.64-2.82-4.1-2.57-5.64,12.57-68.7,12.05-73.32-12.3-76.4-12.3-76.4l-3.85-13.84s-3.84,2-15.89,3.33-45.38,2.31-48.46,2.31S198.74,257.83,198.74,257.83Z" style="fill: rgb(158, 158, 158); transform-origin: 226.84px 346.289px;" id="elx55un3x6gdg" class="animable"></path>
                    <path d="M169.39,437.52a2.39,2.39,0,0,1-1.13-.3.89.89,0,0,1-.45-.57c-.32-1.18,1.41-4,2-5,.54-1.71,11.36-35.94,14.59-47.35s15.93-37,16.89-38.94l-3.07-87.56a.5.5,0,0,1,.87-.35s3,3.17,5.78,3.17c3,0,36.39-1,48.4-2.3,11.76-1.25,15.68-3.26,15.72-3.28a.5.5,0,0,1,.43,0,.49.49,0,0,1,.28.33l3.85,13.84c.49,3,11.81,71.9,12.32,76.48.31,2.76-3.58,26.53-11.55,70.64-.29,1.65-.47,2.64-.5,2.82-.21,1.25.86,2.85,2.21,4.87l.27.41c1.64,2.46.88,5.88.84,6a.5.5,0,0,1-.36.37c-.17,0-17.71,4.62-20.23,5.38s-7.41.54-7.61.53a.5.5,0,0,1-.47-.55c0-.47,4.88-47.26,5.64-55.12.3-3,.82-8.88,1.37-15,.89-9.91,1.81-20.16,2-21-.05-1.5-9.51-32-16-52.55l-5.87,2.48c-.24,4.46-2.56,47.24-2.81,49.71-.11,1.16-5.94,12.58-15.43,31.13-9.67,18.88-21.71,42.38-21.74,44.19a9.28,9.28,0,0,0,.41,2.92,9.3,9.3,0,0,1,.36,3.78c-.27,3.73-1.87,5.38-1.94,5.45a.46.46,0,0,1-.27.13c-.14,0-14.14,2.58-19.19,3.84l-2.49.64A14.93,14.93,0,0,1,169.39,437.52ZM199.28,259l3,86.45a.53.53,0,0,1-.06.24c-.13.27-13.6,27.27-16.88,38.88s-14.51,47.09-14.62,47.44a.23.23,0,0,1-.06.12c-1.18,1.84-2.08,3.81-1.93,4.22.57.25.71.23,3.51-.49l2.5-.64c4.77-1.19,17.45-3.52,19.08-3.82a10.25,10.25,0,0,0,1.24-8.14,10.17,10.17,0,0,1-.45-3.19c0-1.85,8.65-18.88,21.85-44.65,7.44-14.54,15.14-29.58,15.33-30.78.25-2.52,2.79-49.49,2.81-50a.53.53,0,0,1,.31-.44l6.67-2.82a.51.51,0,0,1,.4,0,.53.53,0,0,1,.27.3c3.86,12.24,16.42,52.27,16.16,53.58-.15.76-1.11,11.44-2,20.87-.54,6.09-1.07,11.91-1.36,15-.72,7.4-5,49.37-5.59,54.59a26.28,26.28,0,0,0,6.74-.51c2.39-.72,17.53-4.67,20-5.31a7.38,7.38,0,0,0-.75-5l-.27-.4c-1.48-2.21-2.64-4-2.37-5.6l.51-2.82c9.9-54.83,11.74-68.53,11.54-70.36-.51-4.55-12.19-75.66-12.31-76.37l-3.67-13.23c-1.45.59-5.87,2.1-15.52,3.13-12,1.28-45.5,2.31-48.51,2.31C202.65,261.66,200.47,260.07,199.28,259Z" style="fill: rgb(38, 50, 56); transform-origin: 226.829px 346.256px;" id="eloir8wczr5a" class="animable"></path>
                    <path d="M253.68,432.86a.48.48,0,0,1-.32-.11.5.5,0,0,1-.07-.7l2.78-3.4,1.29-16.77a.48.48,0,0,1,.53-.46.49.49,0,0,1,.46.53l-1.29,16.93a.5.5,0,0,1-.12.28l-2.87,3.52A.51.51,0,0,1,253.68,432.86Z" style="fill: rgb(38, 50, 56); transform-origin: 255.765px 422.139px;" id="elo1j0r5c9luc" class="animable"></path>
                    <path d="M258.25,407.3h0a.5.5,0,0,1-.46-.54l4.05-52.9a1.14,1.14,0,0,1-.26-.85c.15-1.41,3.09-3.1,4.31-3.74L255.78,322a.51.51,0,0,1,.3-.64.5.5,0,0,1,.64.3l10.22,27.72a.5.5,0,0,1-.24.62c-1.95,1-4.09,2.45-4.16,3.16,0,0,0,.08.09.16a.47.47,0,0,1,.18.43l-4.07,53.13A.5.5,0,0,1,258.25,407.3Z" style="fill: rgb(38, 50, 56); transform-origin: 261.362px 364.315px;" id="elk8tw9ebfbf" class="animable"></path>
                    <path d="M254.27,316.91a.48.48,0,0,1-.47-.33l-2.19-5.93a.5.5,0,0,1,.3-.64.51.51,0,0,1,.64.3l2.18,5.93a.49.49,0,0,1-.29.64Z" style="fill: rgb(38, 50, 56); transform-origin: 253.172px 313.447px;" id="elp4izowxwqx" class="animable"></path>
                    <path d="M202.07,287a.51.51,0,0,1-.31-.11.5.5,0,0,1-.08-.7c6.28-7.79,10.13-20,10.17-20.09a.51.51,0,0,1,.63-.33.49.49,0,0,1,.32.63c0,.12-3.94,12.49-10.34,20.41A.48.48,0,0,1,202.07,287Z" style="fill: rgb(38, 50, 56); transform-origin: 207.2px 276.374px;" id="elsammck8sri" class="animable"></path>
                    <path d="M176.44,432.92a.41.41,0,0,1-.16,0,.5.5,0,0,1-.32-.63,22.4,22.4,0,0,1,1.39-2.93,69.91,69.91,0,0,0,4.29-9.69.5.5,0,0,1,.63-.31.51.51,0,0,1,.31.64,69,69,0,0,1-4.35,9.82,22.52,22.52,0,0,0-1.32,2.78A.5.5,0,0,1,176.44,432.92Z" style="fill: rgb(38, 50, 56); transform-origin: 179.271px 426.131px;" id="ellcwn48bsz2l" class="animable"></path>
                    <path d="M183.83,415l-.16,0a.49.49,0,0,1-.31-.63c4.4-13.19,21.48-59.64,22.78-63.18a10.68,10.68,0,0,1-1-3.57,2,2,0,0,1,.56-1.79,2.94,2.94,0,0,1,2.07-.61c.27-2.18,1.24-11.47-.31-19.87a.5.5,0,0,1,.4-.58.51.51,0,0,1,.58.4c1.79,9.71.28,20.56.26,20.67a.5.5,0,0,1-.2.34.47.47,0,0,1-.38.08,2.43,2.43,0,0,0-1.73.3,1,1,0,0,0-.25.95,9.12,9.12,0,0,0,1,3.39.54.54,0,0,1,0,.43c-.19.49-18.3,49.72-22.85,63.36A.5.5,0,0,1,183.83,415Z" style="fill: rgb(38, 50, 56); transform-origin: 196.323px 369.882px;" id="el8ofgd4a5h2" class="animable"></path>
                    <path d="M207.28,320.94a.51.51,0,0,1-.5-.44c-1.92-15.46-4.92-53.79-4.95-54.17a.5.5,0,0,1,.46-.54.49.49,0,0,1,.54.46c0,.38,3,38.69,4.94,54.13a.5.5,0,0,1-.43.56Z" style="fill: rgb(38, 50, 56); transform-origin: 204.801px 293.364px;" id="elr82actiem7p" class="animable"></path>
                    <path d="M230,283.2a.47.47,0,0,1-.28-.09l-14.87-10a.5.5,0,0,1-.14-.69.51.51,0,0,1,.7-.14l14.87,10a.49.49,0,0,1,.13.69A.48.48,0,0,1,230,283.2Z" style="fill: rgb(38, 50, 56); transform-origin: 222.564px 277.699px;" id="el8dv1xh8a2ga" class="animable"></path>
                    <path d="M226.94,284a.5.5,0,0,1-.31-.1l-5.89-4.62a.5.5,0,1,1,.61-.78l5.9,4.61a.5.5,0,0,1,.08.7A.47.47,0,0,1,226.94,284Z" style="fill: rgb(38, 50, 56); transform-origin: 223.964px 281.174px;" id="el66jk9ff7dx6" class="animable"></path>
                    <path d="M253.86,284a.48.48,0,0,1-.32-.11.5.5,0,0,1-.07-.7l11.29-13.59a.5.5,0,1,1,.76.64l-11.28,13.58A.48.48,0,0,1,253.86,284Z" style="fill: rgb(38, 50, 56); transform-origin: 259.517px 276.689px;" id="elh0fsp8gweoq" class="animable"></path>
                    <polygon points="241.81 291.93 247.71 288.59 244.08 298.64 241.81 291.93" style="fill: rgb(38, 50, 56); transform-origin: 244.76px 293.615px;" id="elqi33790l83" class="animable"></polygon>
                    <path d="M244.08,299.15h0a.5.5,0,0,1-.47-.34l-2.27-6.73a.5.5,0,0,1,.22-.59l5.9-3.33a.48.48,0,0,1,.57,0,.5.5,0,0,1,.15.55l-3.63,10.06A.51.51,0,0,1,244.08,299.15Zm-1.66-7,1.68,5,2.68-7.44Z" style="fill: rgb(38, 50, 56); transform-origin: 244.761px 293.608px;" id="el0b2fj6nps48i" class="animable"></path>
                    <path d="M239.76,290.37a.5.5,0,0,1-.5-.44l-3.07-25.12a.5.5,0,0,1,.43-.56.5.5,0,0,1,.56.44l3.08,25.12a.51.51,0,0,1-.44.56Z" style="fill: rgb(38, 50, 56); transform-origin: 238.224px 277.308px;" id="elk54ldm5ibk" class="animable"></path>
                    <path d="M240,284.73a.5.5,0,0,1-.27-.92l4.33-2.64-2.76-15.05a.5.5,0,1,1,1-.18l2.82,15.38a.49.49,0,0,1-.23.52l-4.61,2.82A.54.54,0,0,1,240,284.73Z" style="fill: rgb(38, 50, 56); transform-origin: 242.316px 275.126px;" id="elizcpaa3168" class="animable"></path>
                    <path d="M245.43,137.48c-6.84-4.83-20.17-2-27.12,1.45-12.37,6.12-17.76,19.46-19.71,32.38-4,26.25-2.92,52.73-.63,79.08l1,11.8s8.95,1,26.66,2.3a142.64,142.64,0,0,0,36.66-2.56s6.67-1.28,9.23-5.38q-2.12-7.8-4.16-15.6c-5-19-4.88-33.71,6-50.68,4.41-6.87,9.06-13.32,10.33-21.57,1-8.2-3.57-25.69-14.62-25.49C268.05,143.23,250.41,141,245.43,137.48Z" style="fill: #579EE0; transform-origin: 239.874px 199.824px;" id="el3jidzz6kfty" class="animable"></path>
                    <path d="M233.93,265.29c-2.72,0-5.51-.09-8.31-.3-17.51-1.31-26.59-2.3-26.68-2.31a.48.48,0,0,1-.44-.45c-1-11.81-1-11.81-1-11.84-2-23.48-3.57-51.28.64-79.16,1.7-11.27,6.55-26.11,20-32.75,7.24-3.58,20.59-6.38,27.63-1.4h0c4.8,3.39,22.17,5.64,23.38,5.63a11.11,11.11,0,0,1,8.63,4.07c5,5.53,7.26,15.72,6.5,22-1.16,7.53-5,13.44-9.06,19.7l-1.35,2.08c-11.28,17.58-10.53,32.81-5.95,50.28,1.48,5.62,2.84,10.72,4.16,15.6a.45.45,0,0,1-.06.39c-2.65,4.24-9.28,5.56-9.56,5.61A148.84,148.84,0,0,1,233.93,265.29Zm-34.47-3.56c1.94.21,10.81,1.11,26.24,2.26,18.46,1.39,36.33-2.51,36.51-2.55s6.3-1.25,8.8-5c-1.31-4.81-2.65-9.85-4.1-15.38-4.66-17.73-5.4-33.2,6.07-51.08l1.35-2.09c4-6.16,7.78-12,8.91-19.29.63-5.25-1.18-15.54-6.25-21.17a10.2,10.2,0,0,0-7.87-3.74h0c-1.41,0-18.9-2.25-24-5.82h0c-6.63-4.68-19.8-1.88-26.61,1.49-13,6.45-17.77,21-19.43,32-4.19,27.78-2.67,55.51-.63,79C198.47,250.41,199.28,259.66,199.46,261.73Z" style="fill: rgb(38, 50, 56); transform-origin: 239.951px 199.839px;" id="ellwra5i6y64" class="animable"></path>
                    <path d="M248.26,177.05a.49.49,0,0,1-.41-.21,24.43,24.43,0,0,1-1.89-3.16.51.51,0,0,1,.22-.67.49.49,0,0,1,.67.22,24.26,24.26,0,0,0,1.81,3,.51.51,0,0,1-.11.7A.52.52,0,0,1,248.26,177.05Z" style="fill: rgb(38, 50, 56); transform-origin: 247.331px 175.002px;" id="el3stpbkh27vo" class="animable"></path>
                    <path d="M245,170.88a.51.51,0,0,1-.47-.32c-4.11-10.43-4.95-24.66-5-24.8a.5.5,0,1,1,1-.06c0,.14.84,14.21,4.89,24.5a.49.49,0,0,1-.28.64A.39.39,0,0,1,245,170.88Z" style="fill: rgb(38, 50, 56); transform-origin: 242.492px 158.054px;" id="elmn8lhfd8cq" class="animable"></path>
                    <path d="M257.73,167.92a.48.48,0,0,1-.42-.23.5.5,0,0,1,.15-.69c4.19-2.62,8.89-8.27,8.94-8.33a.5.5,0,0,1,.7-.07.52.52,0,0,1,.07.71c-.2.23-4.85,5.84-9.17,8.54A.54.54,0,0,1,257.73,167.92Z" style="fill: rgb(38, 50, 56); transform-origin: 262.255px 163.204px;" id="elhxaplqsfhct" class="animable"></path>
                    <path d="M265.67,183.7h-.11a.5.5,0,0,1-.38-.6l4.24-19.54a.5.5,0,1,1,1,.22l-4.25,19.54A.49.49,0,0,1,265.67,183.7Z" style="fill: rgb(38, 50, 56); transform-origin: 267.8px 173.429px;" id="elm3neodjh2hp" class="animable"></path>
                    <path d="M261.29,238.84a.51.51,0,0,1-.4-.2,33.65,33.65,0,0,1-2.36-3.87.49.49,0,0,1,.2-.67.5.5,0,0,1,.68.2,31.85,31.85,0,0,0,2.29,3.75.51.51,0,0,1-.11.7A.53.53,0,0,1,261.29,238.84Z" style="fill: rgb(38, 50, 56); transform-origin: 260.131px 236.439px;" id="el90wv9evyuqn" class="animable"></path>
                    <path d="M253.72,237.13a.5.5,0,0,1-.49-.39c-2.56-11.05-4.74-27.69-4.76-27.86a.5.5,0,0,1,.43-.56.5.5,0,0,1,.56.43c0,.17,2.2,16.77,4.75,27.77a.5.5,0,0,1-.38.6Z" style="fill: rgb(38, 50, 56); transform-origin: 251.344px 222.723px;" id="eldf3y2rpywj" class="animable"></path>
                    <path d="M259.92,230.26a.5.5,0,0,1-.4-.19c-3.06-3.87-8.85-17.41-9.09-18a.5.5,0,1,1,.92-.4c.05.14,6,14,9,17.76a.5.5,0,0,1-.08.7A.49.49,0,0,1,259.92,230.26Z" style="fill: rgb(38, 50, 56); transform-origin: 255.423px 220.814px;" id="eluyap5hkpfve" class="animable"></path>
                    <path d="M246.77,128.75l-3.52,10.92s5,19.76,6.18,21.88,4.43,1.86,6.43.48,10.79-10.42,10.79-10.42l4.44-6.18a84.67,84.67,0,0,1-11.38-2.08C253.7,141.79,246.77,128.75,246.77,128.75Z" style="fill: rgb(255, 255, 255); transform-origin: 257.17px 145.927px;" id="eldosmic2z8c8" class="animable"></path>
                    <path d="M252.45,163.6a5.19,5.19,0,0,1-1.12-.12A3.49,3.49,0,0,1,249,161.8c-1.2-2.16-6-21.2-6.23-22a.53.53,0,0,1,0-.28l3.53-10.92a.5.5,0,0,1,.92-.08c.06.13,6.89,12.87,12.62,14.35a84.41,84.41,0,0,0,11.3,2.07.52.52,0,0,1,.41.29.53.53,0,0,1-.05.5l-4.45,6.18c-.41.43-8.9,9.14-10.91,10.54A6.63,6.63,0,0,1,252.45,163.6Zm-8.68-23.91c1.73,6.85,5.19,20,6.1,21.62a2.48,2.48,0,0,0,1.68,1.2,5.44,5.44,0,0,0,4-.89c1.94-1.34,10.63-10.27,10.72-10.36l3.9-5.43a86.43,86.43,0,0,1-10.6-2c-5.21-1.35-10.9-10.68-12.69-13.83Z" style="fill: rgb(38, 50, 56); transform-origin: 257.171px 145.926px;" id="eltacb8vxiqug" class="animable"></path>
                    <path d="M265.65,144.63c-1.76-.31-3.81-.73-5.94-1.28-6-1.56-12.94-14.6-12.94-14.6l-3.52,10.92s.16.66.44,1.73l3.1,10.78,20.81-4.1Z" style="fill: rgb(38, 50, 56); transform-origin: 255.425px 140.465px;" id="eltn7lg80fzxt" class="animable"></path>
                    <path d="M246.79,152.68a.5.5,0,0,1-.48-.37l-3.1-10.77-.45-1.75a.53.53,0,0,1,0-.28l3.53-10.92a.5.5,0,0,1,.92-.08c.06.13,6.89,12.87,12.62,14.35,1.85.48,3.83.91,5.89,1.28a.51.51,0,0,1,.35.25l1.95,3.44a.5.5,0,0,1,0,.46.51.51,0,0,1-.36.28l-20.8,4.1Zm-3-13,.4,1.6,3,10.32,19.68-3.88-1.49-2.64c-2-.36-3.94-.78-5.74-1.25-5.21-1.35-10.9-10.68-12.69-13.83Z" style="fill: rgb(38, 50, 56); transform-origin: 255.409px 140.461px;" id="el21wefiuao3" class="animable"></path>
                    <path d="M204.74,203.28s-.92,14.75,0,20.29,6,63.16,6,63.16-3.69,5.54-3.69,9.23v7.83s-10.47,2.38-9.24,3.78,3.86.7,3.86.7l-3.86,1.23s-3.69-1.93-4.21-.17,4,3.68,4,3.68l2.64.88s-5.27.18-5.09,1.76,1.93,1.4,3.51,1.4a50.55,50.55,0,0,0,5.09-.53s-4.92,1.41-4.22,2.64,7.55-.53,7.55-.53a17.61,17.61,0,0,0,3.86-1.58c.88-.7,7.2-9.3,7.9-10s1.93-7.9,2.11-13a55.7,55.7,0,0,0-.53-9.48l3-63.2L225,206.11Z" style="fill: rgb(255, 255, 255); transform-origin: 209.279px 261.438px;" id="elsel4ym8vmfd" class="animable"></path>
                    <path d="M201.28,320.09c-1.05,0-1.86-.18-2.15-.68a1,1,0,0,1-.06-.89,2.66,2.66,0,0,1,1.06-1c-.54,0-1,.08-1.44.08h-.43c-1.49,0-3.37,0-3.58-1.85a1.21,1.21,0,0,1,.3-.93,5.3,5.3,0,0,1,2.9-1.15l-.4-.13c-.87-.37-5-2.23-4.36-4.31a1.43,1.43,0,0,1,.84-.94c1.19-.5,3.23.4,3.89.72l.81-.25a2.91,2.91,0,0,1-1.23-.81.86.86,0,0,1-.18-.84c.47-1.45,6.38-3,9.3-3.66V296c0-3.5,3.07-8.42,3.67-9.35-.31-3.5-5.09-57.66-6-63-.92-5.53-.05-19.8,0-20.4a.54.54,0,0,1,.18-.36.54.54,0,0,1,.39-.1l20.28,2.83a.5.5,0,0,1,.42.54l-1.58,15.28-3,63.11a56.64,56.64,0,0,1,.53,9.52c-.17,4.8-1.33,12.41-2.25,13.33-.27.26-1.61,2-2.9,3.72a79.93,79.93,0,0,1-5,6.32,17.06,17.06,0,0,1-4,1.67A27.37,27.37,0,0,1,201.28,320.09Zm2.5-4.07a.52.52,0,0,1,.49.4.5.5,0,0,1-.36.58c-2,.57-3.87,1.49-3.91,1.91.38.45,3.64.09,7-.76a16.33,16.33,0,0,0,3.67-1.49c.47-.37,3-3.71,4.87-6.15,1.66-2.17,2.69-3.52,3-3.82.55-.66,1.78-7.43,2-12.65a54.9,54.9,0,0,0-.52-9.38.41.41,0,0,1,0-.11l3-63.19,1.53-14.82-19.26-2.69c-.15,2.7-.78,14.82,0,19.64.92,5.48,5.8,60.85,6,63.2a.51.51,0,0,1-.08.32c0,.06-3.6,5.45-3.6,8.95v7.83a.5.5,0,0,1-.39.49c-3.95.9-8.36,2.3-8.92,3,1,1.06,3.28.49,3.3.48a.52.52,0,0,1,.61.34.5.5,0,0,1-.33.62L198,310a.5.5,0,0,1-.38,0c-.88-.46-2.53-1.08-3.24-.78a.43.43,0,0,0-.27.3c-.27.9,2.08,2.37,3.76,3.08l2.59.87a.49.49,0,0,1,.34.54.49.49,0,0,1-.48.43c-1.56.05-4,.41-4.54,1a.21.21,0,0,0-.07.17c.1.89.91,1,2.58,1h.44a49.16,49.16,0,0,0,5-.52Z" style="fill: rgb(38, 50, 56); transform-origin: 209.273px 261.438px;" id="elvon1jae73e" class="animable"></path>
                    <path d="M204.36,213.18l20.3-3.58.36-3.49-20.28-2.83S204.44,208.05,204.36,213.18Z" style="fill: rgb(38, 50, 56); transform-origin: 214.69px 208.23px;" id="el5renz1n9hox" class="animable"></path>
                    <path d="M204.36,213.68a.5.5,0,0,1-.33-.12.49.49,0,0,1-.17-.39c.08-5.08.38-9.87.38-9.92a.54.54,0,0,1,.18-.36.54.54,0,0,1,.39-.1l20.28,2.83a.5.5,0,0,1,.42.54l-.36,3.49a.5.5,0,0,1-.41.44l-20.3,3.58Zm.85-9.83c-.08,1.32-.26,4.89-.34,8.73l19.33-3.41.27-2.63Z" style="fill: rgb(38, 50, 56); transform-origin: 214.686px 208.233px;" id="eld2pjyspjeg8" class="animable"></path>
                    <path d="M201.67,308.77a.5.5,0,0,1,0-1l6.17-.52a11.71,11.71,0,0,0,2.57-2.59.5.5,0,0,1,.69-.15.48.48,0,0,1,.16.68,13.13,13.13,0,0,1-2.94,2.95.46.46,0,0,1-.25.1l-6.32.52Z" style="fill: rgb(38, 50, 56); transform-origin: 206.255px 306.6px;" id="elaoa0cynyhce" class="animable"></path>
                    <path d="M200.27,314.39a.49.49,0,0,1-.49-.4.5.5,0,0,1,.39-.59l7-1.39c.48-.23,4.11-2,5.18-3.65a.49.49,0,0,1,.69-.16.5.5,0,0,1,.15.69c-1.29,2-5.48,4-5.65,4.05l-.11,0-7,1.4Z" style="fill: rgb(38, 50, 56); transform-origin: 206.519px 311.255px;" id="elyi39kql3lmc" class="animable"></path>
                    <path d="M203.78,317a.5.5,0,0,1-.13-1l6-1.55,3.78-3.26a.49.49,0,0,1,.7,0,.51.51,0,0,1,0,.71l-3.86,3.33a.56.56,0,0,1-.2.11L203.9,317Z" style="fill: rgb(38, 50, 56); transform-origin: 208.742px 314.024px;" id="elkmg1vzr6qe7" class="animable"></path>
                    <path d="M213.72,148s-8.33,9.21-9.21,17.54-2.19,41.68-2.19,41.68l26.32,2.19,4.82-26.32s3.51-5.7,3.07-14.91" style="fill: #579EE0; transform-origin: 219.444px 178.705px;" id="elixuknk6yafh" class="animable"></path>
                    <path d="M228.64,209.91h0l-26.32-2.19a.5.5,0,0,1-.46-.52c0-.33,1.32-33.45,2.19-41.71s9-17.45,9.34-17.83a.5.5,0,0,1,.71,0,.49.49,0,0,1,0,.7c-.08.09-8.23,9.19-9.08,17.27-.81,7.68-2,37-2.17,41.16l25.39,2.12L233,183a.36.36,0,0,1,.07-.17c0-.06,3.42-5.7,3-14.63a.5.5,0,0,1,1,0c.42,8.77-2.64,14.35-3.09,15.12l-4.81,26.23A.49.49,0,0,1,228.64,209.91Z" style="fill: rgb(38, 50, 56); transform-origin: 219.485px 178.713px;" id="elc4cc9l8v1r" class="animable"></path>
                    <circle cx="273.91" cy="93.53" r="57.77" style="fill: rgb(255, 255, 255); transform-origin: 273.91px 93.53px;" id="elkg5kicohij" class="animable"></circle>
                    <path d="M273.91,151.8a58.27,58.27,0,1,1,58.26-58.27A58.34,58.34,0,0,1,273.91,151.8Zm0-115.53a57.27,57.27,0,1,0,57.26,57.26A57.33,57.33,0,0,0,273.91,36.27Z" style="fill: rgb(38, 50, 56); transform-origin: 273.9px 93.53px;" id="elguqs8dr6ool" class="animable"></path>
                    <path d="M249.5,120.75a1.47,1.47,0,0,1-1.06-.44,1.51,1.51,0,0,1,0-2.12l23.95-23.94a1.5,1.5,0,0,1,2.12,2.12l-23.95,23.94A1.45,1.45,0,0,1,249.5,120.75Z" style="fill: rgb(38, 50, 56); transform-origin: 261.459px 107.299px;" id="elqx55p016uy" class="animable"></path>
                    <path d="M273.45,120.75a1.47,1.47,0,0,1-1.06-.44L248.44,96.37a1.51,1.51,0,0,1,0-2.12,1.49,1.49,0,0,1,2.12,0l23.95,23.94a1.49,1.49,0,0,1,0,2.12A1.47,1.47,0,0,1,273.45,120.75Z" style="fill: rgb(38, 50, 56); transform-origin: 261.479px 107.279px;" id="el0jbm045i13om" class="animable"></path>
                    <path d="M300.16,120.75a1.52,1.52,0,0,1-.92-.31,1.5,1.5,0,0,1-.27-2.1l18.42-24a1.5,1.5,0,0,1,2.38,1.83l-18.42,24A1.51,1.51,0,0,1,300.16,120.75Z" style="fill: rgb(38, 50, 56); transform-origin: 309.369px 107.253px;" id="elu7sec236u7o" class="animable"></path>
                    <path d="M318.58,120.75a1.5,1.5,0,0,1-1.19-.58L299,96.22a1.5,1.5,0,0,1,2.38-1.83l18.42,24a1.5,1.5,0,0,1-.28,2.1A1.47,1.47,0,0,1,318.58,120.75Z" style="fill: rgb(38, 50, 56); transform-origin: 309.398px 107.279px;" id="eluy6jmz9e2fr" class="animable"></path>
                    <path d="M293.94,140.9c0,4.83-5.95,4.15-12.43,4.15s-11.05.68-11.05-4.15,5.25-8.75,11.74-8.75S293.94,136.07,293.94,140.9Z" style="fill: rgb(38, 50, 56); transform-origin: 282.2px 138.616px;" id="el3ca3n1qnc6j" class="animable"></path>
                    <path d="M285.69,145.58l-2,0h-4.32c-3.76.05-6.72.09-8.27-1.45A4.24,4.24,0,0,1,270,140.9c0-5.1,5.49-9.25,12.24-9.25s12.24,4.15,12.24,9.25a4,4,0,0,1-1.11,3C291.82,145.37,289,145.58,285.69,145.58Zm-3.49-12.93c-6.2,0-11.24,3.7-11.24,8.25a3.36,3.36,0,0,0,.82,2.5c1.26,1.24,4,1.21,7.56,1.16h4.34c3.83.05,7.44.09,8.94-1.39a3,3,0,0,0,.82-2.27C293.44,136.35,288.4,132.65,282.2,132.65Z" style="fill: rgb(38, 50, 56); transform-origin: 282.235px 138.623px;" id="elnwkczmtsht" class="animable"></path>
                    <path d="M271.5,144.39v7.73a1.64,1.64,0,0,0,1.65,1.64h0a1.63,1.63,0,0,0,1.64-1.64v-4.44h1.15a2.15,2.15,0,0,0,2.15-2.15v-1.14A26.15,26.15,0,0,1,271.5,144.39Z" style="fill: rgb(255, 255, 255); transform-origin: 274.795px 149.075px;" id="eljdwb6hne7ol" class="animable"></path>
                    <path d="M273.15,154.26a2.14,2.14,0,0,1-2.15-2.14v-7.73a.53.53,0,0,1,.18-.39.49.49,0,0,1,.41-.1,25.36,25.36,0,0,0,6.43,0,.52.52,0,0,1,.4.12.5.5,0,0,1,.17.38v1.14a2.65,2.65,0,0,1-2.65,2.65h-.65v3.94A2.14,2.14,0,0,1,273.15,154.26ZM272,145v7.15a1.15,1.15,0,0,0,2.29,0v-4.44a.5.5,0,0,1,.5-.5h1.15a1.65,1.65,0,0,0,1.65-1.65V145A26,26,0,0,1,272,145Z" style="fill: rgb(38, 50, 56); transform-origin: 274.795px 149.075px;" id="el3etvsdlw6yo" class="animable"></path>
                    <path d="M244.8,85.83a2,2,0,0,1-.74-3.86l26-10.38a2,2,0,1,1,1.49,3.71l-26,10.39A2.21,2.21,0,0,1,244.8,85.83Z" style="fill: rgb(38, 50, 56); transform-origin: 257.829px 78.6258px;" id="elur3yjwgw8n" class="animable"></path>
                    <path d="M319.58,86.87a2,2,0,0,1-.95-.24L297.34,75.21a2,2,0,0,1,1.89-3.53L320.52,83.1a2,2,0,0,1-.94,3.77Z" style="fill: rgb(38, 50, 56); transform-origin: 308.937px 79.1569px;" id="elv1jfyp19nxj" class="animable"></path>
                    <path d="M350.35,121.7a5.52,5.52,0,1,1,5.51-5.52A5.52,5.52,0,0,1,350.35,121.7Zm0-10a4.52,4.52,0,1,0,4.51,4.51A4.51,4.51,0,0,0,350.35,111.67Z" style="fill: rgb(38, 50, 56); transform-origin: 350.34px 116.18px;" id="elwd4voq674a" class="animable"></path>
                    <path d="M344.59,95.63a3.26,3.26,0,1,1,3.25-3.26A3.26,3.26,0,0,1,344.59,95.63Zm0-5.52a2.26,2.26,0,1,0,2.25,2.26A2.26,2.26,0,0,0,344.59,90.11Z" style="fill: rgb(38, 50, 56); transform-origin: 344.58px 92.37px;" id="elxyv596zm5n" class="animable"></path>
                    <path d="M184.92,123.7a4,4,0,1,1,4-4A4,4,0,0,1,184.92,123.7Zm0-7a3,3,0,1,0,3,3A3,3,0,0,0,184.92,116.68Z" style="fill: rgb(38, 50, 56); transform-origin: 184.92px 119.7px;" id="el1sisxo46jbn" class="animable"></path>
                    <path d="M199.14,97.92a.5.5,0,0,1-.5-.5V94a.5.5,0,0,1,.5-.5.5.5,0,0,1,.5.5v3.46A.5.5,0,0,1,199.14,97.92Z" style="fill: rgb(38, 50, 56); transform-origin: 199.14px 95.71px;" id="eld6ype6rsxji" class="animable"></path>
                    <path d="M199.14,105.15a.51.51,0,0,1-.5-.5v-3.47a.5.5,0,0,1,.5-.5.5.5,0,0,1,.5.5v3.47A.5.5,0,0,1,199.14,105.15Z" style="fill: rgb(38, 50, 56); transform-origin: 199.14px 102.915px;" id="elbw0l1qc1fph" class="animable"></path>
                    <path d="M204.49,99.8H201a.5.5,0,0,1-.5-.5.5.5,0,0,1,.5-.5h3.47a.5.5,0,0,1,.5.5A.5.5,0,0,1,204.49,99.8Z" style="fill: rgb(38, 50, 56); transform-origin: 202.735px 99.3px;" id="el9wjgtsmkfs5" class="animable"></path>
                    <path d="M197.27,99.8H193.8a.5.5,0,0,1-.5-.5.5.5,0,0,1,.5-.5h3.47a.51.51,0,0,1,.5.5A.5.5,0,0,1,197.27,99.8Z" style="fill: rgb(38, 50, 56); transform-origin: 195.535px 99.3px;" id="el3l80wbesb3h" class="animable"></path>
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
        </div>
    </div>
</body>
</html>