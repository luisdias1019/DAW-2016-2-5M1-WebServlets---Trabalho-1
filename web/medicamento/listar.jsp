

<%@page import="br.edu.ifsul.modelo.Medicamento"%>
<%@page import="br.edu.ifsul.dao.DaoMedicamento"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="medicamentoDao" scope="session"
             type="DaoMedicamento"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Listagem de medicamentos</title>
    </head>
    <body>
        <a href="../index.html">Início</a>
        <h2>Medicamentos</h2>
        <h2><%=medicamentoDao.getMensagem()%></h2>
        <a href="ServletMedicamento?acao=incluir">Incluir</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    
                </tr>
            </thead>
            <tbody>
                <% 
                    for(Medicamento c : medicamentoDao.getLista()){  // inicio do laço de repetição                  
                %>
                <tr>
                    <td><%=c.getId()%></td>
                    <td><%=c.getNome()%></td>
                    
                    <td><a href="ServletMedicamento?acao=alterar&id=<%=c.getId()%>">Alterar</a></td>
                    <td><a href="ServletMedicamento?acao=excluir&id=<%=c.getId()%>">Excluir</a></td>
                </tr>
                <%
                    } // fim do laço de repetição
                %>
            </tbody>
        </table>
    </body>
</html>
