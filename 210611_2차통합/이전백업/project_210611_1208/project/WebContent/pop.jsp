<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title> sjisbmoc </title>
<script>

function fncSetValue()
{
    var obj = window.event.srcElement;
    var tr  = obj.parentNode.nodeName;
    var a   = obj.parentNode.childNodes[0].innerHTML;
    var b   = obj.parentNode.childNodes[1].innerHTML;
    var c   = obj.parentNode.childNodes[2].innerHTML;
    var ary =new Array();
    ary.push(a);
    ary.push(b);
    ary.push(c);
    opener.fncAddRow(ary);
    self.close();
}

</script>
    </head>
    <body>
<form name='frm'>

        <table border='1'>
            <tr onclick='javascript_:fncSetValue();'>
                <td>AAA</td>
                <td>BBB</td>
                <td>CCC</td>
            </tr>
            <tr onclick='javascript_:fncSetValue();'>
                <td>DDD</td>
                <td>EEE</td>
                <td>FFF</td>
            </tr>
            <tr onclick='javascript_:fncSetValue();'>
                <td>GGG</td>
                <td>HHH</td>
                <td>III</td>
            </tr>
            <tr onclick='javascript_:fncSetValue();'>
                <td>JJJ</td>
                <td>KKK</td>
                <td>LLL</td>
            </tr>
        </table>

</form>
    </body>
</html>