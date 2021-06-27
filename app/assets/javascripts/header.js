$(function () {
  $(".header--hunger--toggle").click(function () {
    $(".header--hunger__contents").toggleClass("dblock");
    $(".header--hunger--toggle i:first-child").toggleClass("dnone");
    $(".header--hunger--toggle i:nth-child(2)").toggleClass("dnone");
  });
});
