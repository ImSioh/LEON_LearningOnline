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

    @media only screen and (min-width: 992px) {
        .main-container:not(.has-paper) .question-answer-list {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }
</style>
<div class="main-container has-paper">
    <div id="question-paper"></div>
    <div class="test-info-area p-4">
        <div>
            <p class="remain-time">30:00</p>
            <p class="title">Title</p>
            <p class="description border rounded-3 bg-light p-3">Nếu có giải “Hộp Cơm Vàng” cho làng ẩm thực Hoà Lạc thì ô anh này phải dc giải FairPlay, nói chuyện k thể nào uy tín hơn =))))</p>
        </div>
        <div class="question-nav border rounded-3 bg-light p-3 mb-3">
            <c:forEach begin="1" end="18" var="x">
                <div>
                    <p class="rounded-3">${x}</p>
                </div>
            </c:forEach>
        </div>
        <div class="prev-next-nav">
            <div id="prev" class="btn btn-outline-secondary w-100 text-center">
                <i class="fa-solid fa-caret-left"></i>
            </div>
            <div id="next" class="btn btn-outline-secondary w-100 text-center">
                <i class="fa-solid fa-caret-right"></i>
            </div>
        </div>
        <div class="question p-3 pt-4 rounded-3 bg-white mt-4">
            <p class="question-order user-select-none">Question 1</p>
            <div class="question-body">
                <div class="question-term">
                    <p class="question-content">Chuyển thể từ tiểu thuyết Đức cùng tên của cựu chiến binh Erich Maria Remarque, ở Việt Nam chúng ta biết đến tiểu thuyết dưới cái tên “Phía tây không có gì lạ”. Câu chuyện phản chiến, lột trần sự khốc liệt của chiến tranh Thế Chiến thứ nhất, lấy bối cảnh năm 1914, chiến tuyến phía Bắc nước Pháp.</p>
                    <div class="img-resource" style="background-image: url('<c:url value="/files/resource/b23cfaf3-856a-4c76-8890-f04f31bbbba2/page pic.png"/>');"></div>
                </div>
                <div class="question-answer-list">
                    <c:forEach begin="1" end="3" var="x">
                        <div class="question-answer p-3 pt-4 mt-3">
                            <p class="answer-order user-select-none">A</p>
                            <div class="pb-2 answer-resource">
                                <div class="img-resource" style="background-image: url('<c:url value="/files/resource/b23cfaf3-856a-4c76-8890-f04f31bbbba2/page pic.png"/>');"></div>
                            </div>
                            <p class="question-content">Trong AQOTWF, ngoại trừ những khía cạnh điển hình ta luôn thấy ở dòng phim ch.iến tr.anh như khắc hoạ sự khốn khổ lẫn tuyệt vọng của người lính, hành trình huỷ hoại một thiếu niên</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <button class="btn btn-primary w-100 mt-3 mb-5" id="create-exercise">
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
            return element
        }
        const parent = document.createElement(element.tagName)
        mergeObject(element, parent)
        if (Array.isArray(element.children))
            element.children.forEach(child => parent.append(createElement(child)))
        return parent
    }

    function mergeObject(source, target) {
        Object.entries(source).forEach(attr => {
            if (attr[0] === 'children' || attr[0] === 'tagName')
                return
            if (attr[0] === 'bind') {
                attr[1][0][attr[1][1]] = target
            }
            if (Object.prototype.toString.call(attr[1]) === '[object Object]') {
                mergeObject(attr[1], target[attr[0]])
            } else if (Array.isArray(attr[1]) && typeof target[attr[0]] === 'function') {
                target[attr[0]](...attr[1])
            } else {
                target[attr[0]] = attr[1]
            }
        })
    }

    async function renderPage(page, parent) {
        const initWidth = Math.min(Math.max(720, parent.clientWidth - 60), questionPaper.clientHeight)
        const scale = (initWidth * 1.5) / page.getViewport({scale: 1}).width
        const viewport = page.getViewport({scale: scale})
        const canvas = document.createElement('canvas')
        canvas.height = viewport.height
        canvas.width = viewport.width
        canvas.style.width = initWidth + 'px'
        const renderContext = {
            canvasContext: canvas.getContext('2d'),
            viewport: viewport
        }
        const renderTask = await page.render(renderContext)
        parent.append(createElement({
            tagName: 'div',
            className: 'd-flex',
            style: 'box-shadow: 0 0 10px rgb(0 0 0 / 50%); margin-top: ' + (page.pageNumber != 1 ? 30 : 0) + 'px;',
            children: [canvas]
        }))
    }

    function renderPdf(data) {
        pdfjsLib.getDocument(data).promise.then(async pdf => {
            const totalPages = pdf.numPages
            const pdfWrapper = createElement({
                tagName: 'div',
                className: 'd-flex flex-column align-items-center w-100',
                style: 'padding: 30px;'
            })
            questionPaper.append(pdfWrapper)
            for (var i = 1; i <= totalPages; i++) {
                await renderPage(await pdf.getPage(i), pdfWrapper)
            }
        }).catch(reason => {
            console.warn(reason)
        })
    }

    function renderDocx(data) {
        console.log(docx)
        docx.renderAsync(data, questionPaper)
    }

    const questionPaper = document.getElementById('question-paper')

    let mimeType = ''
    fetch('<c:url value="/files/resource/Instructions-for-setting-up-the-environment-for-java-web-PRJ301.docx"/>')
            .then(response => {
                mimeType = response.headers.get('Content-Type')
                return response.arrayBuffer()
            })
            .then(data => {
                console.log(data)
                if (mimeType === 'application/pdf') {
                    renderPdf(data)
                } else if (mimeType === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document') {
                    renderDocx(data)
                }
            })
</script>
<c:import url="../template/footer.jsp" />

