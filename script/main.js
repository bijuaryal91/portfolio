// setup for preeloader
function loadDocument() {
    var preloader = document.getElementById('screen-loader');
    preloader.style.display = 'none';
};

// navbar cancel button for links
function sinchan(){
    body.classList.remove("disabled");
    navbar.classList.remove("show");
    menuBtn.classList.remove("hide");
};

// sticky navbar js/
const body = document.querySelector("body");
const navbar = document.querySelector(".navbar");
const menuBtn = document.querySelector(".menu-btn");
const cancelBtn = document.querySelector(".cancel-btn");
menuBtn.onclick = () => {
    navbar.classList.add("show");
    menuBtn.classList.add("hide");
    body.classList.add("disabled");
}
cancelBtn.onclick = () => {
    body.classList.remove("disabled");
    navbar.classList.remove("show");
    menuBtn.classList.remove("hide");
}
window.onscroll = () => {
    this.scrollY > 20 ? navbar.classList.add("sticky") : navbar.classList.remove("sticky");
}

//   typed js
var typed = new Typed(".typing", {
    strings: ["Student", "Developer", "Teacher", "Designer"],
    typeSpeed: 100,
    backSpeed: 60,
    loop: true
});
var typed = new Typed(".typing-2", {
    strings: ["Student", "Developer", "Teacher", "Designer"],
    typeSpeed: 100,
    backSpeed: 60,
    loop: true
});

// function to download cv
function downloadCv() {
    window.open('cv/myresume-biju.pdf');
};

//contact form submission
{
    function validate() {
        event.preventDefault();
        var name = document.getElementById("name").value;
        var subject = document.getElementById("subject").value;
        var email = document.getElementById("email").value;
        var message = document.getElementById("message").value;
        var error_message = document.getElementById("error_message");

        error_message.style.padding = "10px";

        var text;
        if (name.length < 5) {
            text = "Please Enter Valid Name.";
            error_message.innerHTML = text;
            return false;
        }
        if (subject.length < 10) {
            text = "Please Enter Correct Subject.";
            error_message.innerHTML = text;
            return false;
        }
        if (email.indexOf("@") == -1 || email.length < 6) {
            text = "Please Enter Valid Email.";
            error_message.innerHTML = text;
            return false;
        }
        if (message.length <= 140) {
            text = "Please Enter More Than 140 Characters.";
            error_message.innerHTML = text;
            return false;
        }
        var templateParams = {
            subject: subject,
            name: name,
            email: email,
            message: message
        };

        emailjs.send("bijuaryal", "template_xaqsipw", templateParams)
            .then(function (response) {
                error_message.style.backgroundColor = 'lightgreen';
                text = "Message Sent Successfully.";
                error_message.innerHTML = text;
                return true;
            }, function (error) {
                error_message.style.backgroundColor = 'geraldine';
            text = "Message Sent Successfully.";
            error_message.innerHTML = text;
            return true;
            });

    }
}

// // disable inspect element and view page source
// document.onkeydown = function(e) {
//     if(event.keyCode == 123) {
//        return false;
//     }
//     if(e.ctrlKey && e.shiftKey && e.keyCode == 'I'.charCodeAt(0)) {
//        return false;
//     }
//     if(e.ctrlKey && e.shiftKey && e.keyCode == 'C'.charCodeAt(0)) {
//        return false;
//     }
//     if(e.ctrlKey && e.shiftKey && e.keyCode == 'J'.charCodeAt(0)) {
//        return false;
//     }
//     if(e.ctrlKey && e.keyCode == 'U'.charCodeAt(0)) {
//        return false;
//     }
//   }