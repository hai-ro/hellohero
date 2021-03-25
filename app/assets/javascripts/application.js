// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

let Navtxt = document.getElementById('SidebarMenuLabel')
document.getElementById('OpenSidebarMenu').addEventListener('click', function () {
  if (this.checked) {
    Navtxt.textContent = "閉じる X";
    Navtxt.style.display = "inline-block";
  } else {
    Navtxt.textContent = "メニュー";
  }
}, false);

//Androidのthe Android stock broswerのサイドバーのエラーを修正する>
var nua = navigator.userAgent;
var is_android = ((nua.indexOf('Mozilla/5.0') > -1 && nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1) && !(nua.indexOf('Chrome') > -1));
if (is_android) { $('select.form-control').removeClass('form-control').css('width', '100%'); }

//仕事削除
function Destroyjob() {
  let dialog = document.getElementById('Destroyjob-Form');
  let jobtext = document.getElementById('Destroyjob-Form-Title');
  let text = document.getElementById('Jobname1');
  let jobname = text.innerText;
  jobtext.innerHTML = "<p>お仕事名<br>" + jobname + "</p>";
  dialog.style.display = 'block';
  this.style.display = 'none';
}
function DestroyjobYes() {
  window.location.href = './destroy.html';
}
function DestroyjobNo() {
  let dialog = document.getElementById('Destroyjob-Form');
  let btn = document.getElementById('Destroy-btn1');
  dialog.style.display = 'none';
  btn.style.display = 'block';
}
function Destroyjobshow() {
  let dialog = document.getElementById('Destroyjob-Form-Show');
  let jobtext = document.getElementById('Destroyjob-Form-ShowTitle');
  let text = document.getElementById('Jobname1-Show');
  let jobname = text.innerText;
  jobtext.innerHTML = "<p>お仕事名<br>" + jobname + "</p>";
  dialog.style.display = 'block';
  this.style.display = 'none';
}
function DestroyjobYesShow() {
  window.location.href = './destroy.html';
}
function DestroyjobNoShow() {
  let dialog = document.getElementById('Destroyjob-Form-Show');
  let btn = document.getElementById('Destroy-btn-Show1');
  dialog.style.display = 'none';
  btn.style.display = 'block';
}

//資格証の提出を完了する
function ConfirmationCompBtn() {
  let dialog = document.getElementById('Confirmation-Comp');
  dialog.style.display = 'block';
}
//退会する
function Deleteheroes() {
  let dialog = document.getElementById('Deleteheroes-Form');
  dialog.style.display = 'block';
}
function DeleteheroesYes() {
  //alert("ご利用ありがとうござました。またのご利用お待ちしております。");
  let dialog = document.getElementById('Deleteheroes-Form');
  dialog.style.display = 'none';
  let enddialog = document.getElementById('Deleteheroes-Form-End');
  enddialog.style.display = 'block';
}
function DeleteheroesNo() {
  let dialog = document.getElementById('Deleteheroes-Form');
  dialog.style.display = 'none';
}

function DeleteheroesEnd() {
  window.location.href = './../../tops/index.html';
}

//お仕事を検索する（スマホ用）
function Serchjob() {
  let dialog = document.getElementById('Serchjob-Form');
  dialog.style.display = 'block';
}
function Serchjobbtn() {
  let dialog = document.getElementById('Serchjob-Form');
  dialog.style.display = 'none';
}

//事業所さんの情報更新を完了する
function NursinghomesEditComp() {
  let dialog = document.getElementById('NursinghomesEditCompForm');
  dialog.style.display = 'block';
}

//生年月日登録
var nua = navigator.userAgent;
var is_android = ((nua.indexOf('Mozilla/5.0') > -1 && nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1) && !(nua.indexOf('Chrome') > -1));
if (is_android) { $('select.form-control').removeClass('form-control').css('width', '100%'); }
(function () {
  'use strict';
  //今日の日付データを変数todayに格納
  var optionLoop, this_day, this_month, this_year, today;
  today = new Date();
  this_year = today.getFullYear();
  this_month = today.getMonth() + 1;
  this_day = today.getDate();
  //ループ処理（スタート数字、終了数字、表示id名、デフォルト数字）
  optionLoop = function (start, end, id, this_day) {
    var i, opt;
    opt = null;
    for (i = start; i <= end; i++) {
      if (i === this_day) {
        opt += "<option value='" + i + "' selected>" + i + "</option>";
      } else {
        opt += "<option value='" + i + "'>" + i + "</option>";
      }
    }
    return document.getElementById(id).innerHTML = opt;
  };
  //関数設定（スタート数字[必須]、終了数字[必須]、表示id名[省略可能]、デフォルト数字[省略可能]）
  optionLoop(1940, this_year, 'id_year', this_year);
  optionLoop(1, 12, 'id_month', this_month);
  optionLoop(1, 31, 'id_day', this_day);
})();

//

function chatsend() {
  let chattext = document.getElementById('StyleChatTextarea').value;
  document.getElementById("testchat").innerText = chattext;
}
