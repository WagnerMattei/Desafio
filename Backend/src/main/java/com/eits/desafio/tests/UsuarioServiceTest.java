package com.eits.desafio.tests;

import org.hibernate.cfg.annotations.Nullability;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.eits.desafio.domain.entity.Permissoes;
import com.eits.desafio.domain.entity.Usuario;
import com.eits.desafio.domain.service.UsuarioService;


public class UsuarioServiceTest extends TesteIntegracao
{

	@Autowired
	private UsuarioService usuarioService;

	@Test
	public void insertAndListMustPass() 
	{
		
		Usuario usuario = new Usuario();
		
		usuario.setNome("Teste");
		usuario.setAtivo(true);
		usuario.setCelular("78456487");
		usuario.setCpf("02542322058");
		usuario.setEmail("teste@teste.com");
		usuario.setConfirmSenha("123");
		usuario.setEndereco("sfsdfds");
		usuario.setSenha("123");
		usuario.setPermissoes(Permissoes.ADMINISTRADOR);
		
		usuarioService.insert(usuario);
		
		Assert.assertNotNull(usuario.getNome());
		Assert.assertNotNull(usuario.getEmail());
		Assert.assertNotNull(usuario.getCpf());
		Assert.assertNotNull(usuario.getSenha());
		Assert.assertNotNull(usuario.isAtivo());
		Assert.assertNotNull(usuario.getPermissoes());
		
		
	}
	
	@Test(expected = NullPointerException.class)
	public void insertNotMustPass() 
	{
		Usuario usuario = new Usuario();
		
		usuario.setNome(null);
		usuario.setAtivo(true);
		usuario.setCelular(null);
		usuario.setCpf(null);
		usuario.setEmail(null);
		usuario.setConfirmSenha(null);
		usuario.setEndereco(null);
		usuario.setSenha(null);
		usuario.setPermissoes(null);
		
		
		usuarioService.insert(usuario);
	}
	
}