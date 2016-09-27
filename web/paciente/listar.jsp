

<%@page import="br.edu.ifsul.modelo.Paciente"%>
<%@page import="br.edu.ifsul.dao.DaoPaciente"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="pacienteDao" scope="session"
             type="DaoPaciente"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de pacientes</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h2>Pacientes</h2>
        <h2><%=pacienteDao.getMensagem()%></h2>
        <a href="ServletPaciente?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Nascimento</th>
                    <th>Sexo</th>
                    <th>Histórico</th>
                    <th>Peso</th>
                    <th>Altura</th>
                    <th>Alterar</th>
                    <th>Excluir</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for(Paciente c : pacienteDao.getLista()){  // inicio do laço de repetição                  
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getNascimento()%></td>
                    <td><%=c.getTelefone()%></td>
                    <td><%=c.getSexo()%></td>
                    <td><%=c.getHistorico()%></td>
                    <td><%=c.getPeso()%></td>
                    <td><%=c.getAltura()%></td>
                    <td><a href="ServletPaciente?acao=alterar&id=<%=c.getId()%>">Alterar</a></td>
                    <td><a href="ServletPaciente?acao=excluir&id=<%=c.getId()%>">Excluir</a></td>
                </tr>
                <%
                    } // fim do laço de repetição
                %>
            </tbody>
        </table>
    </body>
</html>
