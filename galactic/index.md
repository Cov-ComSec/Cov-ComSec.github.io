# Coming Soon


Congratulations on finding this page about {redacted}. Don't panic, we will reveal more information on what this is about in:

<style>

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

var countDate = new Date("2022/05/25 12:00:00 UTC");
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

