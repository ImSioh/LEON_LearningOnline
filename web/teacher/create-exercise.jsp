<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../template/header.jsp"/>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    .main-container {
        padding-top: 56px;
        min-height: 100vh;
        display: flex;
        justify-content: center;
    }

    .main-container textarea {
        resize: none;
    }

    .main-container:not(.has-paper) .paper {
        display: none;
    }

    .main-container.has-paper .paper {
        background-color: gray;
        width: 60%;
    }

    .test-time-info {
        gap: 1.5rem;
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .main-container.has-paper > .test-info-area {
        width: 40%;
    }

    .test-info-area {
        max-width: 1200px;
        width: 80%;
    }

    #description {
        display: block;
        width: 100%;
        padding: .375rem .75rem;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        border-radius: .25rem;
        border: 1px solid #ced4da;
        transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    }

    #description:focus {
        color: #212529;
        background-color: #fff;
        border-color: #86b7fe;
        outline: 0;
        box-shadow: 0 0 0 0.25rem rgba(13,110,253,.25);
    }
</style>
<div class="main-container">
    <div class="paper p-4"></div>
    <div class="test-info-area p-4">
        <div class="test-time-info p-4 border rounded-3 bg-light">
            <div>
                <div class="mb-3 d-flex flex-wrap">
                    <div class="form-check form-switch d-inline-block">
                        <input class="form-check-input" id="start-time-toggle" type="checkbox">
                    </div>
                    <label for="start-time" class="form-label me-2">Start time</label>
                    <input type="datetime-local" class="form-control" disabled name="start-time" id="start-time">
                </div>
                <div class="mb-3 d-flex flex-wrap">
                    <div class="form-check form-switch d-inline-block">
                        <input class="form-check-input" id="end-time-toggle" type="checkbox">
                    </div>
                    <label for="end-time" class="form-label me-2">End time</label>
                    <input type="datetime-local" class="form-control" disabled name="end-time" id="end-time">
                </div>
            </div>
            <div>
                <div class="mb-3 d-flex flex-wrap">
                    <div class="form-check form-switch d-inline-block">
                        <input class="form-check-input" id="test-time-toggle" type="checkbox">
                    </div>
                    <label for="test-time" class="form-label me-2">Test time (minute)</label>
                    <input spellcheck="false" type="number" disabled class="form-control" name="test-time" id="test-time">
                </div>
            </div>
        </div>
        <div class="test-detail mt-4 p-4 border rounded-3 bg-light">
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input spellcheck="false" type="text" class="form-control" name="title" id="title">
                <label id="title-error" class="error mt-1 d-block" for="title"></label>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea spellcheck="false" rows="1" name="description" id="description"></textarea>
                <label id="description-error" class="error mt-1 d-block" for="description"></label>
            </div>
        </div>
    </div>
</div>
<script>
    function textAreaResize(extraHeight) {
        extraHeight = extraHeight || 0
        return function () {
            this.style.height = 0
            this.style.height = this.scrollHeight + extraHeight + 'px'
        }
    }

    const testTimeToggle = document.getElementById('test-time-toggle')
    const startTimeToggle = document.getElementById('start-time-toggle')
    const endTimeToggle = document.getElementById('end-time-toggle')
    const testTimeInput = document.getElementById('test-time')
    const startTimeInput = document.getElementById('start-time')
    const endTimeInput = document.getElementById('end-time')
    const descriptionInput = document.getElementById('description')

    testTimeToggle.addEventListener('click', () => {
        testTimeInput.disabled = !testTimeToggle.checked
    })
    startTimeToggle.addEventListener('click', () => {
        startTimeInput.disabled = !startTimeToggle.checked
    })
    endTimeToggle.addEventListener('click', () => {
        endTimeInput.disabled = !endTimeToggle.checked
    })
    descriptionInput.addEventListener('input', textAreaResize(2))
</script>
<c:import url="../template/footer.jsp"/>