<%-- 
    Document   : formulario.jsp
    Created on : 08/09/2016, 10:48:27
    Author     : jorge
--%>


<%@page import="br.edu.ifsul.dao.DaoMedicamento"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="medicamentoDao" scope="session"
             type="DaoMedicamento"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edi��o de Medicamentos</title>
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
        <h1>Edi��o de Medicamentos</h1>
        <h2><%=medicamentoDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletMedicamento" method="POST">
            C�digo: <input type="text" name="id"
                           value="<%= medicamentoDao.getObjetoSelecionado().getId() == null
                                   ? "" : medicamentoDao.getObjetoSelecionado().getId() %>" size="6"
                                   readonly />
            <br/>Nome: <input type="text" name="nome"
                           value="<%= medicamentoDao.getObjetoSelecionado().getNome() == null
                                   ? "" : medicamentoDao.getObjetoSelecionado().getNome() %>" size="40"/> 
            
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
