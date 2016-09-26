<%-- 
    Document   : formulario.jsp
    Created on : 08/09/2016, 10:48:27
    Author     : jorge
--%>


<%@page import="br.edu.ifsul.dao.DaoMedico"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="medicoDao" scope="session"
             type="DaoMedico"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Medicos</title>
        <script>
            function doSalvar(){
                document.getElementById("acao").value = 'salvar';
                document.getElementById("form").submit();
            }
            function doCancelar(){
                document.getElementById("acao").value = 'cancelar';
                document.getElementById("form").submit();
            }            
        </script>                        
    </head>
    <body>
        <h1>Edição de Medicos</h1>
        <h2><%=medicoDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletMedico" method="POST">
            Código: <input type="text" name="id"
                           value="<%= medicoDao.getObjetoSelecionado().getId() == null
                                   ? "" : medicoDao.getObjetoSelecionado().getId() %>" size="6"
                                   readonly />
            <br/>Crm: <input type="text" name="crm"
                             value="<%= medicoDao.getObjetoSelecionado().getCrm()== null
                                   ? "" : medicoDao.getObjetoSelecionado().getCrm()%>" size="40"/> 
            
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
