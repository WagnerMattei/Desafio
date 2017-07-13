package com.eits.desafio.domain.entity;

import org.directwebremoting.annotations.DataTransferObject;
import org.springframework.security.core.GrantedAuthority;

@DataTransferObject(type = "enum")
public enum Permissoes implements GrantedAuthority
{
	/**
	 * 
	 */
	
	ADMINISTRADOR,
	COLABORADOR;
	

	
	
	@Override
	public String getAuthority()
	{
		return this.name();
	}

}
