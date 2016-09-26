<%-- 
    Document   : formulario.jsp
    Created on : 08/09/2016, 10:48:27
    Author     : jorge
--%>


<%@page import="br.edu.ifsul.dao.DaoEspecialidade"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="especialidadeDao" scope="session"
             type="DaoEspecialidade"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Especialidades</title>
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
        <h1>Edição de Especialidades</h1>
        <h2><%=especialidadeDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletEspecialidade" method="POST">
            Código: <input type="text" name="id"
                           value="<%= especialidadeDao.getObjetoSelecionado().getId() == null
                                   ? "" : especialidadeDao.getObjetoSelecionado().getId() %>" size="6"
                                   readonly />
            <br/>Descrição: <input type="text" name="descricao"
                           value="<%= especialidadeDao.getObjetoSelecionado().getDescricao()== null
                                   ? "" : especialidadeDao.getObjetoSelecionado().getDescricao()%>" size="40"/> 
            
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
