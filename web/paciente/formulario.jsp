<%-- 
    Document   : formulario.jsp
    Created on : 08/09/2016, 10:48:27
    Author     : jorge
--%>


<%@page import="br.edu.ifsul.dao.DaoPaciente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pacienteDao" scope="session"
             type="DaoPaciente"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Edição de Pacientes</title>
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
        <h1>Edição de Pacientes</h1>
        <h2><%=pacienteDao.getMensagem()%></h2>
        <form name="form" id="form" action="ServletPaciente" method="POST">
            Código: <input type="text" name="id"
                           value="<%= pacienteDao.getObjetoSelecionado().getId() == null
                                   ? "" : pacienteDao.getObjetoSelecionado().getId() %>" size="6"
                                   readonly="true" />
            <br/>Nome: <input type="text" name="nome"
                           value="<%= pacienteDao.getObjetoSelecionado().getNome() == null
                                   ? "" : pacienteDao.getObjetoSelecionado().getNome() %>" size="40"/> 
            <br/>Nascimento: <input type="text" name="nascimento"
                           value="<%= pacienteDao.getObjetoSelecionado().getNascimento()== null
                                   ? "" : pacienteDao.getObjetoSelecionado().getNascimento()%>" size="40"/>
            <br/>Telefone: <input type="text" name="telefone"
                           value="<%= pacienteDao.getObjetoSelecionado().getTelefone()== null
                                   ? "" : pacienteDao.getObjetoSelecionado().getTelefone()%>" size="40"/>
            <br/>Sexo: <input type="text" name="sexo"
                           value="<%= pacienteDao.getObjetoSelecionado().getSexo()== null
                                   ? "" : pacienteDao.getObjetoSelecionado().getSexo() %>" size="40"/>
            <br/>Histórico <input type="text" name="historico"
                           value="<%= pacienteDao.getObjetoSelecionado().getHistorico() == null
                                   ? "" : pacienteDao.getObjetoSelecionado().getHistorico() %>" size="40"/>
            <br/>Peso: <input type="text" name="peso"
                           value="<%= pacienteDao.getObjetoSelecionado().getPeso() == null
                                   ? "" : pacienteDao.getObjetoSelecionado().getPeso() %>" size="40"/>
            <br/>Altura: <input type="text" name="altura"
                           value="<%= pacienteDao.getObjetoSelecionado().getAltura() == null
                                   ? "" : pacienteDao.getObjetoSelecionado().getAltura() %>" size="40"/>
            <input type="button" value="Salvar" name="btnSalvar" onclick="doSalvar()"/>
            <input type="button" value="Cancelar" name="btnCancelar" onclick="doCancelar()"/>
            <input type="hidden" name="acao" id="acao" value=""/>
        </form>
    </body>
</html>
