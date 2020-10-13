const drop = document.querySelector(".drop");
const dropContainer = document.querySelector(".drop__container");
const scrollBtn = document.querySelector(".scroll-btn");
const inputNameWrite = document.querySelector("#name__write");
const inputPwWrite = document.querySelector("#pw__write");
const inputPwCheck = document.querySelector("#pw__check");
const addressSearch = document.querySelector(".address--search");

const agreementView = document.querySelector(".agreement");
const privateView = document.querySelector(".private");
const locationView = document.querySelector(".location");
const agreementBlocker = document.querySelector(".agreement--blocker");
const argeementDetail = document.querySelector(".agreement--detail");
const privateBlocker = document.querySelector(".private--blocker");
const privateDetail = document.querySelector(".private--detail");
const locationBlocker = document.querySelector(".location--blocker");
const locationDetail = document.querySelector(".location--detail");

const selectAll = document.querySelector(".all--select");
const objs = document.querySelectorAll(".agree--select");
const findPwSubmit = document.querySelector(".find-pw__submit");
const findPwResetLogin = document.querySelector(".find-pw-reset__login");
const findPwResetMain = document.querySelector(".find-pw-reset__main");
const myPageUpdateBtn = document.querySelector(".mypage__update");
const userLeaveBtn = document.querySelector(".mypage__leave");
const userLeaveCancleBtn = document.querySelector(".user-leave__cancle");
const userLeaveSubmitBtn = document.querySelector(".user-leave__submit");
const updatePwBtn = document.querySelector(".update-pw__submit");
const loginJoin = document.querySelector(".login__join");
const loginSubmit = document.querySelector(".login__submit");
const submitBtn = document.querySelector(".submit-btn");
const emailCheckBtn = document.querySelector(".email-check");
const nameCheckBtn = document.querySelector(".name-check");

const imageInput1 = document.querySelector(".image-1");
const imageContainer1 = document.querySelector(".button-1");
const imageInput2 = document.querySelector(".image-2");
const imageContainer2 = document.querySelector(".button-2");
const imageInput3 = document.querySelector(".image-3");
const imageContainer3 = document.querySelector(".button-3");
const imageInput4 = document.querySelector(".image-4");
const imageContainer4 = document.querySelector(".button-4");
const imageInput5 = document.querySelector(".image-5");
const imageContainer5 = document.querySelector(".button-5");

const selectStatus = document.querySelector(".category-status");
const selectInput = document.querySelector(".category-input");

const sweetBarContainer = document.querySelector(".sweet-cotainer");

const PicksBtn = document.querySelector(".picks-container");
const PicksIco = document.querySelector(".picks-ico");

const listBtn = document.querySelector(".list--btn");

const noticeWriteSubmit = document.querySelector(".notice-board-write__submit");
const blackListWriteSubmit = document.querySelector(
    ".black-list-board-write__submit"
);
const badReviewWriteSubmit = document.querySelector(
    ".bad-review-board-write__submit"
);

const saleWriteSubmit = document.querySelector(".sale-board-write__submit");
const sharingWriteSubmit = document.querySelector(
    ".sharing-board-write__submit"
);
const buyWriteSubmit = document.querySelector(".buy-board-write__submit");

const noticeUpdateSubmit = document.querySelector(
    ".notice-board-update__submit"
);
const blackListUpdateSubmit = document.querySelector(
    ".black-list-board-update__submit"
);
const badReviewUpdateSubmit = document.querySelector(
    ".bad-review-board-update__submit"
);
const saleUpdateSubmit = document.querySelector(".sale-board-update__submit");
const sharingUpdateSubmit = document.querySelector(
    ".sharing-board-update__submit"
);
const buyUpdateSubmit = document.querySelector(".buy-board-update__submit");

const noticeReadDelete = document.querySelector(".notice-board-read__delete");
const blackListReadDelete = document.querySelector(
    ".black-list-board-read__delete"
);
const badReviewReadDelete = document.querySelector(
    ".bad-review-board-read__delete"
);
const saleReadDelete = document.querySelector(".sale-board-read__delete");
const sharingReadDelete = document.querySelector(".sharing-board-read__delete");
const buyReadDelete = document.querySelector(".buy-board-read__delete");

const noticeReadUpdate = document.querySelector(".notice-board-read__update");
const blackListReadUpdate = document.querySelector(".black-list-read__update");
const badReviewReadUpdate = document.querySelector(".bad-review-read__update");
const saleReadUpdate = document.querySelector(".sale-board-read__update");
const sharingReadUpdate = document.querySelector(".sharing-board-read__update");
const buyReadUpdate = document.querySelector(".buy-board-read__update");

let i = 0;
let j = 0;

if (drop != null) {
    drop.addEventListener("click", () => {
        dropAction();
    });
}

if (agreementView != null) {
    agreementView.addEventListener("click", () => {
        agreementHandeler();
    });
}
if (privateView != null) {
    privateView.addEventListener("click", () => {
        privateHandeler();
    });
}
if (locationView != null) {
    locationView.addEventListener("click", () => {
        locationHandeler();
    });
}
if (agreementBlocker != null) {
    agreementBlocker.addEventListener("click", () => {
        agreementHandeler();
    });
}
if (privateBlocker != null) {
    privateBlocker.addEventListener("click", () => {
        privateHandeler();
    });
}
if (locationBlocker != null) {
    locationBlocker.addEventListener("click", () => {
        locationHandeler();
    });
}

if (scrollBtn != null) {
    scrollBtn.addEventListener("click", () => {
        window.scrollTo({ top: 0, behavior: "smooth" });
    });
}

if (inputNameWrite != null) {
    inputNameWrite.addEventListener("keyup", () => {
        nameRules();
    });
}
if (inputPwWrite != null) {
    inputPwWrite.addEventListener("keyup", () => {
        pwRules();
        pwCheck();
    });
}
if (inputPwCheck != null) {
    inputPwCheck.addEventListener("keyup", () => {
        pwCheck();
    });
}

if (addressSearch != null) {
    addressSearch.addEventListener("click", () => {
        addressSearchFunction();
    });
}

if (selectAll != null) {
    if (selectAll != null) {
        selectAll.addEventListener(
            "click",
            function () {
                for (i = 0; i < objs.length; i++) {
                    objs[i].checked = selectAll.checked;
                }
            },
            false
        );
    }

    if (objs != null) {
        for (i = 0; i < objs.length; i++) {
            objs[i].addEventListener(
                "click",
                function () {
                    for (j = 0; j < objs.length; j++) {
                        if (objs[j].checked === false) {
                            selectAll.checked = false;
                            return;
                        }
                    }
                    selectAll.checked = true;
                },
                false
            );
        }
    }
}

// 작업시 넘어갈 링크는 잘 체크하셔서 알맞게 수정 부탁드립니다
if (findPwResetLogin != null) {
    findPwResetLogin.addEventListener("click", () => {
        location.href = "login.html";
    });
}

if (findPwResetMain != null) {
    findPwResetMain.addEventListener("click", () => {
        location.href = "../main/main.html";
    });
}

if (userLeaveCancleBtn != null) {
    userLeaveCancleBtn.addEventListener("click", () => {
        history.go(-1);
    });
}

if (loginJoin != null) {
    loginJoin.addEventListener("click", () => {
        location.href = "join.html";
    });
}

if (userLeaveBtn != null) {
    userLeaveBtn.addEventListener("click", () => {
        if (confirm("회원탈퇴를 원하십니까 ?") == true) {
            location.href = "userLeave.html";
        } else {
            return false;
        }
    });
}

// --------------------------- 작업시 유효성 검사이후 넘겨주세요
if (myPageUpdateBtn != null) {
    myPageUpdateBtn.addEventListener("click", () => {
        if (true) {
            // 작업시 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
            // document.formname.submit();
            alert("수정완료 !");
            location.href = "../main/main.html";
        } else {
            alert("수정실패 ! 입력하신 정보를 확인해주세요.");
            return false;
        }
    });
}

if (userLeaveSubmitBtn != null) {
    userLeaveSubmitBtn.addEventListener("click", () => {
        if (true) {
            // 작업시 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
            // document.formname.submit();
            alert("탈퇴가 완료되었습니다. 그동안 이용해주셔서 감사합니다.");
            location.href = "../main/main.html";
        } else {
            alert("탈퇴에 실패하였습니다. 비밀번호를 확인해주세요.");
            return false;
        }
    });
}

if (updatePwBtn != null) {
    updatePwBtn.addEventListener("click", () => {
        if (true) {
            // 작업시 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
            // document.formname.submit();
            alert("수정완료 ! 환영합니다.");
            location.href = "../main/main.html";
        } else {
            alert("수정실패 ! 입력하신 정보를 확인해주세요.");
            return false;
        }
    });
}

if (loginSubmit != null) {
    loginSubmit.addEventListener("click", () => {
        if (true) {
            // 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
            // document.formname.submit();
            alert("로그인성공 ! 환영합니다.");
            location.href = "../main/main.html";
        } else {
            alert("로그인실패 ! 아이디 혹은 비밀번호를 확인해주세요.");
            return false;
        }
    });
}

if (findPwSubmit != null) {
    findPwSubmit.addEventListener("click", () => {
        if (true) {
            // 작업시 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
            // document.formname.submit();
            location.href = "findPwReset.html";
        } else {
            alert("존재하지 않는 회원 정보 입니다.");
            return false;
        }
    });
}

if (submitBtn != null) {
    submitBtn.addEventListener("click", () => {
        if (true) {
            // 작업시 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
            // document.formname.submit();
            alert("가입완료 ! 잘 부탁드립니다.");
            location.href = "../main/main.html";
        } else {
            alert("가입실패 ! 입력하신 정보를 확인해주세요.");
            return false;
        }
    });
}

if (emailCheckBtn != null) {
    emailCheckBtn.addEventListener("click", () => {
        if (true) {
            // 작업시 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
            // document.formname.submit();
            alert("사용하실 수 있는 이메일입니다.");
        } else {
            alert("이미 가입된 이메일입니다.");
            return false;
        }
    });
}

if (nameCheckBtn != null) {
    nameCheckBtn.addEventListener("click", () => {
        if (true) {
            // 작업시 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
            // document.formname.submit();
            alert("사용하실 수 있는 닉네임입니다.");
        } else {
            alert("이미 가입된 닉네임입니다.");
            return false;
        }
    });
}
if (imageInput1 != null) {
    imageInput1.addEventListener("change", () => {
        imageThumbnail1();
    });
}
if (imageInput2 != null) {
    imageInput2.addEventListener("change", () => {
        imageThumbnail2();
    });
}
if (imageInput3 != null) {
    imageInput3.addEventListener("change", () => {
        imageThumbnail3();
    });
}
if (imageInput4 != null) {
    imageInput4.addEventListener("change", () => {
        imageThumbnail4();
    });
}
if (imageInput5 != null) {
    imageInput5.addEventListener("change", () => {
        imageThumbnail5();
    });
}

if (listBtn != null) {
    listBtn.addEventListener("click", () => {
        if (confirm("되돌아가시겠어요 ?") == true) {
            history.go(-1);
        } else {
            return false;
        }
    });
}


//공지사항 등록
if (noticeWriteSubmit != null) {
    noticeWriteSubmit.addEventListener("click", () => {
        if (confirm("글을 등록할까요 ?") == true) {
            if (true) {
                // 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
                // document.formname.submit();
                alert("등록완료 ! 감사합니다.");
                location.href = "noticeBoard.html";
            } else {
                alert("등록실패 ! 작성하신 글을 확인해주세요.");
            }
        } else {
            return false;
        }
    });
}




//나눔글 등록
if (sharingWriteSubmit != null) {
    sharingWriteSubmit.addEventListener("click", () => {
        if (confirm("글을 등록할까요 ?") == true) {
            if (true) {
                // 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
                // document.formname.submit();
                alert("등록완료 ! 감사합니다.");
                location.href = "toSharingBoard.html";
            } else {
                alert("등록실패 ! 작성하신 글을 확인해주세요.");
            }
        } else {
            return false;
        }
    });
}




//공지사항 수정
if (noticeUpdateSubmit != null) {
    noticeUpdateSubmit.addEventListener("click", () => {
        if (confirm("글을 수정할까요 ?") == true) {
            if (true) {
                // 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
                // document.formname.submit();
                alert("수정완료 !");
                location.href = "noticeBoard.html";
            } else {
                alert("수정실패 ! 수정하신 글을 확인해주세요.");
            }
        } else {
            return false;
        }
    });
}




//나눔 글 수정
if (sharingUpdateSubmit != null) {
    sharingUpdateSubmit.addEventListener("click", () => {
        if (confirm("글을 수정할까요 ?") == true) {
            if (true) {
                // 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
                // document.formname.submit();
                alert("수정완료 !");
                location.href = "toSharingBoard.html";
            } else {
                alert("수정실패 ! 수정하신 글을 확인해주세요.");
            }
        } else {
            return false;
        }
    });
}


//공지사항 삭제
if (noticeReadDelete != null) {
    noticeReadDelete.addEventListener("click", () => {
        if (confirm("삭제하시겠습니까 ?") == true) {
            if (true) {
                // 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
                // document.formname.submit();
                alert("삭제완료 !");
                location.href = "noticeBoard.html";
            } else {
                alert("삭제실패 !");
            }
        } else {
            return false;
        }
    });
}


//나눔 글 삭제
if (sharingReadDelete != null) {
    sharingReadDelete.addEventListener("click", () => {
        if (confirm("삭제하시겠습니까 ?") == true) {
            if (true) {
                // 주석해제 후 formname에 값 전달을 위한 form태그의 name을 적어주세요
                // document.formname.submit();
                alert("삭제완료 !");
                location.href = "toSharingBoard.html";
            } else {
                alert("삭제실패 !");
            }
        } else {
            return false;
        }
    });
}



/*if (noticeReadUpdate != null) {
    noticeReadUpdate.addEventListener("click", () => {
        location.href = "noticeBoardUpdate.html";
    });
}*/



/*if (sharingReadUpdate != null) {
    sharingReadUpdate.addEventListener("click", () => {
        location.href = "toSharingBoardUpdate.html";
    });
}*/



if (selectStatus != null) {
    selectStatus.addEventListener("change", () => {
        if(selectStatus.value == "3") {
            alert("거래완료 변경시엔 거래자 아이디를 입력해 주셔야합니다.");
            selectInput.style.display ="block";
        } else {
            selectInput.style.display ="none";
        }
    });
}


//-----------------------------
function dropAction() {
    if (dropContainer.classList.contains("active")) {
        dropContainer.classList.remove("active");
    } else {
        dropContainer.classList.add("active");
    }
}



function agreementHandeler() {
    agreementBlocker.classList.toggle("active");
    argeementDetail.classList.toggle("active");
}

function privateHandeler() {
    privateBlocker.classList.toggle("active");
    privateDetail.classList.toggle("active");
}

function locationHandeler() {
    locationBlocker.classList.toggle("active");
    locationDetail.classList.toggle("active");
}




//파일첨부
function imageThumbnail1() {
    for (var image of event.target.files) {
        var reader = new FileReader();
        while (imageContainer1.firstChild) {
            imageContainer1.removeChild(imageContainer1.firstChild);
        }
        reader.onload = function (event) {
            var img = document.createElement("img");
            var btn = document.createElement("div");
            var result1 = event.target.result;
            btn.setAttribute("class", "del-btn");
            img.setAttribute("src", result1);
            imageContainer1.appendChild(img);
            imageContainer1.appendChild(btn);

            btn.addEventListener("click", (event) => {
                imageInput1.value = "";
                img.remove();
                btn.remove();
            });
        };
        reader.readAsDataURL(image);
    }
}

function imageThumbnail2() {
    for (var image of event.target.files) {
        var reader = new FileReader();
        while (imageContainer2.firstChild) {
            imageContainer2.removeChild(imageContainer2.firstChild);
        }
        reader.onload = function (event) {
            var img = document.createElement("img");
            var btn = document.createElement("div");
            var result1 = event.target.result;
            btn.setAttribute("class", "del-btn");
            img.setAttribute("src", result1);
            imageContainer2.appendChild(img);
            imageContainer2.appendChild(btn);

            btn.addEventListener("click", (event) => {
                imageInput2.value = "";
                img.remove();
                btn.remove();
            });
        };
        reader.readAsDataURL(image);
    }
}

function imageThumbnail3() {
    for (var image of event.target.files) {
        var reader = new FileReader();
        while (imageContainer3.firstChild) {
            imageContainer3.removeChild(imageContainer3.firstChild);
        }
        reader.onload = function (event) {
            var img = document.createElement("img");
            var btn = document.createElement("div");
            var result1 = event.target.result;
            btn.setAttribute("class", "del-btn");
            img.setAttribute("src", result1);
            imageContainer3.appendChild(img);
            imageContainer3.appendChild(btn);

            btn.addEventListener("click", (event) => {
                imageInput3.value = "";
                img.remove();
                btn.remove();
            });
        };
        reader.readAsDataURL(image);
    }
}

function imageThumbnail4() {
    for (var image of event.target.files) {
        var reader = new FileReader();
        while (imageContainer4.firstChild) {
            imageContainer4.removeChild(imageContainer4.firstChild);
        }
        reader.onload = function (event) {
            var img = document.createElement("img");
            var btn = document.createElement("div");
            var result1 = event.target.result;
            btn.setAttribute("class", "del-btn");
            img.setAttribute("src", result1);
            imageContainer4.appendChild(img);
            imageContainer4.appendChild(btn);

            btn.addEventListener("click", (event) => {
                imageInput4.value = "";
                img.remove();
                btn.remove();
            });
        };
        reader.readAsDataURL(image);
    }
}
function imageThumbnail5() {
    for (var image of event.target.files) {
        var reader = new FileReader();
        while (imageContainer5.firstChild) {
            imageContainer5.removeChild(imageContainer5.firstChild);
        }
        reader.onload = function (event) {
            var img = document.createElement("img");
            var btn = document.createElement("div");
            var result1 = event.target.result;
            btn.setAttribute("class", "del-btn");
            img.setAttribute("src", result1);
            imageContainer5.appendChild(img);
            imageContainer5.appendChild(btn);

            btn.addEventListener("click", (event) => {
                imageInput5.value = "";
                img.remove();
                btn.remove();
            });
        };
        reader.readAsDataURL(image);
    }
}
// 파일첨부

// 슬라이드
const showing_class = "showing";
const firstslide = document.querySelector(".slide:nth-child(1)");
const lastslide = document.querySelector(".slide:nth-child(5)");
const left_btn = document.querySelector(".left");

function right_move() {
    const currentslide = document.querySelector(".showing");
    if (currentslide) {
        const nextslide = currentslide.nextElementSibling;
        currentslide.classList.remove(showing_class);
        if (nextslide != left_btn) {
            nextslide.classList.add(showing_class);
        } else {
            firstslide.classList.add(showing_class);
        }
    }
}

function left_move() {
    const currentslide = document.querySelector(".showing");
    if (currentslide) {
        const prevslide = currentslide.previousElementSibling;
        currentslide.classList.remove(showing_class);
        if (prevslide) {
            prevslide.classList.add(showing_class);
        } else {
            lastslide.classList.add(showing_class);
        }
    }
}

//

// 당도측정
if (sweetBarContainer != null) {
    document.ready = meterHandeler();

    function meterHandeler() {
        let sweetB = 70;
        if (sweetB != 0) {
            if (sweetB < 33) {
                sweetBarContainer.classList.add("red");
                sweetBarContainer.innerHTML = `<p class="sweet-bar--text">${sweetB}%</p>
 <i class="fas fa-carrot"></i>
<meter
 min="0" max="100"
 low="33" high="66" optimum="80"
 value="${sweetB}">
</meter>`;
            } else if (sweetB != 66 && 33 <= sweetB && sweetB < 66) {
                sweetBarContainer.classList.add("orange");
                sweetBarContainer.innerHTML = `<p class="sweet-bar--text">${sweetB}%</p>
<i class="fas fa-carrot"></i>
<meter
 min="0" max="100"
 low="33" high="66" optimum="80"
 value="${sweetB}">
</meter>`;
            } else if (66 <= sweetB) {
                sweetBarContainer.classList.add("green");
                sweetBarContainer.innerHTML = `<p class="sweet-bar--text">${sweetB}%</p>
<i class="fas fa-carrot"></i>
<meter
 min="0" max="100"
 low="33" high="66" optimum="80"
 value="${sweetB}">
</meter>`;
            }
        } else {
            sweetBarContainer.innerHTML = `<p class="sweet-bar--text">거래량이 부족해요 ! </p>
<i class="fas fa-carrot"></i>
<meter
 min="0" max="100"
 low="34" high="66" optimum="80"
 value="${sweetB}">
</meter>`;
        }
    }
}
//
