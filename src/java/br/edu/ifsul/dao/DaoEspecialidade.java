/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifsul.dao;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.modelo.Especialidade;
import br.edu.ifsul.util.Util;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

/**
 *
 * @author Luis
 */
public class DaoEspecialidade {
    // atributo para armazenar o objeto que está sendo editado
    private Especialidade objetoSelecionado;
    // mensagem para ser exibida ao usuário
    private String mensagem = "";
    // objeto responsável por realizar operações de persistencia
    private EntityManager em;

    public DaoEspecialidade() {
        // inicializando a entityManager
        em = EntityManagerUtil.getEntityManager();
    }

    /**
     * Método que valida um objeto verificando as anotações da bean validation
     * API e joga no atributo mensagem da classe DAO os erros de validação
     *
     * @param obj
     * @return se o objeto possui erros ou não
     */
    public boolean validaObjeto(Especialidade obj) {
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();
        Set<ConstraintViolation<Especialidade>> erros = validador.validate(obj);
        if (erros.size() > 0) { // se a lista de erros for maior que erro o objeto tem erro de validação
            mensagem = "";
            mensagem += "Objeto com erros: <br/>";
            for (ConstraintViolation<Especialidade> erro : erros) {
                mensagem += "Erro: " + erro.getMessage() + "<br/>";
            }
            return false;
        } else {
            return true;
        }
    }

    /**
     * Método que retorna uma lista de estados do banco de dados
     *
     * @return Lista de estados
     */
    public List<Especialidade> getLista() {
        return em.createQuery("from Especialidade order by nome").getResultList();
    }

    public boolean salvar(Especialidade obj) {
        try {
            em.getTransaction().begin();
            if (obj.getId() == null) { // se o ID é nulo é um objeto novo chama o método persist
                em.persist(obj);
            } else {
                em.merge(obj);
            }
            em.getTransaction().commit();
            mensagem = "Objeto persistido com sucesso!";
            return true;
        } catch (Exception e) { // se gerar um erro a transação deve executar um rollback para desfazer qualquer alteração
            if (em.getTransaction().isActive() == false) {
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "Erro ao persistir: " + Util.getMensagemErro(e);
            return false;
        }
    }
    
    public boolean remover(Especialidade obj){
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
            mensagem = "Objeto removido com sucesso!";
            return true;
        } catch(Exception e){
            if (em.getTransaction().isActive() == false){
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "Erro ao remover objeto: "+Util.getMensagemErro(e);
            return false;
        }
    }
    
    public Especialidade localizar(Integer id){
        return em.find(Especialidade.class, id);
    }

    public Especialidade getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Especialidade objetoSelecionado) {
        this.objetoSelecionado = objetoSelecionado;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }
}
