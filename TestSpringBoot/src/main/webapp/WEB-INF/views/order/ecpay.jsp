<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.util.* "%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>ecpay測試</title>
</head>
<style>
    form{
        margin: 30px;
    }
</style>
<body>

<br>

    <form action="/petpet/ecpaytest" method="post">
        
       checkvalue<br>
       <input type="text" name="CheckMacValue" value="82843FAB05F04943B6777A1502D2BDCF"/>
       <br>
       CustomField1<br>
       <input type="text" name="CustomField1" value=""/><br>
       CustomField2<br>
        <input type="text" name="CustomField2" value=""/><br>
        CustomField3<br>
        <input type="text" name="CustomField3" value=""/><br>
        CustomField4<br>
        <input type="text" name="CustomField4" value=""/><br>
        MerchantID<br>
        <input type="text" name="MerchantID" value="2000132"/><br>
        MerchantTradeNo<br>
        <input type="text" name="MerchantTradeNo" value="ABC1530014538"/><br>
        PaymentDate<br>
        <input type="text" name="PaymentDate" value="2018/06/26 20:05:00"/><br>
        PaymentType<br>
        <input type="text" name="PaymentType" value="Credit_CreditCard"/><br>
        PaymentTypeChargeFee<br>
        <input type="text" name="PaymentTypeChargeFee" value="0"/><br>
        RtnCode<br>
        <input type="text" name="RtnCode" value="1"/><br>
        RtnMsg<br>
        <input type="text" name="RtnMsg" value="paid"/><br>
        SimulatePaid<br>
        <input type="text" name="SimulatePaid" value="0"/><br>
        StoreID<br>
        <input type="text" name="StoreID" value=""/><br>
        TradeAmt<br>
        <input type="text" name="TradeAmt" value="2600"/><br>
        TradeDate<br>
        <input type="text" name="TradeDate" value="2018/06/26 20:02:19"/><br>
        TradeNo<br>
        <input type="text" name="TradeNo" value="1806262002197261"/><br>
        按鈕
        <button type="submit">submit</button>
    </form>
</div>
</body>
</html>