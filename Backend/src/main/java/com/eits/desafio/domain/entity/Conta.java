package com.eits.desafio.domain.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.directwebremoting.annotations.DataTransferObject;
import org.hibernate.envers.Audited;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;	


@Entity
@Table(name = "conta")
@DataTransferObject
@Audited
public class Conta
{
	
	/**
	 * 
	 */
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long numero;
	
	/**
	 * 
	 */
	
	@Column(unique = true, nullable = false)
	private String nome;
	
	/**
	 * 
	 */
	
	private String descricao;
	
	/**
	 * 
	 */
	
	//Data do cadastro da conta (preenchimento do formualrio)
	@JsonProperty(access = Access.READ_ONLY)
	@Column(name = "data_cadastro")
	private LocalDate dataCadastro;
	/**
	 * 
	 */
	
	//Data da ultima alteracao
	@JsonProperty(access = Access.READ_ONLY)
	@Column(name = "data_alteracao")
	private LocalDate dataAlteracao;
	
	/**
	 * 
	 */
	
	private Double saldo;
	
	/**
	 * 
	 */
	
	//Usuario que cirou a conta(preencheu o formulario)
	private Usuario criador;
	
	/**
	 * 
	 */
	//usuario que alterou a conta pela ultima vez
	@JoinColumn(name = "ultimo_alterador")
	private Usuario ultimoAlterador; 
	
	/**
	 * 
	 * constructor 
	 */
	
	public void constructor(Conta conta)
	{
		conta = new Conta();
	}
	
	/**
	 * 
	 * setters e getters
	 */
	
	public long getNumero() 
	{
		return numero;
	}

	public void setNumero(int numero)
	{
		this.numero = numero;
	}
	
	/**
	 * 
	 * 
	 */
	
	public double getSaldo() 
	{
		return saldo;
	}

	public void setSaldo(double saldo)
	{
		this.saldo = saldo;
	}
	
	/**
	 * 
	 * 
	 */

	public Usuario getUltimoAlterador() 
	{
		return ultimoAlterador;
	}
	

	public void setUltimoAlterador(Usuario ultimoAlterador) 
	{
		this.ultimoAlterador = ultimoAlterador;
	}
	
	/**
	 * 
	 * 
	 */
	
	public Usuario getCriador() 
	{
		return criador;
	}
	
	public void setCriador(Usuario criador) 
	{
		this.criador = criador;
	}
	
	/**
	 * 
	 * 
	 */
	
	public String getNome()
	{
		return nome;
	}
	
	public void setNome(String nome)
	{
		this.nome = nome;
	}
	
	/**
	 * 
	 * 
	 */
	
	public String getDescricao() 
	{
		return descricao;
	}
	
	public void setDescricao(String descricao) 
	{
		this.descricao = descricao;
	}
	
	/**
	 * 
	 * 
	 */
	@JsonProperty(access = Access.READ_ONLY)
	public LocalDate getDataCadastro() 
	{
		return dataCadastro;
	}
	@JsonProperty(access = Access.READ_ONLY)
	public void setDataCadastro(LocalDate dataCadastro)
	{
		this.dataCadastro = dataCadastro;
	}
	
	/**
	 * 
	 * 
	 */

	@JsonProperty(access= Access.READ_ONLY)
	public LocalDate getDataAlteracao() 
	{
		return dataAlteracao;
	}

	@JsonProperty(access= Access.READ_ONLY)
	public void setDataAlteracao(LocalDate data_alteracao)
	{
		this.dataAlteracao = data_alteracao;
	}
	

	
}
	
	