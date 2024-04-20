var o1r2 = 0
var quest1name = ''
var quest1money = ''
var quest1xp = ''
var quest1tozih = ''
var quest1cant = ''
var quest2name = ''
var quest2money = ''
var quest2xp = ''
var quest2tozih = ''
var quest2cant = ''
window.addEventListener("message", (event) => {
 if (event.data.action === "showmenu") {
     let visable = event.data.show
     if (visable) {
         $("body").fadeIn();
         $(".selectquestmode").fadeIn();
     } else {
         $("body").fadeOut();
         $(".selectquestmode").fadeOut();
         $(".questlist").fadeOut();
     }
 }
 if (event.data.action === "showlevelandxp") {
    let visablee = event.data.show
    if (visablee) {
        $("body").fadeIn();
        $(".topbar").fadeIn();
    }else {
        $("body").fadeOut();
        $(".topbar").fadeOut();
    }

 }
 if (event.data.action === 'sendlevelandxp') {
    $(".level").html(`Level ${event.data.level}`)
    $(".myxp").html(event.data.xp)
    $(".endxp").html(event.data.endxp)
    $(".progres").css('width', `${event.data.xp*event.data.endxpp}%`)
 }
 if (event.data.action === 'playerquest') {
    $(".quest1 p").html(event.data.label)
    quest1name = event.data.value
    quest1money = event.data.Money
    quest1xp = event.data.xp
    quest1tozih = event.data.Tozih
    quest1cant = event.data.cantquest
    
 }
 if (event.data.action === 'playerquest2') {
    $(".quest2 p").html(event.data.label)
    quest2name = event.data.value
    quest2money = event.data.Money
    quest2xp = event.data.xp
    quest2tozih = event.data.Tozih
    quest2cant = event.data.cantquest
 }
 if (event.data.action === 'opengang') {
    $(".selectquestmode").fadeOut();
    $(".questlist").fadeIn();
    $(".quest2").css('filter', 'drop-shadow(0 0 0 black)')
    $(".quest1").css('filter', 'drop-shadow(0 0 0 black)')
    o1r2 = 0
    $("#info-name").html(`Name : ...`)
    $("#info-money").html(`Money : ... $`)
    $("#info-xp").html(`XP : + ...`)
    $("#info-tozih").html(`Tozih : ...`)
 }
 if (event.data.action === 'openjob') {
    $(".selectquestmode").fadeOut();
    $(".questlist").fadeIn();
    $(".quest2").css('filter', 'drop-shadow(0 0 0 black)')
    $(".quest1").css('filter', 'drop-shadow(0 0 0 black)')
    o1r2 = 0
    $("#info-name").html(`Name : ...`)
    $("#info-money").html(`Money : ... $`)
    $("#info-xp").html(`XP : + ...`)
    $("#info-tozih").html(`Tozih : ...`)
 }
})

$("#accept").click(function() {
    if (o1r2 === 1) {
        $.post(`https://${GetParentResourceName()}/idontknow`, JSON.stringify({shoquest: 'accept', valuea: quest1name, cant: quest1cant}));
    }else if (o1r2 === 2) {
        $.post(`https://${GetParentResourceName()}/idontknow`, JSON.stringify({shoquest: 'accept', valuea: quest2name, cant: quest2cant}));
    }else if (o1r2 === 0) {
        $.post(`https://${GetParentResourceName()}/idontknow`, JSON.stringify({shoquest: 'accept'}));
    }
})
document.onkeyup = function(data){
    if (data.which == 27){
        $.post(`https://${GetParentResourceName()}/NUIFocusOff`, JSON.stringify({}));
    }
}
$(".close").click(function() {
 $(".questlist").fadeOut();
 $(".selectquestmode").fadeIn();
})
$(".gangquests").click(function() {
 $.post(`https://${GetParentResourceName()}/idontknow`, JSON.stringify({shoquest: 'gangquest'}));
});
$(".playerquests").click(function() {
 $.post(`https://${GetParentResourceName()}/idontknow`, JSON.stringify({shoquest: 'playerquest'}));
 $(".selectquestmode").fadeOut();
 $(".questlist").fadeIn();
 $(".quest2").css('filter', 'drop-shadow(0 0 0 black)')
 $(".quest1").css('filter', 'drop-shadow(0 0 0 black)')
 o1r2 = 0
 $("#info-name").html(`Name : ...`)
 $("#info-money").html(`Money : ... $`)
 $("#info-xp").html(`XP : + ...`)
 $("#info-tozih").html(`Tozih : ...`)
});
$(".jobquests").click(function() {
    $.post(`https://${GetParentResourceName()}/idontknow`, JSON.stringify({shoquest: 'jobquest'}));
});
$(".quest1").click(function() {
 o1r2 = 1
 $(".quest1").css('filter', 'drop-shadow(0 0 10px black)')
 $(".quest2").css('filter', 'drop-shadow(0 0 0 black)')
 $("#info-name").html(`Name : ${quest1name}`)
 $("#info-money").html(`Money : ${quest1money}  $`)
 $("#info-xp").html(`XP : + ${quest1xp}`)
 $("#info-tozih").html(`Tozih : ${quest1tozih}`)
});
$(".quest2").click(function() {
 o1r2 = 2
 $(".quest2").css('filter', 'drop-shadow(0 0 10px black)')
 $(".quest1").css('filter', 'drop-shadow(0 0 0 black)')
 $("#info-name").html(`Name : ${quest2name}`)
 $("#info-money").html(`Money : ${quest2money}  $`)
 $("#info-xp").html(`XP : + ${quest2xp}`)
 $("#info-tozih").html(`Tozih : ${quest2tozih}`)
});