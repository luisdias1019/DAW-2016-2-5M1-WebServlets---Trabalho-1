

<%@page import="br.edu.ifsul.modelo.Medico"%>
<%@page import="br.edu.ifsul.dao.DaoMedico"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="daoMedico" scope="session"
             type="DaoMedico"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de pacientes</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h2>Medicos</h2>
        <h2><%=daoMedico.getMensagem()%></h2>
        <a href="ServletMedico?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Crm</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for(Medico c : daoMedico.getLista()){  // inicio do laço de repetição                  
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getCrm()%></td>
                    
                    <td><a href="ServletMedico?acao=alterar&id=<%=c.getId()%>">Alterar</a></td>
                    <td><a href="ServletMedico?acao=excluir&id=<%=c.getId()%>">Excluir</a></td>
                </tr>
                <%
                    } // fim do laço de repetição
                %>
            </tbody>
        </table>
    </body>
</html>
