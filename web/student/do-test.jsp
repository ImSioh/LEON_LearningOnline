<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../template/header.jsp" %>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    .main-container {
        padding-top: 56px;
        height: 100vh;
        display: flex;
        justify-content: center;
    }

    #question-paper {
        background-color: gray;
        width: 60%;
        height: 100%;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .main-container.has-paper > .test-info-area {
        width: 40%;
        overflow-y: auto;
    }

    .test-info-area {
        max-width: 1200px;
        width: 80%;
    }

    .main-container:not(.has-paper) #question-paper {
        display: none;
    }

    .remain-time {
        text-align: center;
        font-size: 3rem;
        font-weight: bold;
    }

    .title {
        text-align: center;
        font-size: 1.4rem;
        font-weight: 500;
        margin: 0;
    }

    .question {
        box-shadow: 0 0.25rem 1rem 0 #00000040;
        position: relative;
    }

    .question-order {
        position: absolute;
        margin: 0;
        background-color: #3caea3;
        color: white;
        padding: 0.15rem 0.75rem;
        border-radius: 0.375rem;
        top: -0.7rem;
        left: 1rem;
        font-weight: 500;
    }

    .question-answer-list {
        display: grid;
        margin-top: 1rem;
        gap: 1rem;
    }

    .question-answer {
        border-radius: 0.25rem;
        position: relative;
        height: fit-content;
        transition: all ease 0.2s;
        box-shadow: inset 0 0 0.5rem 0 #00000040;
        background-color: #f8f9fa;
    }

    .question-answer * {
        user-select: none;
        cursor: pointer;
    }

    .answer-order {
        background-color: #f6d55c;
        font-weight: 500;
        position: absolute;
        margin: 0;
        line-height: 2.5rem;
        width: 2.5rem;
        text-align: center;
        border-radius: 50%;
        top: -1.25rem;
        left: 50%;
        transform: translateX(-50%);
        cursor: pointer;
        transition: all ease 0.2s;
        border: 2px solid transparent;
        box-sizing: content-box;
    }

    .question-content {
        white-space: pre-wrap;
        word-break: break-word;
        user-select: none;
    }

    .question .img-resource {
        padding-top: 40%;
        margin-top: 0.5rem;
        border-radius: 0.25rem;
        background-position: center;
        background-size: cover;
    }

    .question p {
        margin: 0;
    }

    .question-nav {
        max-width: 400px;
        min-width: 310px;
        width: 100%;
        display: flex;
        flex-wrap: wrap;
        margin: 0 auto;
    }

    .question-nav > div {
        width: calc(100% / 8);
        height: 0;
        padding-top: calc(100% / 8);
        position: relative;
    }

    .question-nav > div > p {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        box-sizing: content-box;
        line-height: 2rem;
        width: 2rem;
        text-align: center;
        border: 1px solid #00000066;
        cursor: pointer;
    }

    .question-nav > div > p.active {
        background-color: #a8e4deaa;
        border: 1px solid #056766;
    }

    .prev-next-nav {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 1.5rem;
    }

    .question-answer.active > .answer-order {
        border: 2px solid #056766;
    }

    .question-answer.active {
        background-color: #a8e4deaa;
        box-shadow: inset 0 0 0.5rem 0 #05676640;
    }

    .document-resource {
        margin-top: 1rem;
        border-radius: 8px;
        overflow: hidden;
        font-weight: 500;
        cursor: pointer;
        padding: 0.5rem 1rem;
        border: 2px solid rgb(216, 220, 240);
    }

    .document-box {
        margin-top: 1rem;
        border-radius: 8px;
        overflow: hidden;
        border: 2px solid rgb(216, 220, 240);
    }

    .document-item {
        font-weight: 500;
        cursor: pointer;
        padding: 0.5rem 1rem;
        border-top: 1px solid rgb(216, 220, 240);
        position: relative;
    }

    .document-box > a:first-child .document-item {
        border: none;
    }

    .document-box > a {
        text-decoration: none;
        color: black;
    }

    @media only screen and (min-width: 992px) {
        .main-container:not(.has-paper) .question-answer-list {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }
</style>
<div class="main-container">
    <div id="question-paper"></div>
    <div class="test-info-area p-4">
        <div>
            <p class="remain-time text-danger" id="countdown"></p>
            <p class="title">${test.getTitle()}</p>
            <p class="description border rounded-3 bg-light p-3">${test.getDescription()}</p>
        </div>
        <div class="question-nav border rounded-3 bg-light p-3 mb-3" id="quesNav"> </div>
        <div class="prev-next-nav">
            <button id="prev" class="btn btn-outline-secondary w-100 text-center">
                <i class="fa-solid fa-caret-left"></i>
            </button>
            <button id="next" class="btn btn-outline-secondary w-100 text-center">
                <i class="fa-solid fa-caret-right"></i>
            </button>
        </div>
        <div id="quesDetail"></div>
        <button class="btn btn-primary w-100 mt-3 mb-5" id="submit-test">
            Submit
        </button>
    </div>
</div>
<script src="<c:url value="/assets/js/pdf.min.js"/>"></script>
<script src="<c:url value="/assets/js/jszip.min.js"/>"></script>
<script src="<c:url value="/assets/js/docx-preview.min.js"/>"></script>
<script>

    function createElement(element) {
        if (element instanceof HTMLElement) {
            return element;
        }
        const parent = document.createElement(element.tagName);
        mergeObject(element, parent);
        if (Array.isArray(element.children))
            element.children.forEach(child => parent.append(createElement(child)));
        return parent;
    }

    function mergeObject(source, target) {
        Object.entries(source).forEach(attr => {
            if (attr[0] === 'children' || attr[0] === 'tagName')
                return;
            if (attr[0] === 'bind') {
                attr[1][0][attr[1][1]] = target;
            }
            if (Object.prototype.toString.call(attr[1]) === '[object Object]') {
                mergeObject(attr[1], target[attr[0]]);
            } else if (Array.isArray(attr[1]) && typeof target[attr[0]] === 'function') {
                target[attr[0]](...attr[1]);
            } else {
                target[attr[0]] = attr[1];
            }
        });
    }

    async function renderPage(page, parent) {
        const initWidth = Math.min(Math.max(720, parent.clientWidth - 60), questionPaper.clientHeight);
        const scale = (initWidth * 1.5) / page.getViewport({scale: 1}).width;
        const viewport = page.getViewport({scale: scale});
        const canvas = document.createElement('canvas');
        canvas.height = viewport.height;
        canvas.width = viewport.width;
        canvas.style.width = initWidth + 'px';
        const renderContext = {
            canvasContext: canvas.getContext('2d'),
            viewport: viewport
        };
        const renderTask = await page.render(renderContext);
        parent.append(createElement({
            tagName: 'div',
            className: 'd-flex',
            style: 'box-shadow: 0 0 10px rgb(0 0 0 / 50%); margin-top: ' + (page.pageNumber != 1 ? 30 : 0) + 'px;',
            children: [canvas]
        }));
    }

    function renderPdf(data) {
        pdfjsLib.getDocument(data).promise.then(async pdf => {
            const totalPages = pdf.numPages;
            const pdfWrapper = createElement({
                tagName: 'div',
                className: 'd-flex flex-column align-items-center w-100',
                style: 'padding: 30px;'
            });
            questionPaper.append(pdfWrapper);
            for (var i = 1; i <= totalPages; i++) {
                await renderPage(await pdf.getPage(i), pdfWrapper);
            }
        }).catch(reason => {
            console.warn(reason);
        });
    }

    function renderDocx(data) {
        console.log(docx);
        docx.renderAsync(data, questionPaper);
    }

    const questionPaper = document.getElementById('question-paper');
    function numberToLetter(num) {
        if (num <= 26) {
            return String.fromCharCode(64 + num);
        } else {
            let quotient = Math.floor((num - 1) / 26);
            let remainder = (num - 1) % 26 + 1;
            return numberToLetter(quotient) + numberToLetter(remainder);
        }
    }


//-----------------------------------DISPLAY QUESTION ----------------------------------------
    var testObj = "${json}";
    testObj = JSON.parse(testObj);
    var quesDetail = document.getElementById("quesDetail");
    var quesNav = document.getElementById("quesNav");
    var hasPaper = document.querySelector(".main-container");
    var questionElement = [];
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    var quesIndex = 0;
    const rasterType = [
        'image/png',
        'image/jpeg',
        'image/bmp',
        'image/gif',
        'image/tiff',
        'image/webp',
        'image/avif'
    ];

    var endDate = new Date(${endTime});





    testObj.questions.forEach(function (x, indexX) {

        var questionContent = createElement({
            tagName: "div",
            className: "question p-3 pt-4 rounded-3 bg-white mt-4",
            dataset: {
                id: x.questionId
            },
            children: [
                {
                    tagName: "p",
                    className: "question-order user-select-none",
                    textContent: "Question " + (indexX + 1)
                },
                {
                    tagName: "div",
                    className: "question-body",
                    children: [
                        {
                            tagName: "div",
                            className: "question-term",
                            children: (() => {
                                var abc = [];
                                if (x.content) {
                                    abc.push({
                                        tagName: "p",
                                        className: "question-content",
                                        textContent: x.content
                                    });

                                }
                                if (x.resource) {
                                    if (rasterType.includes(x.resource.mimeType)) {
                                        abc.push({
                                            tagName: "div",
                                            className: "img-resource",
                                            style: "background-image: url('" + <c:url value="/"></c:url> + x.resource.url.substring(1) + "');"
                                        });
                                    } else {
                                        abc.push({
                                            tagName: "div",
                                            className: "document-box",
                                            children: [
                                                {
                                                    tagName: "a",
                                                    className: "text-decoration-none text-black text-truncate",
                                                    href: "<c:url value="/"></c:url>" + x.resource.url.substring(1),
                                                    download: x.resource.url.split("/").pop(),
                                                    children: [
                                                        {
                                                            tagName: "div",
                                                            className: "document-item text-truncate d-block",
                                                            textContent: x.resource.url.split("/").pop()
                                                        }
                                                    ]
                                                }
                                            ]
                                        });
                                    }
                                }
                                return abc;
                            })()
                        },
                        {
                            tagName: "div",
                            className: "question-answer-list",
                            children: x.answers.map(function (answer, indexA) {
                                return {
                                    tagName: "div",
                                    className: "question-answer p-3 pt-4 mt-3",
                                    dataset: {
                                        id: answer.answerId
                                    },
                                    children: [
                                        {
                                            tagName: "p",
                                            className: "answer-order user-select-none",
                                            textContent: numberToLetter(indexA + 1)
                                        },
                                        {
                                            tagName: "div",
                                            className: "pb-2 answer-resource",
                                            children: (() => {
                                                var abc = [];
                                                if (answer.resource) {
                                                    if (rasterType.includes(answer.resource.mimeType)) {
                                                        abc.push({
                                                            tagName: "div",
                                                            className: "img-resource",
                                                            style: "background-image: url('" + <c:url value="/"></c:url> + answer.resource.url.substring(1) + "');"
                                                        });
                                                    } else {
                                                        abc.push({
                                                            tagName: "div",
                                                            className: "document-box",
                                                            children: [
                                                                {
                                                                    tagName: "a",
                                                                    className: "text-decoration-none text-black text-truncate",
                                                                    href: "<c:url value="/"></c:url>" + answer.resource.url.substring(1),
                                                                    download: answer.resource.url.split("/").pop(),
                                                                    children: [
                                                                        {
                                                                            tagName: "div",
                                                                            className: "document-item text-truncate d-block",
                                                                            textContent: answer.resource.url.split("/").pop()
                                                                        }
                                                                    ]
                                                                }
                                                            ]
                                                        });
                                                    }
                                                }
                                                return abc;
                                            })()
                                        },
                                        {
                                            tagName: "p",
                                            className: "question-content",
                                            textContent: answer.content
                                        }
                                    ]
                                };
                            })
                        }
                    ]
                }
            ]
        });
        var questionNav = createElement({
            tagName: "div",
            children: [
                {
                    tagName: "p",
                    className: "rounded-3",
                    textContent: (indexX + 1),
                    onclick: () => {
                        quesDetail.innerHTML = null;
                        quesDetail.append(questionContent);
                    }

                }
            ]
        });
        quesNav.append(questionNav);
        questionElement.push(questionContent);
    });
    quesNav.children[0].children[0].click();
    let mimeType = '';
    if (testObj.resource) {
        hasPaper.classList.add("has-paper");
        fetch('<c:url value="/"/>' + testObj.resource.url.substring(1))
                .then(response => {
                    mimeType = response.headers.get('Content-Type');
                    return response.arrayBuffer();
                })
                .then(data => {
                    console.log(data);
                    if (mimeType === 'application/pdf') {
                        renderPdf(data);
                    } else if (mimeType === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document') {
                        renderDocx(data);
                    }
                });
    }


//    ------------------Manage BTN---------------------
    function quesbtn() {
        if (quesIndex === 0) {
            prev.disabled = true;
        } else {
            prev.disabled = false;
        }
        if (quesIndex === questionElement.length - 1) {
            next.disabled = true;
        } else {
            next.disabled = false;
        }
    }


    prev.onclick = () => {
        quesNav.children[--quesIndex].children[0].click();
        quesbtn();
    };
    next.onclick = () => {
        quesNav.children[++quesIndex].children[0].click();
        quesbtn();
    };
    quesbtn();





    questionElement.forEach(ques => {
        ques.addEventListener('click', (e) => {
            var ans = e.target.closest(".question-answer");
            if (!ans)
                return;
            ans.classList.toggle('active');
        });
    });





    var durationTime = testObj.duration;
    const startTime = Date.now();
    const countdownDuration = endDate.getTime() - startTime;
    const countdownElement = document.getElementById('countdown');
    function timeCountdown() {
        const elapsedTime = Date.now() - startTime;
        const remainingTime = countdownDuration - elapsedTime;
        if (remainingTime <= 0) {
            countdownElement.innerHTML = 'Time is up!';
        } else {
            const remainingMinutes = Math.floor(remainingTime / 1000 / 60);
            const remainingSeconds = Math.floor((remainingTime / 1000) % 60);
            countdownElement.innerHTML = remainingMinutes + "m " + remainingSeconds + "s";
            requestAnimationFrame(timeCountdown);
        }
    }
    requestAnimationFrame(timeCountdown);




    var btnSubmit = document.getElementById("submit-test");
    btnSubmit.addEventListener('click', function () {
        var studentAnswer = [];
        questionElement.forEach(function (ques) {
            var r = [...ques.querySelectorAll(".question-answer.active")];
            studentAnswer.push(...r.map(ans => ({
                    accountId: "${account.accountId}",
                    questionId: ques.dataset.id,
                    answerId: ans.dataset.id
                })));
        });
        fetch("<c:url value="/student/class/exercise/do?testid=${param.testid}"/>", {
            method: "POST",
            body: JSON.stringify(studentAnswer)
        }).then(resp => {
            if (resp.ok) {
                window.location.replace("<c:url value="/student/class/exercise?code=${code}"/>")
            }
        });
    });

</script>
<c:import url="../template/footer.jsp" />

