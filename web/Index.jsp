<%-- 
    Document   : Index
    Created on : 15/03/2016, 01:25:19 PM
    Author     : Wladimir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="MasterPages/Script.jsp" %>
        <link rel="stylesheet" href="CSS/Tabla.css">
        <title>Pagos</title>
    </head>

    <body background ="http://www.csd.cl/fondo%20gris.jpg">
        <header>
            <center><img src="Imagenes/Header2.png" width="600" ></center>
                <%@include file="MasterPages/HearderPagos.jsp"%>
            <%-- start web service invocation --%><div class='contacto'><label>
                    <%
                        try {
                            pago.WebServiceCuentas_Service service = new pago.WebServiceCuentas_Service();
                            pago.WebServiceCuentas port = service.getWebServiceCuentasPort();
                            // TODO initialize WS operation arguments here
                            java.lang.String nombre = String.valueOf(request.getParameter("Nombre"));
                            java.lang.String cuenta = String.valueOf(request.getParameter("NumerodeCuenta"));
                            int valor = Integer.valueOf(request.getParameter("ValoraPagar"));
                            // TODO process result here
                            java.lang.String result = port.pagos(nombre, cuenta, valor);
                            out.println(result);
                        } catch (Exception ex) {
                            // TODO handle custom exceptions here
                        }
                    %>
                    <%-- end web service invocation --%></label></div>

            <form action="Index.jsp" method="POST" class='contacto'>
                <div><label>Nombre: </label><input type="text" name="Nombre" value="" /></div>
                <div><label>Numero de Cuenta: </label><input type="text" name="NumerodeCuenta" value="" /></div>
                <div><label>Valor a Pagar: </label><input type="text" name="ValoraPagar" value="" /></div>
                <div><input type="submit" value="Pagar" /></div>
            </form>
        </header>

        <%@include file="MasterPages/Footer.jsp"%>
        <br><br>

    </body>
</html>