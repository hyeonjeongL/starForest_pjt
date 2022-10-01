<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<style>
	h1 {text-align:center;}
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/qrcode.js"></script>
</HEAD>
<BODY>
		<h1>회원 QR Code 발급</h1><hr><br><br>
		<div id="qrcode"></div>
</BODY>
<script type="text/javascript">

	var qrcode = new QRCode(document.getElementById("qrcode"), {
		text: "yeji",
		width: 128,
		height: 128,
		colorDark : "#000000",
		colorLight : "#ffffff",
		correctLevel : QRCode.CorrectLevel.H
	});

	$("#qrcode > img").css({"margin":"auto"});
</script>
</HTML>
