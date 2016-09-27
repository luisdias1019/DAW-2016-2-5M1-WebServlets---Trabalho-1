

<%@page import="br.edu.ifsul.modelo.Especialidade"%>
<%@page import="br.edu.ifsul.dao.DaoEspecialidade"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="especialidadeDao" scope="session"
             type="DaoEspecialidade"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de especialidades</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h2>Especialidades</h2>
        <h2><%=especialidadeDao.getMensagem()%></h2>
        <a href="ServletEspecialidade?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Descrição</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for(Especialidade c : especialidadeDao.getLista()){  // inicio do laço de repetição                  
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getDescricao()%></td>
                    
                    <td><a href="ServletEspecialidade?acao=alterar&id=<%=c.getId()%>">Alterar</a></td>
                    <td><a href="ServletEspecialidade?acao=excluir&id=<%=c.getId()%>">Excluir</a></td>
                </tr>
                <%
                    } // fim do laço de repetição
                %>
            </tbody>
        </table>
    </body>
</html>
