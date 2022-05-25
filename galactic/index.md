# Coventry Galactic CTF


<style>
.button {
  background-color: #015fbc;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
}
.button:hover {
	background-color: #38b6ff;
}

*, *:before, *:after {
  box-sizing: inherit;
}

ul#countdown {
  width: 70%;
  padding: 15px 0 20px 0;
  color: #fff;
  border: 1px solid #adafb2;
  border-width: 1px 0;
  overflow: hidden;
  font-family: "Arial Narrow", Arial, sans-serif;
  font-weight: bold;
}
ul#countdown li {
  margin: 0 -3px 0 0;
  padding: 0;
  display: inline-block;
  width: 25%;
  font-size: 4vw;
  line-height: 2.5vw;
  text-align: center;
}

ul#countdown li .label {
  color: #adafb2;
  font-size: 1.5vw;
  line-height: 2vw;
  text-transform: uppercase;
}
</style>

<a href="https://forms.office.com/Pages/ResponsePage.aspx?id=mqsYS2U3vkqsfA4NOYr9TzvNREW-c5pLgP1wBfxa65ZUOElVNVJTNTNQMTZLSlRGSThKQTk3UEVQQi4u" target="_blank"><button class="button">Register Interest <i class="fa fa-pen-to-square"></i></button></a>
<a href="https://discord.gg/4Vpp8KgtXc" target="_blank"><button class="button">Join us on Discord <i class='fab fa-discord'></i></button></a>

Starting on the 9th of August 2022 at 12:00 UTC CUEH is proud to host the first internal Coventry University group CTF. If you are interested, please fill out the interest form, and to stay up-to-date with the latest information, please join our Coventry Galactic Discord (*Note* this is different from the normal ComSec Discord server).

![Coventry Galactic CTF Trailer](assets/trailer.gif)

## Frequently Asked Questions

### When is the event?
The event will take place between 9th August 2022 12:00 UTC until 15th August 2022 12:00.

### Who can take part?
To take part you must be a student or recent graduate from the Coventry University Group or associated partners. If you are unsure, contact the CTF organisers.

### How can we communicate with the CTF organisers?
If you have a question that you feel would be beneficial to others, please either leave a comment at the bottom of the page or ask a question in the Discord server. If the question is more personal, please ask someone with the organiser role within the Discord server.

### What is ComSec?
See our [about page](/about/).

### What will the difficulty be like?
We are aiming to produce beginner friendly to more challenging; so, do not be disheartened if you cannot solve something, try another challenge.

### What type of challenges will there be?
We aim to cover a wide range of topics related to ethical hacking, so there should be something for everyone.

### I have never taken part in a CTF, can I join?
Of course, everyone must start somewhere! We will release more guidance closer to the CTF.

### How can I help?
The best way you can help is by spreading the word, please pass the link to this web page to your friends within the university.

### How long is it until the event begins?
We are glad you asked:

<center>
  <ul id="countdown">
  <li id="days">
    <div class="number">00</div>
    <div class="label">Days</div>
  </li>
  <li id="hours">
    <div class="number">00</div>
    <div class="label">Hours</div>
  </li>
  <li id="minutes">
    <div class="number">00</div>
    <div class="label">Minutes</div>
  </li>
  <li id="seconds">
    <div class="number">00</div>
    <div class="label">Seconds</div>
  </li>
</ul>
</center>

<script id="rendered-js" >

var countDate = new Date("2022/08/09 12:00:00 UTC");
var x = setInterval(function() {
    var now = new Date().getTime();
    var distance = countDate - now;
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hrs = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var min = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var sec = Math.floor((distance % (1000 * 60)) / 1000);

    //Update labels
    document.getElementById("days").getElementsByClassName("number")[0].innerHTML = days;
    document.getElementById("hours").getElementsByClassName("number")[0].innerHTML = hrs;
    document.getElementById("minutes").getElementsByClassName("number")[0].innerHTML = min;
    document.getElementById("seconds").getElementsByClassName("number")[0].innerHTML = sec;

    //Countdown over
    if (distance <= 0) {
        for(i in document.getElementsByClassName("number")){ //zero the clocks
            document.getElementsByClassName("number")[i].innerHTML = "00";
        }
        clearInterval(x);
    }
}, 1000);
</script>

