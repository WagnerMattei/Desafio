package com.eits.desafio.domain.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.eits.desafio.domain.entity.Transacao;

@Repository
@Transactional
public interface ITransacoesRepository extends JpaRepository<Transacao, Long> 
{
	/**
	 * 
	 */
	

	/**
	 * 
	 * @param filter
	 * @param pageable
	 * @return
	 */
	
	@Query("SELECT u FROM Transacao u "
			+ "WHERE u.contaOrigem "
			+ "IN "
				+ "(SELECT d.numero FROM Conta d "
				+ "WHERE d.nome LIKE %:pFilter%) "
			+ "OR u.contaDestino "
			+ "IN "
				+ "(SELECT t.numero FROM Conta t "
				+ "WHERE t.nome LIKE %:pFilter%)")
	public Page<Transacao> listTransacoesByFilters(@Param("pFilter") String filter, Pageable pageable);
	
	
	@Query("SELECT u FROM Transacao u "
			+ "WHERE u.contaOrigem "
			+ "IN "
				+ "(SELECT d.numero FROM Conta d "
				+ "WHERE d.nome LIKE :pFilter) "
			+ "OR u.contaDestino "
			+ "IN "
				+ "(SELECT t.numero FROM Conta t "
				+ "WHERE t.nome LIKE :pFilter)")
	public List<Transacao> findByConta(@Param("pFilter") String filter);
}
